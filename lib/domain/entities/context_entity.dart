import 'package:freezed_annotation/freezed_annotation.dart';

part 'context_entity.freezed.dart';
part 'context_entity.g.dart';

/// Context type as defined by the API
enum ContextType {
  @JsonValue('MEMORY')
  memory,
  @JsonValue('EXPERIENCE')
  experience,
  @JsonValue('EMOTION')
  emotion,
  @JsonValue('TRAVEL')
  travel,
}

/// Input method for context
enum InputMethod {
  @JsonValue('TEXT')
  text,
  @JsonValue('VOICE')
  voice,
}

/// Context entity representing user-submitted context
@freezed
class ContextEntity with _$ContextEntity {
  const factory ContextEntity({
    required int id,
    required int userId,
    required ContextType contextType,
    String? title,
    required String content,
    String? voiceUrl,
    int? voiceDurationSeconds,
    required InputMethod inputMethod,
    @Default([]) List<String> emotionTags,
    @Default(3) int importanceLevel,
    @Default(false) bool isCompanionInput,
    int? companionUserId,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _ContextEntity;

  factory ContextEntity.fromJson(Map<String, dynamic> json) =>
      _$ContextEntityFromJson(json);
}

/// Request model for creating a new context
@freezed
class CreateContextRequest with _$CreateContextRequest {
  const factory CreateContextRequest({
    required ContextType contextType,
    String? title,
    required String content,
    String? voiceUrl,
    int? voiceDurationSeconds,
    required InputMethod inputMethod,
    @Default([]) List<String> emotionTags,
    @Default(3) int importanceLevel,
    @Default(false) bool isCompanionInput,
    int? companionUserId,
  }) = _CreateContextRequest;

  factory CreateContextRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateContextRequestFromJson(json);
}

/// Extension for context type helpers
extension ContextTypeX on ContextType {
  /// Get display name for context type
  String get displayName {
    switch (this) {
      case ContextType.memory:
        return '기억';
      case ContextType.experience:
        return '경험';
      case ContextType.emotion:
        return '감정';
      case ContextType.travel:
        return '여행';
    }
  }

  /// Get icon for context type
  String get icon {
    switch (this) {
      case ContextType.memory:
        return '💭';
      case ContextType.experience:
        return '✨';
      case ContextType.emotion:
        return '❤️';
      case ContextType.travel:
        return '🌍';
    }
  }

  /// Get description for context type
  String get description {
    switch (this) {
      case ContextType.memory:
        return '소중한 추억을 기록하세요';
      case ContextType.experience:
        return '특별한 경험을 공유하세요';
      case ContextType.emotion:
        return '지금의 감정을 표현하세요';
      case ContextType.travel:
        return '여행의 순간을 남기세요';
    }
  }
}

/// Extension for context entity helpers
extension ContextEntityX on ContextEntity {
  /// Check if context has voice
  bool get hasVoice => voiceUrl != null && voiceUrl!.isNotEmpty;

  /// Get formatted duration
  String get formattedDuration {
    if (voiceDurationSeconds == null) return '';
    final duration = Duration(seconds: voiceDurationSeconds!);
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  /// Check if high importance
  bool get isHighImportance => importanceLevel >= 4;

  /// Get importance label
  String get importanceLabel {
    switch (importanceLevel) {
      case 1:
        return '매우 낮음';
      case 2:
        return '낮음';
      case 3:
        return '보통';
      case 4:
        return '높음';
      case 5:
        return '매우 높음';
      default:
        return '보통';
    }
  }
}
