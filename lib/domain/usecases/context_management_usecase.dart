import 'package:flutter/foundation.dart';
import '../entities/context_entity.dart';
import '../../data/services/context_service.dart';
import '../../data/services/voice_service.dart';

/// Result class for context submission
class SubmitContextResult {
  final ContextEntity context;
  final String message;

  SubmitContextResult({
    required this.context,
    required this.message,
  });
}

/// Result class for voice recording
class RecordingResult {
  final String filePath;
  final Duration duration;

  RecordingResult({
    required this.filePath,
    required this.duration,
  });
}

/// Context management use case
/// Handles all business logic related to context submission and management
class ContextManagementUseCase {
  final ContextService _contextService;
  final VoiceService _voiceService;

  ContextManagementUseCase({
    required ContextService contextService,
    required VoiceService voiceService,
  })  : _contextService = contextService,
        _voiceService = voiceService;

  /// Submit a text-based context
  Future<SubmitContextResult> submitTextContext({
    required String token,
    required int userId,
    required ContextType contextType,
    required String content,
    String? title,
    List<String> emotionTags = const [],
    int importanceLevel = 3,
    bool isCompanionInput = false,
    int? companionUserId,
  }) async {
    debugPrint('[ContextManagementUseCase] Submitting text context');

    // Validate input
    if (content.trim().isEmpty) {
      throw UseCaseException(
        '내용을 입력해주세요',
        code: 'EMPTY_CONTENT',
      );
    }

    if (importanceLevel < 1 || importanceLevel > 5) {
      throw UseCaseException(
        '중요도는 1-5 사이의 값이어야 합니다',
        code: 'INVALID_IMPORTANCE',
      );
    }

    if (isCompanionInput && companionUserId == null) {
      throw UseCaseException(
        '동행자 입력 시 동행자 ID가 필요합니다',
        code: 'MISSING_COMPANION_ID',
      );
    }

    try {
      final request = CreateContextRequest(
        contextType: contextType,
        title: title,
        content: content.trim(),
        inputMethod: InputMethod.text,
        emotionTags: emotionTags,
        importanceLevel: importanceLevel,
        isCompanionInput: isCompanionInput,
        companionUserId: companionUserId,
      );

      final response = await _contextService.createContext(
        token: token,
        userId: userId,
        request: request,
      );

      debugPrint('[ContextManagementUseCase] Text context submitted successfully');

      return SubmitContextResult(
        context: response.context,
        message: response.message,
      );
    } on ContextException catch (e) {
      debugPrint('[ContextManagementUseCase] Context service error: $e');
      throw UseCaseException(
        e.message,
        code: e.code,
      );
    } catch (e) {
      debugPrint('[ContextManagementUseCase] Unexpected error: $e');
      throw UseCaseException(
        '컨텍스트 제출에 실패했습니다: ${e.toString()}',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Submit a voice-based context
  Future<SubmitContextResult> submitVoiceContext({
    required String token,
    required int userId,
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
    debugPrint('[ContextManagementUseCase] Submitting voice context');

    // Validate input
    if (importanceLevel < 1 || importanceLevel > 5) {
      throw UseCaseException(
        '중요도는 1-5 사이의 값이어야 합니다',
        code: 'INVALID_IMPORTANCE',
      );
    }

    if (isCompanionInput && companionUserId == null) {
      throw UseCaseException(
        '동행자 입력 시 동행자 ID가 필요합니다',
        code: 'MISSING_COMPANION_ID',
      );
    }

    try {
      // Step 1: Upload voice file
      debugPrint('[ContextManagementUseCase] Uploading voice file');
      final uploadResponse = await _voiceService.uploadVoiceFile(
        token: token,
        filePath: voiceFilePath,
      );

      String content = transcribedText ?? '';

      // Step 2: Transcribe if needed and not provided
      if (autoTranscribe && (transcribedText == null || transcribedText.isEmpty)) {
        debugPrint('[ContextManagementUseCase] Transcribing voice');
        final transcription = await _contextService.transcribeVoice(
          token: token,
          voiceUrl: uploadResponse.voiceUrl,
        );
        content = transcription.text;
        debugPrint('[ContextManagementUseCase] Transcription: $content');
      }

      // Validate content
      if (content.trim().isEmpty) {
        throw UseCaseException(
          '음성 내용이 비어있습니다. 다시 녹음해주세요',
          code: 'EMPTY_TRANSCRIPTION',
        );
      }

      // Step 3: Create context with voice
      final request = CreateContextRequest(
        contextType: contextType,
        title: title,
        content: content.trim(),
        voiceUrl: uploadResponse.voiceUrl,
        voiceDurationSeconds: uploadResponse.durationSeconds,
        inputMethod: InputMethod.voice,
        emotionTags: emotionTags,
        importanceLevel: importanceLevel,
        isCompanionInput: isCompanionInput,
        companionUserId: companionUserId,
      );

      final response = await _contextService.createContext(
        token: token,
        userId: userId,
        request: request,
      );

      debugPrint('[ContextManagementUseCase] Voice context submitted successfully');

      return SubmitContextResult(
        context: response.context,
        message: response.message,
      );
    } on VoiceException catch (e) {
      debugPrint('[ContextManagementUseCase] Voice service error: $e');
      throw UseCaseException(
        '음성 처리 중 오류가 발생했습니다: ${e.message}',
        code: e.code,
      );
    } on ContextException catch (e) {
      debugPrint('[ContextManagementUseCase] Context service error: $e');
      throw UseCaseException(
        e.message,
        code: e.code,
      );
    } catch (e) {
      debugPrint('[ContextManagementUseCase] Unexpected error: $e');
      throw UseCaseException(
        '컨텍스트 제출에 실패했습니다: ${e.toString()}',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Get recommended emotion tags based on content
  Future<List<String>> getRecommendedEmotionTags({
    required String token,
    required String content,
  }) async {
    debugPrint('[ContextManagementUseCase] Getting recommended emotion tags');

    if (content.trim().isEmpty) {
      debugPrint('[ContextManagementUseCase] Content is empty, returning empty tags');
      return [];
    }

    try {
      final response = await _contextService.getRecommendedEmotionTags(
        token: token,
        content: content,
      );

      debugPrint(
        '[ContextManagementUseCase] Recommended tags: ${response.recommendedTags} (confidence: ${response.confidence})',
      );

      // Only return tags if confidence is above threshold
      if (response.confidence >= 0.5) {
        return response.recommendedTags;
      } else {
        debugPrint('[ContextManagementUseCase] Confidence too low, returning empty tags');
        return [];
      }
    } on ContextException catch (e) {
      debugPrint('[ContextManagementUseCase] Context service error: $e');
      // Return empty list on error to not block user flow
      return [];
    } catch (e) {
      debugPrint('[ContextManagementUseCase] Unexpected error: $e');
      // Return empty list on error to not block user flow
      return [];
    }
  }

  /// Get user contexts with optional filtering
  Future<List<ContextEntity>> getUserContexts({
    required String token,
    required int userId,
    int page = 1,
    int limit = 20,
    ContextType? contextType,
  }) async {
    debugPrint('[ContextManagementUseCase] Getting user contexts (page: $page, limit: $limit)');

    try {
      final contexts = await _contextService.getUserContexts(
        token: token,
        userId: userId,
        page: page,
        limit: limit,
        contextType: contextType,
      );

      debugPrint('[ContextManagementUseCase] Fetched ${contexts.length} contexts');
      return contexts;
    } on ContextException catch (e) {
      debugPrint('[ContextManagementUseCase] Context service error: $e');
      throw UseCaseException(
        e.message,
        code: e.code,
      );
    } catch (e) {
      debugPrint('[ContextManagementUseCase] Unexpected error: $e');
      throw UseCaseException(
        '컨텍스트 조회에 실패했습니다: ${e.toString()}',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Get a single context by ID
  Future<ContextEntity> getContextById({
    required String token,
    required int userId,
    required int contextId,
  }) async {
    debugPrint('[ContextManagementUseCase] Getting context: $contextId');

    try {
      final context = await _contextService.getContextById(
        token: token,
        userId: userId,
        contextId: contextId,
      );

      debugPrint('[ContextManagementUseCase] Fetched context successfully');
      return context;
    } on ContextException catch (e) {
      debugPrint('[ContextManagementUseCase] Context service error: $e');
      throw UseCaseException(
        e.message,
        code: e.code,
      );
    } catch (e) {
      debugPrint('[ContextManagementUseCase] Unexpected error: $e');
      throw UseCaseException(
        '컨텍스트 조회에 실패했습니다: ${e.toString()}',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Update an existing context
  Future<ContextEntity> updateContext({
    required String token,
    required int userId,
    required int contextId,
    required ContextType contextType,
    required String content,
    String? title,
    String? voiceUrl,
    int? voiceDurationSeconds,
    required InputMethod inputMethod,
    List<String> emotionTags = const [],
    int importanceLevel = 3,
    bool isCompanionInput = false,
    int? companionUserId,
  }) async {
    debugPrint('[ContextManagementUseCase] Updating context: $contextId');

    // Validate input
    if (content.trim().isEmpty) {
      throw UseCaseException(
        '내용을 입력해주세요',
        code: 'EMPTY_CONTENT',
      );
    }

    if (importanceLevel < 1 || importanceLevel > 5) {
      throw UseCaseException(
        '중요도는 1-5 사이의 값이어야 합니다',
        code: 'INVALID_IMPORTANCE',
      );
    }

    try {
      final request = CreateContextRequest(
        contextType: contextType,
        title: title,
        content: content.trim(),
        voiceUrl: voiceUrl,
        voiceDurationSeconds: voiceDurationSeconds,
        inputMethod: inputMethod,
        emotionTags: emotionTags,
        importanceLevel: importanceLevel,
        isCompanionInput: isCompanionInput,
        companionUserId: companionUserId,
      );

      final context = await _contextService.updateContext(
        token: token,
        userId: userId,
        contextId: contextId,
        request: request,
      );

      debugPrint('[ContextManagementUseCase] Context updated successfully');
      return context;
    } on ContextException catch (e) {
      debugPrint('[ContextManagementUseCase] Context service error: $e');
      throw UseCaseException(
        e.message,
        code: e.code,
      );
    } catch (e) {
      debugPrint('[ContextManagementUseCase] Unexpected error: $e');
      throw UseCaseException(
        '컨텍스트 수정에 실패했습니다: ${e.toString()}',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Delete a context
  Future<void> deleteContext({
    required String token,
    required int userId,
    required int contextId,
  }) async {
    debugPrint('[ContextManagementUseCase] Deleting context: $contextId');

    try {
      await _contextService.deleteContext(
        token: token,
        userId: userId,
        contextId: contextId,
      );

      debugPrint('[ContextManagementUseCase] Context deleted successfully');
    } on ContextException catch (e) {
      debugPrint('[ContextManagementUseCase] Context service error: $e');
      throw UseCaseException(
        e.message,
        code: e.code,
      );
    } catch (e) {
      debugPrint('[ContextManagementUseCase] Unexpected error: $e');
      throw UseCaseException(
        '컨텍스트 삭제에 실패했습니다: ${e.toString()}',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Start voice recording
  Future<void> startVoiceRecording() async {
    debugPrint('[ContextManagementUseCase] Starting voice recording');

    try {
      // Check permission first
      final hasPermission = await _voiceService.hasPermission();
      if (!hasPermission) {
        throw UseCaseException(
          '마이크 권한이 필요합니다',
          code: 'PERMISSION_DENIED',
        );
      }

      await _voiceService.startRecording();
      debugPrint('[ContextManagementUseCase] Voice recording started');
    } on VoiceException catch (e) {
      debugPrint('[ContextManagementUseCase] Voice service error: $e');
      throw UseCaseException(
        '녹음 시작에 실패했습니다: ${e.message}',
        code: e.code,
      );
    } catch (e) {
      debugPrint('[ContextManagementUseCase] Unexpected error: $e');
      throw UseCaseException(
        '녹음 시작에 실패했습니다: ${e.toString()}',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Stop voice recording
  Future<RecordingResult> stopVoiceRecording() async {
    debugPrint('[ContextManagementUseCase] Stopping voice recording');

    try {
      final duration = _voiceService.currentDuration;
      final filePath = await _voiceService.stopRecording();

      debugPrint('[ContextManagementUseCase] Recording stopped: $filePath (${duration.inSeconds}s)');

      // Validate minimum duration (e.g., 1 second)
      if (duration.inSeconds < 1) {
        throw UseCaseException(
          '녹음 시간이 너무 짧습니다 (최소 1초)',
          code: 'RECORDING_TOO_SHORT',
        );
      }

      return RecordingResult(
        filePath: filePath,
        duration: duration,
      );
    } on VoiceException catch (e) {
      debugPrint('[ContextManagementUseCase] Voice service error: $e');
      throw UseCaseException(
        '녹음 중지에 실패했습니다: ${e.message}',
        code: e.code,
      );
    } catch (e) {
      if (e is UseCaseException) rethrow;
      debugPrint('[ContextManagementUseCase] Unexpected error: $e');
      throw UseCaseException(
        '녹음 중지에 실패했습니다: ${e.toString()}',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Pause voice recording
  Future<void> pauseVoiceRecording() async {
    debugPrint('[ContextManagementUseCase] Pausing voice recording');

    try {
      await _voiceService.pauseRecording();
      debugPrint('[ContextManagementUseCase] Voice recording paused');
    } on VoiceException catch (e) {
      debugPrint('[ContextManagementUseCase] Voice service error: $e');
      throw UseCaseException(
        '녹음 일시정지에 실패했습니다: ${e.message}',
        code: e.code,
      );
    } catch (e) {
      debugPrint('[ContextManagementUseCase] Unexpected error: $e');
      throw UseCaseException(
        '녹음 일시정지에 실패했습니다: ${e.toString()}',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Resume voice recording
  Future<void> resumeVoiceRecording() async {
    debugPrint('[ContextManagementUseCase] Resuming voice recording');

    try {
      await _voiceService.resumeRecording();
      debugPrint('[ContextManagementUseCase] Voice recording resumed');
    } on VoiceException catch (e) {
      debugPrint('[ContextManagementUseCase] Voice service error: $e');
      throw UseCaseException(
        '녹음 재개에 실패했습니다: ${e.message}',
        code: e.code,
      );
    } catch (e) {
      debugPrint('[ContextManagementUseCase] Unexpected error: $e');
      throw UseCaseException(
        '녹음 재개에 실패했습니다: ${e.toString()}',
        code: 'UNKNOWN_ERROR',
      );
    }
  }

  /// Cancel voice recording
  Future<void> cancelVoiceRecording() async {
    debugPrint('[ContextManagementUseCase] Cancelling voice recording');

    try {
      await _voiceService.cancelRecording();
      debugPrint('[ContextManagementUseCase] Voice recording cancelled');
    } on VoiceException catch (e) {
      debugPrint('[ContextManagementUseCase] Voice service error: $e');
      // Don't throw exception on cancel, just log
      debugPrint('[ContextManagementUseCase] Error ignored during cancel');
    } catch (e) {
      debugPrint('[ContextManagementUseCase] Unexpected error: $e');
      // Don't throw exception on cancel, just log
      debugPrint('[ContextManagementUseCase] Error ignored during cancel');
    }
  }

  /// Get current recording state
  RecordingState get recordingState => _voiceService.state;

  /// Get current recording duration
  Duration get recordingDuration => _voiceService.currentDuration;

  /// Request microphone permission
  Future<bool> requestMicrophonePermission() async {
    debugPrint('[ContextManagementUseCase] Requesting microphone permission');
    return await _voiceService.requestPermission();
  }

  /// Dispose resources
  Future<void> dispose() async {
    debugPrint('[ContextManagementUseCase] Disposing resources');
    await _voiceService.dispose();
  }
}

/// Custom exception for use case errors
class UseCaseException implements Exception {
  final String message;
  final String? code;

  UseCaseException(this.message, {this.code});

  @override
  String toString() =>
      'UseCaseException: $message${code != null ? ' ($code)' : ''}';
}
