import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/context_state.dart';
import '../entities/context_entity.dart';
import '../usecases/context_management_usecase.dart';
import '../../data/services/voice_service.dart';

/// Context notifier for managing context submission
class ContextNotifier extends StateNotifier<ContextState> {
  final ContextManagementUseCase _useCase;
  final String _token;
  final int _userId;

  ContextNotifier({
    required ContextManagementUseCase useCase,
    required String token,
    required int userId,
  })  : _useCase = useCase,
        _token = token,
        _userId = userId,
        super(const ContextState.idle());

  /// Submit text context
  Future<void> submitTextContext({
    required ContextType contextType,
    required String content,
    String? title,
    List<String> emotionTags = const [],
    int importanceLevel = 3,
    bool isCompanionInput = false,
    int? companionUserId,
  }) async {
    state = const ContextState.submitting(message: '컨텍스트를 제출하는 중...');

    try {
      final result = await _useCase.submitTextContext(
        token: _token,
        userId: _userId,
        contextType: contextType,
        content: content,
        title: title,
        emotionTags: emotionTags,
        importanceLevel: importanceLevel,
        isCompanionInput: isCompanionInput,
        companionUserId: companionUserId,
      );

      state = ContextState.success(
        context: result.context,
        message: result.message,
      );
    } on UseCaseException catch (e) {
      debugPrint('[ContextNotifier] Submit text context error: $e');
      state = ContextState.error(
        message: e.message,
        code: e.code,
      );
    } catch (e) {
      debugPrint('[ContextNotifier] Unexpected error: $e');
      state = ContextState.error(
        message: '알 수 없는 오류가 발생했습니다',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Submit voice context
  Future<void> submitVoiceContext({
    required ContextType contextType,
    required String voiceFilePath,
    String? title,
    String? transcribedText,
    List<String> emotionTags = const [],
    int importanceLevel = 3,
    bool isCompanionInput = false,
    int? companionUserId,
    bool autoTranscribe = true,
  }) async {
    state = const ContextState.submitting(message: '음성을 업로드하는 중...');

    try {
      final result = await _useCase.submitVoiceContext(
        token: _token,
        userId: _userId,
        contextType: contextType,
        voiceFilePath: voiceFilePath,
        title: title,
        transcribedText: transcribedText,
        emotionTags: emotionTags,
        importanceLevel: importanceLevel,
        isCompanionInput: isCompanionInput,
        companionUserId: companionUserId,
        autoTranscribe: autoTranscribe,
      );

      state = ContextState.success(
        context: result.context,
        message: result.message,
      );
    } on UseCaseException catch (e) {
      debugPrint('[ContextNotifier] Submit voice context error: $e');
      state = ContextState.error(
        message: e.message,
        code: e.code,
      );
    } catch (e) {
      debugPrint('[ContextNotifier] Unexpected error: $e');
      state = ContextState.error(
        message: '알 수 없는 오류가 발생했습니다',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Start voice recording
  Future<void> startRecording() async {
    try {
      await _useCase.startVoiceRecording();
      _updateRecordingState();
    } on UseCaseException catch (e) {
      debugPrint('[ContextNotifier] Start recording error: $e');
      state = ContextState.error(
        message: e.message,
        code: e.code,
      );
    } catch (e) {
      debugPrint('[ContextNotifier] Unexpected error: $e');
      state = ContextState.error(
        message: '녹음 시작에 실패했습니다',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Stop voice recording
  Future<RecordingResult?> stopRecording() async {
    try {
      final result = await _useCase.stopVoiceRecording();
      state = const ContextState.idle();
      return result;
    } on UseCaseException catch (e) {
      debugPrint('[ContextNotifier] Stop recording error: $e');
      state = ContextState.error(
        message: e.message,
        code: e.code,
      );
      return null;
    } catch (e) {
      debugPrint('[ContextNotifier] Unexpected error: $e');
      state = ContextState.error(
        message: '녹음 중지에 실패했습니다',
        code: 'UNKNOWN_ERROR',
      );
      return null;
    }
  }

  /// Pause voice recording
  Future<void> pauseRecording() async {
    try {
      await _useCase.pauseVoiceRecording();
      _updateRecordingState();
    } on UseCaseException catch (e) {
      debugPrint('[ContextNotifier] Pause recording error: $e');
      state = ContextState.error(
        message: e.message,
        code: e.code,
      );
    } catch (e) {
      debugPrint('[ContextNotifier] Unexpected error: $e');
      state = ContextState.error(
        message: '녹음 일시정지에 실패했습니다',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Resume voice recording
  Future<void> resumeRecording() async {
    try {
      await _useCase.resumeVoiceRecording();
      _updateRecordingState();
    } on UseCaseException catch (e) {
      debugPrint('[ContextNotifier] Resume recording error: $e');
      state = ContextState.error(
        message: e.message,
        code: e.code,
      );
    } catch (e) {
      debugPrint('[ContextNotifier] Unexpected error: $e');
      state = ContextState.error(
        message: '녹음 재개에 실패했습니다',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Cancel voice recording
  Future<void> cancelRecording() async {
    await _useCase.cancelVoiceRecording();
    state = const ContextState.idle();
  }

  /// Update recording state
  void _updateRecordingState() {
    state = ContextState.recording(
      recordingState: _useCase.recordingState,
      duration: _useCase.recordingDuration,
    );
  }

  /// Request microphone permission
  Future<bool> requestMicrophonePermission() async {
    return await _useCase.requestMicrophonePermission();
  }

  /// Reset state to idle
  void resetState() {
    state = const ContextState.idle();
  }

  @override
  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}

/// Context list notifier for managing context list
class ContextListNotifier extends StateNotifier<ContextListState> {
  final ContextManagementUseCase _useCase;
  final String _token;
  final int _userId;

  ContextListNotifier({
    required ContextManagementUseCase useCase,
    required String token,
    required int userId,
  })  : _useCase = useCase,
        _token = token,
        _userId = userId,
        super(const ContextListState.initial());

  /// Load contexts
  Future<void> loadContexts({
    int page = 1,
    int limit = 20,
    ContextType? contextType,
  }) async {
    if (page == 1) {
      state = const ContextListState.loading();
    }

    try {
      final contexts = await _useCase.getUserContexts(
        token: _token,
        userId: _userId,
        page: page,
        limit: limit,
        contextType: contextType,
      );

      final hasMore = contexts.length >= limit;

      if (page == 1) {
        state = ContextListState.loaded(
          contexts: contexts,
          currentPage: page,
          hasMore: hasMore,
        );
      } else {
        state.whenOrNull(
          loaded: (existingContexts, currentPage, _) {
            state = ContextListState.loaded(
              contexts: [...existingContexts, ...contexts],
              currentPage: page,
              hasMore: hasMore,
            );
          },
        );
      }
    } on UseCaseException catch (e) {
      debugPrint('[ContextListNotifier] Load contexts error: $e');
      state = ContextListState.error(
        message: e.message,
        code: e.code,
      );
    } catch (e) {
      debugPrint('[ContextListNotifier] Unexpected error: $e');
      state = const ContextListState.error(
        message: '컨텍스트 목록을 불러오는데 실패했습니다',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Refresh contexts
  Future<void> refreshContexts({ContextType? contextType}) async {
    await loadContexts(page: 1, contextType: contextType);
  }

  /// Load more contexts
  Future<void> loadMoreContexts({ContextType? contextType}) async {
    state.whenOrNull(
      loaded: (contexts, currentPage, hasMore) {
        if (hasMore) {
          loadContexts(page: currentPage + 1, contextType: contextType);
        }
      },
    );
  }
}

/// Emotion tags notifier for managing emotion tags recommendation
class EmotionTagsNotifier extends StateNotifier<EmotionTagsState> {
  final ContextManagementUseCase _useCase;
  final String _token;

  EmotionTagsNotifier({
    required ContextManagementUseCase useCase,
    required String token,
  })  : _useCase = useCase,
        _token = token,
        super(const EmotionTagsState.initial());

  /// Get recommended emotion tags
  Future<void> getRecommendedTags(String content) async {
    if (content.trim().isEmpty) {
      state = const EmotionTagsState.initial();
      return;
    }

    state = const EmotionTagsState.loading();

    try {
      final tags = await _useCase.getRecommendedEmotionTags(
        token: _token,
        content: content,
      );

      state = EmotionTagsState.loaded(recommendedTags: tags);
    } catch (e) {
      debugPrint('[EmotionTagsNotifier] Get recommended tags error: $e');
      // Don't set error state, just return to initial
      // This is not critical to user flow
      state = const EmotionTagsState.initial();
    }
  }

  /// Reset state
  void reset() {
    state = const EmotionTagsState.initial();
  }
}
