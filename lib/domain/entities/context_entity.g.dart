// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContextEntityImpl _$$ContextEntityImplFromJson(Map<String, dynamic> json) =>
    _$ContextEntityImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      contextType: $enumDecode(_$ContextTypeEnumMap, json['context_type']),
      title: json['title'] as String?,
      content: json['content'] as String,
      voiceUrl: json['voice_url'] as String?,
      voiceDurationSeconds: (json['voice_duration_seconds'] as num?)?.toInt(),
      inputMethod: $enumDecode(_$InputMethodEnumMap, json['input_method']),
      emotionTags:
          (json['emotion_tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      importanceLevel: (json['importance_level'] as num?)?.toInt() ?? 3,
      isCompanionInput: json['is_companion_input'] as bool? ?? false,
      companionUserId: (json['companion_user_id'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ContextEntityImplToJson(_$ContextEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'context_type': _$ContextTypeEnumMap[instance.contextType]!,
      'title': instance.title,
      'content': instance.content,
      'voice_url': instance.voiceUrl,
      'voice_duration_seconds': instance.voiceDurationSeconds,
      'input_method': _$InputMethodEnumMap[instance.inputMethod]!,
      'emotion_tags': instance.emotionTags,
      'importance_level': instance.importanceLevel,
      'is_companion_input': instance.isCompanionInput,
      'companion_user_id': instance.companionUserId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
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
  contextType: $enumDecode(_$ContextTypeEnumMap, json['context_type']),
  title: json['title'] as String?,
  content: json['content'] as String,
  voiceUrl: json['voice_url'] as String?,
  voiceDurationSeconds: (json['voice_duration_seconds'] as num?)?.toInt(),
  inputMethod: $enumDecode(_$InputMethodEnumMap, json['input_method']),
  emotionTags:
      (json['emotion_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  importanceLevel: (json['importance_level'] as num?)?.toInt() ?? 3,
  isCompanionInput: json['is_companion_input'] as bool? ?? false,
  companionUserId: (json['companion_user_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$$CreateContextRequestImplToJson(
  _$CreateContextRequestImpl instance,
) => <String, dynamic>{
  'context_type': _$ContextTypeEnumMap[instance.contextType]!,
  'title': instance.title,
  'content': instance.content,
  'voice_url': instance.voiceUrl,
  'voice_duration_seconds': instance.voiceDurationSeconds,
  'input_method': _$InputMethodEnumMap[instance.inputMethod]!,
  'emotion_tags': instance.emotionTags,
  'importance_level': instance.importanceLevel,
  'is_companion_input': instance.isCompanionInput,
  'companion_user_id': instance.companionUserId,
};
