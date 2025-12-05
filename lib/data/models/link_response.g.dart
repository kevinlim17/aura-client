// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LinkResponseImpl _$$LinkResponseImplFromJson(Map<String, dynamic> json) =>
    _$LinkResponseImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      url: json['url'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      artworkId: (json['artworkId'] as num?)?.toInt(),
      docentSessionId: (json['docentSessionId'] as num?)?.toInt(),
      linkType: json['linkType'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      hasAudioDescription: json['hasAudioDescription'] as bool?,
      hasSubtitles: json['hasSubtitles'] as bool?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$LinkResponseImplToJson(_$LinkResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'url': instance.url,
      'title': instance.title,
      'description': instance.description,
      'artworkId': instance.artworkId,
      'docentSessionId': instance.docentSessionId,
      'linkType': instance.linkType,
      'metadata': instance.metadata,
      'thumbnailUrl': instance.thumbnailUrl,
      'hasAudioDescription': instance.hasAudioDescription,
      'hasSubtitles': instance.hasSubtitles,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$LinkApiResponseImpl _$$LinkApiResponseImplFromJson(
  Map<String, dynamic> json,
) => _$LinkApiResponseImpl(
  success: json['success'] as bool,
  data: LinkResponse.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$$LinkApiResponseImplToJson(
  _$LinkApiResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
};
