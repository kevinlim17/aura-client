// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LinkEntityImpl _$$LinkEntityImplFromJson(Map<String, dynamic> json) =>
    _$LinkEntityImpl(
      url: json['url'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      linkType: $enumDecodeNullable(_$LinkTypeEnumMap, json['linkType']),
      artworkId: (json['artworkId'] as num?)?.toInt(),
      docentSessionId: (json['docentSessionId'] as num?)?.toInt(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      hasAudioDescription: json['hasAudioDescription'] as bool?,
      hasSubtitles: json['hasSubtitles'] as bool?,
    );

Map<String, dynamic> _$$LinkEntityImplToJson(_$LinkEntityImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'description': instance.description,
      'linkType': _$LinkTypeEnumMap[instance.linkType],
      'artworkId': instance.artworkId,
      'docentSessionId': instance.docentSessionId,
      'metadata': instance.metadata,
      'thumbnailUrl': instance.thumbnailUrl,
      'hasAudioDescription': instance.hasAudioDescription,
      'hasSubtitles': instance.hasSubtitles,
    };

const _$LinkTypeEnumMap = {
  LinkType.article: 'ARTICLE',
  LinkType.video: 'VIDEO',
  LinkType.audio: 'AUDIO',
  LinkType.reference: 'REFERENCE',
  LinkType.inspiration: 'INSPIRATION',
  LinkType.other: 'OTHER',
};
