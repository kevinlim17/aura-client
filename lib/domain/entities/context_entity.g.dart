// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContextEntityImpl _$$ContextEntityImplFromJson(Map<String, dynamic> json) =>
    _$ContextEntityImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      contextType: $enumDecode(_$ContextTypeEnumMap, json['contextType']),
      title: json['title'] as String?,
      content: json['content'] as String,
      voiceUrl: json['voiceUrl'] as String?,
      voiceDurationSeconds: (json['voiceDurationSeconds'] as num?)?.toInt(),
      inputMethod: $enumDecode(_$InputMethodEnumMap, json['inputMethod']),
      emotionTags:
          (json['emotionTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      importanceLevel: (json['importanceLevel'] as num?)?.toInt() ?? 3,
      isCompanionInput: json['isCompanionInput'] as bool? ?? false,
      companionUserId: (json['companionUserId'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ContextEntityImplToJson(_$ContextEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'contextType': _$ContextTypeEnumMap[instance.contextType]!,
      'title': instance.title,
      'content': instance.content,
      'voiceUrl': instance.voiceUrl,
      'voiceDurationSeconds': instance.voiceDurationSeconds,
      'inputMethod': _$InputMethodEnumMap[instance.inputMethod]!,
      'emotionTags': instance.emotionTags,
      'importanceLevel': instance.importanceLevel,
      'isCompanionInput': instance.isCompanionInput,
      'companionUserId': instance.companionUserId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$ContextTypeEnumMap = {
  ContextType.memory: 'MEMORY',
  ContextType.experience: 'EXPERIENCE',
  ContextType.emotion: 'EMOTION',
  ContextType.travel: 'TRAVEL',
};

const _$InputMethodEnumMap = {
  InputMethod.text: 'TEXT',
  InputMethod.voice: 'VOICE',
};

_$CreateContextRequestImpl _$$CreateContextRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateContextRequestImpl(
  contextType: $enumDecode(_$ContextTypeEnumMap, json['contextType']),
  title: json['title'] as String?,
  content: json['content'] as String,
  voiceUrl: json['voiceUrl'] as String?,
  voiceDurationSeconds: (json['voiceDurationSeconds'] as num?)?.toInt(),
  inputMethod: $enumDecode(_$InputMethodEnumMap, json['inputMethod']),
  emotionTags:
      (json['emotionTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  importanceLevel: (json['importanceLevel'] as num?)?.toInt() ?? 3,
  isCompanionInput: json['isCompanionInput'] as bool? ?? false,
  companionUserId: (json['companionUserId'] as num?)?.toInt(),
);

Map<String, dynamic> _$$CreateContextRequestImplToJson(
  _$CreateContextRequestImpl instance,
) => <String, dynamic>{
  'contextType': _$ContextTypeEnumMap[instance.contextType]!,
  'title': instance.title,
  'content': instance.content,
  'voiceUrl': instance.voiceUrl,
  'voiceDurationSeconds': instance.voiceDurationSeconds,
  'inputMethod': _$InputMethodEnumMap[instance.inputMethod]!,
  'emotionTags': instance.emotionTags,
  'importanceLevel': instance.importanceLevel,
  'isCompanionInput': instance.isCompanionInput,
  'companionUserId': instance.companionUserId,
};
