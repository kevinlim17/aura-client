import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/link_entity.dart';

part 'link_response.freezed.dart';
part 'link_response.g.dart';

/// Link response from API
@freezed
class LinkResponse with _$LinkResponse {
  const factory LinkResponse({
    required int id,
    required int userId,
    required String url,
    String? title,
    String? description,
    int? artworkId,
    int? docentSessionId,
    String? linkType,
    Map<String, dynamic>? metadata,
    String? thumbnailUrl,
    bool? hasAudioDescription,
    bool? hasSubtitles,
    required DateTime createdAt,
  }) = _LinkResponse;

  const LinkResponse._();

  factory LinkResponse.fromJson(Map<String, dynamic> json) =>
      _$LinkResponseFromJson(json);

  /// Convert response to domain entity
  LinkEntity toEntity() {
    return LinkEntity(
      url: url,
      title: title,
      description: description,
      linkType: linkType != null ? _parseLinkType(linkType!) : null,
      artworkId: artworkId,
      docentSessionId: docentSessionId,
      metadata: metadata,
      thumbnailUrl: thumbnailUrl,
      hasAudioDescription: hasAudioDescription,
      hasSubtitles: hasSubtitles,
    );
  }

  /// Parse link type from API string
  static LinkType _parseLinkType(String value) {
    switch (value.toUpperCase()) {
      case 'ARTICLE':
        return LinkType.article;
      case 'VIDEO':
        return LinkType.video;
      case 'AUDIO':
        return LinkType.audio;
      case 'REFERENCE':
        return LinkType.reference;
      case 'INSPIRATION':
        return LinkType.inspiration;
      case 'OTHER':
        return LinkType.other;
      default:
        return LinkType.other;
    }
  }
}

/// API response wrapper for link
@freezed
class LinkApiResponse with _$LinkApiResponse {
  const factory LinkApiResponse({
    required bool success,
    required LinkResponse data,
    String? message,
  }) = _LinkApiResponse;

  const LinkApiResponse._();

  factory LinkApiResponse.fromJson(Map<String, dynamic> json) =>
      _$LinkApiResponseFromJson(json);

  /// Convert response to domain entity
  LinkEntity toEntity() => data.toEntity();
}