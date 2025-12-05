import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/memo_entity.dart';

part 'memo_response.freezed.dart';
part 'memo_response.g.dart';

/// Memo response from API
@freezed
class MemoResponse with _$MemoResponse {
  const factory MemoResponse({
    required int id,
    required int userId,
    required String content,
    int? artworkId,
    int? docentSessionId,
    String? voiceUrl,
    int? voiceDurationSeconds,
    required String inputMethod,
    List<String>? tags,
    String? category,
    bool? isSharedWithCompanion,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _MemoResponse;

  const MemoResponse._();

  factory MemoResponse.fromJson(Map<String, dynamic> json) =>
      _$MemoResponseFromJson(json);

  /// Convert response to domain entity
  MemoEntity toEntity() {
    return MemoEntity(
      content: content,
      inputMethod: _parseInputMethod(inputMethod),
      voiceUrl: voiceUrl,
      voiceDurationSeconds: voiceDurationSeconds,
      category: category != null ? _parseCategory(category!) : null,
      tags: tags,
      artworkId: artworkId,
      docentSessionId: docentSessionId,
      isSharedWithCompanion: isSharedWithCompanion,
    );
  }

  /// Parse input method from API string
  static InputMethod _parseInputMethod(String value) {
    switch (value.toUpperCase()) {
      case 'TEXT':
        return InputMethod.text;
      case 'VOICE':
        return InputMethod.voice;
      default:
        return InputMethod.text;
    }
  }

  /// Parse category from API string
  static MemoCategory _parseCategory(String value) {
    switch (value.toUpperCase()) {
      case 'THOUGHT':
        return MemoCategory.thought;
      case 'QUESTION':
        return MemoCategory.question;
      case 'REMINDER':
        return MemoCategory.reminder;
      case 'INSIGHT':
        return MemoCategory.insight;
      default:
        return MemoCategory.thought;
    }
  }
}

/// API response wrapper for memo
@freezed
class MemoApiResponse with _$MemoApiResponse {
  const factory MemoApiResponse({
    required bool success,
    required MemoResponse data,
    String? message,
  }) = _MemoApiResponse;

  const MemoApiResponse._();

  factory MemoApiResponse.fromJson(Map<String, dynamic> json) =>
      _$MemoApiResponseFromJson(json);

  /// Convert response to domain entity
  MemoEntity toEntity() => data.toEntity();
}