import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo_entity.freezed.dart';
part 'memo_entity.g.dart';

/// Input method enumeration
enum InputMethod {
  @JsonValue('TEXT')
  text,

  @JsonValue('VOICE')
  voice,
}

/// Memo category enumeration
enum MemoCategory {
  @JsonValue('THOUGHT')
  thought,

  @JsonValue('QUESTION')
  question,

  @JsonValue('REMINDER')
  reminder,

  @JsonValue('INSIGHT')
  insight,
}

/// Memo entity for domain logic
@freezed
class MemoEntity with _$MemoEntity {
  const factory MemoEntity({
    required String content,
    required InputMethod inputMethod,
    String? voiceUrl,
    int? voiceDurationSeconds,
    MemoCategory? category,
    List<String>? tags,
    int? artworkId,
    int? docentSessionId,
    bool? isSharedWithCompanion,
  }) = _MemoEntity;

  factory MemoEntity.fromJson(Map<String, dynamic> json) =>
      _$MemoEntityFromJson(json);
}

/// Exception for memo-related errors
class MemoException implements Exception {
  final String message;
  final String? code;

  MemoException(this.message, {this.code});

  @override
  String toString() =>
      'MemoException: $message${code != null ? ' ($code)' : ''}';
}