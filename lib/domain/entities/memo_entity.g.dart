// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoEntityImpl _$$MemoEntityImplFromJson(Map<String, dynamic> json) =>
    _$MemoEntityImpl(
      content: json['content'] as String,
      inputMethod: $enumDecode(_$InputMethodEnumMap, json['inputMethod']),
      voiceUrl: json['voiceUrl'] as String?,
      voiceDurationSeconds: (json['voiceDurationSeconds'] as num?)?.toInt(),
      category: $enumDecodeNullable(_$MemoCategoryEnumMap, json['category']),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      artworkId: (json['artworkId'] as num?)?.toInt(),
      docentSessionId: (json['docentSessionId'] as num?)?.toInt(),
      isSharedWithCompanion: json['isSharedWithCompanion'] as bool?,
    );

Map<String, dynamic> _$$MemoEntityImplToJson(_$MemoEntityImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'inputMethod': _$InputMethodEnumMap[instance.inputMethod]!,
      'voiceUrl': instance.voiceUrl,
      'voiceDurationSeconds': instance.voiceDurationSeconds,
      'category': _$MemoCategoryEnumMap[instance.category],
      'tags': instance.tags,
      'artworkId': instance.artworkId,
      'docentSessionId': instance.docentSessionId,
      'isSharedWithCompanion': instance.isSharedWithCompanion,
    };

const _$InputMethodEnumMap = {
  InputMethod.text: 'TEXT',
  InputMethod.voice: 'VOICE',
};

const _$MemoCategoryEnumMap = {
  MemoCategory.thought: 'THOUGHT',
  MemoCategory.question: 'QUESTION',
  MemoCategory.reminder: 'REMINDER',
  MemoCategory.insight: 'INSIGHT',
};
