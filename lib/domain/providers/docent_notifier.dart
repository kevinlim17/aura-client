import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/docent_state.dart';
import '../entities/docent_entity.dart';
import '../../data/services/docent_service.dart';
import '../../core/accessibility/tts_service.dart';

/// TTS messages for docent operations
class DocentTtsMessages {
  static const String generationStart = '도슨트 생성을 시작합니다. 잠시만 기다려주세요.';
  static const String generationProgress = '도슨트를 생성하는 중입니다.';
  static const String generationComplete = '도슨트 생성이 완료되었습니다. 재생을 시작합니다.';
  static const String generationFailed = '도슨트 생성에 실패했습니다. 다시 시도해주세요.';
  static const String playbackStart = '도슨트 재생을 시작합니다.';
  static const String playbackPause = '재생을 일시정지했습니다.';
  static const String playbackResume = '재생을 재개합니다.';
  static const String playbackComplete = '도슨트 재생이 완료되었습니다.';
}

/// Docent notifier for managing docent generation and playback
///
/// Polling Strategy:
/// - Interval: 2 seconds between each poll
/// - Timeout: 3 minutes absolute maximum
/// - Progress: Updated in real-time (0-100%)
/// - Cancellable: Call cancelGeneration() to stop polling
/// - Auto-stop: Polling stops when status is COMPLETED or FAILED
class DocentNotifier extends StateNotifier<DocentState> {
  final DocentService _docentService;
  final TtsService _ttsService;
  final String _accessToken;

  Timer? _pollingTimer;
  DateTime? _generationStartTime;

  /// Default polling interval: 2 seconds
  static const Duration _pollingInterval = Duration(seconds: 2);

  /// Default timeout: 3 minutes (as per API specification)
  static const Duration _defaultTimeout = Duration(minutes: 3);

  DocentNotifier({
    required DocentService docentService,
    required TtsService ttsService,
    required String accessToken,
  })  : _docentService = docentService,
        _ttsService = ttsService,
        _accessToken = accessToken,
        super(const DocentState.initial());

  @override
  void dispose() {
    _pollingTimer?.cancel();
    super.dispose();
  }

  // ============================================================
  // Docent Generation
  // ============================================================

  /// Generate docent for an artwork
  Future<void> generateDocent({
    required int userId,
    required int artworkId,
    NarrativeStyle? narrativeStyle,
    PreferredLength? preferredLength,
    bool includeCompanionContext = false,
    bool useFewShotExamples = true,
    String? customPrompt,
  }) async {
    try {
      debugPrint('[DocentNotifier] Starting docent generation for artwork $artworkId');

      // Announce generation start
      await _ttsService.speak(DocentTtsMessages.generationStart);

      final request = DocentGenerationRequest(
        userId: userId,
        artworkId: artworkId,
        narrativeStyle: narrativeStyle,
        preferredLength: preferredLength,
        includeCompanionContext: includeCompanionContext,
        useFewShotExamples: useFewShotExamples,
        customPrompt: customPrompt,
      );

      final result = await _docentService.generateDocent(
        accessToken: _accessToken,
        request: request,
      );

      debugPrint('[DocentNotifier] Generation initiated: sessionId=${result.sessionId}, status=${result.status}');

      if (result.isCompleted && result.result != null) {
        // Synchronous response - docent is ready immediately
        debugPrint('[DocentNotifier] Docent generated immediately');
        state = DocentState.completed(session: result.result!);
        await _ttsService.speak(DocentTtsMessages.generationComplete);
      } else if (result.isGenerating) {
        // Asynchronous response - start polling
        debugPrint('[DocentNotifier] Starting polling for session ${result.sessionId}');
        _generationStartTime = DateTime.now();

        // Estimate time based on preferred length (default: 2 minutes for medium)
        final estimatedTime = _estimateGenerationTime(preferredLength);

        state = DocentState.generating(
          sessionId: result.sessionId,
          estimatedTimeSeconds: estimatedTime,
          progress: result.progress ?? 0,
          startTime: _generationStartTime,
        );

        _startPolling(result.sessionId, estimatedTime);
      } else if (result.isFailed) {
        // Generation failed immediately
        debugPrint('[DocentNotifier] Generation failed: ${result.errorMessage}');
        state = DocentState.failed(
          errorMessage: result.errorMessage ?? 'Unknown error',
          sessionId: result.sessionId,
        );
        await _ttsService.speak(DocentTtsMessages.generationFailed);
      }
    } catch (e) {
      debugPrint('[DocentNotifier] Generation error: $e');
      state = DocentState.failed(errorMessage: e.toString());
      await _ttsService.speak(DocentTtsMessages.generationFailed);
    }
  }

  /// Estimate generation time based on preferred length
  int _estimateGenerationTime(PreferredLength? length) {
    switch (length) {
      case PreferredLength.short:
        return 60; // 1 minute
      case PreferredLength.long:
        return 180; // 3 minutes
      case PreferredLength.medium:
      case null:
        return 120; // 2 minutes
    }
  }

  /// Start polling for docent generation status
  /// Maximum polling time is 3 minutes as per API specification
  void _startPolling(int sessionId, int estimatedTimeSeconds) {
    _pollingTimer?.cancel();

    // Maximum polling timeout: 3 minutes (absolute, not relative to estimate)
    final timeoutTime = DateTime.now().add(_defaultTimeout);

    _pollingTimer = Timer.periodic(_pollingInterval, (timer) async {
      try {
        // Check timeout
        if (DateTime.now().isAfter(timeoutTime)) {
          debugPrint('[DocentNotifier] Polling timeout reached');
          timer.cancel();
          state = DocentState.failed(
            errorMessage: 'Generation timeout exceeded',
            sessionId: sessionId,
          );
          await _ttsService.speak(DocentTtsMessages.generationFailed);
          return;
        }

        debugPrint('[DocentNotifier] Polling status for session $sessionId');

        final result = await _docentService.pollDocentStatus(
          accessToken: _accessToken,
          sessionId: sessionId,
        );

        debugPrint('[DocentNotifier] Poll result: status=${result.status}, progress=${result.progress}');

        if (result.isCompleted && result.result != null) {
          // Generation completed
          debugPrint('[DocentNotifier] Generation completed');
          timer.cancel();
          state = DocentState.completed(session: result.result!);
          await _ttsService.speak(DocentTtsMessages.generationComplete);
        } else if (result.isGenerating) {
          // Still generating - update progress
          state = state.maybeWhen(
            generating: (id, estimatedTime, _, startTime) {
              return DocentState.generating(
                sessionId: id,
                estimatedTimeSeconds: estimatedTime,
                progress: result.progress ?? 0,
                startTime: startTime,
              );
            },
            orElse: () => state,
          );
        } else if (result.isFailed) {
          // Generation failed
          debugPrint('[DocentNotifier] Generation failed: ${result.errorMessage}');
          timer.cancel();
          state = DocentState.failed(
            errorMessage: result.errorMessage ?? 'Unknown error',
            sessionId: sessionId,
          );
          await _ttsService.speak(DocentTtsMessages.generationFailed);
        }
      } catch (e) {
        debugPrint('[DocentNotifier] Polling error: $e');
        // Don't fail immediately - network might recover
        // Continue polling unless it's a permanent error
        if (e.toString().contains('session not found') ||
            e.toString().contains('404')) {
          timer.cancel();
          state = DocentState.failed(
            errorMessage: 'Docent session not found',
            sessionId: sessionId,
          );
          await _ttsService.speak(DocentTtsMessages.generationFailed);
        }
      }
    });
  }

  /// Cancel ongoing generation
  void cancelGeneration() {
    _pollingTimer?.cancel();
    state = const DocentState.initial();
  }

  // ============================================================
  // Playback Statistics
  // ============================================================

  /// Update playback statistics
  Future<void> updatePlaybackStats({
    required int sessionId,
    required int playCount,
    required int totalListeningSeconds,
    required double completionRate,
  }) async {
    try {
      debugPrint('[DocentNotifier] Updating playback stats for session $sessionId');

      final stats = PlaybackStatsRequest(
        playCount: playCount,
        totalListeningSeconds: totalListeningSeconds,
        completionRate: completionRate,
      );

      final updatedSession = await _docentService.updatePlaybackStats(
        accessToken: _accessToken,
        sessionId: sessionId,
        stats: stats,
      );

      debugPrint('[DocentNotifier] Playback stats updated successfully');

      // Update state if this is the current session
      state = state.maybeWhen(
        completed: (session) {
          if (session.id == sessionId) {
            return DocentState.completed(session: updatedSession);
          }
          return state;
        },
        orElse: () => state,
      );
    } catch (e) {
      debugPrint('[DocentNotifier] Failed to update playback stats: $e');
      // Don't fail the state - this is a background operation
    }
  }

  // ============================================================
  // TTS Control
  // ============================================================

  /// Speak docent content via TTS
  Future<void> speakDocent(DocentSessionEntity session) async {
    await _ttsService.speak(DocentTtsMessages.playbackStart);
    await Future.delayed(const Duration(milliseconds: 500));
    await _ttsService.speak(session.generatedText);
  }

  /// Pause TTS playback
  Future<void> pauseTts() async {
    await _ttsService.stop();
    await _ttsService.speak(DocentTtsMessages.playbackPause);
  }

  /// Resume TTS playback
  Future<void> resumeTts(String text) async {
    await _ttsService.speak(DocentTtsMessages.playbackResume);
    await Future.delayed(const Duration(milliseconds: 500));
    await _ttsService.speak(text);
  }

  /// Stop TTS playback
  Future<void> stopTts() async {
    await _ttsService.stop();
  }

  // ============================================================
  // State Management
  // ============================================================

  /// Reset docent state
  void reset() {
    _pollingTimer?.cancel();
    state = const DocentState.initial();
  }
}
