import 'package:freezed_annotation/freezed_annotation.dart';

part 'link_entity.freezed.dart';
part 'link_entity.g.dart';

/// Link type enumeration
enum LinkType {
  @JsonValue('ARTICLE')
  article,

  @JsonValue('VIDEO')
  video,

  @JsonValue('AUDIO')
  audio,

  @JsonValue('REFERENCE')
  reference,

  @JsonValue('INSPIRATION')
  inspiration,

  @JsonValue('OTHER')
  other,
}

/// Link entity for domain logic
@freezed
class LinkEntity with _$LinkEntity {
  const factory LinkEntity({
    required String url,
    String? title,
    String? description,
    LinkType? linkType,
    int? artworkId,
    int? docentSessionId,
    Map<String, dynamic>? metadata,
    String? thumbnailUrl,
    bool? hasAudioDescription,
    bool? hasSubtitles,
  }) = _LinkEntity;

  factory LinkEntity.fromJson(Map<String, dynamic> json) =>
      _$LinkEntityFromJson(json);
}

/// Exception for link-related errors
class LinkException implements Exception {
  final String message;
  final String? code;

  LinkException(this.message, {this.code});

  @override
  String toString() =>
      'LinkException: $message${code != null ? ' ($code)' : ''}';
}