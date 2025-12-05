// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoResponseImpl _$$MemoResponseImplFromJson(Map<String, dynamic> json) =>
    _$MemoResponseImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      content: json['content'] as String,
      artworkId: (json['artworkId'] as num?)?.toInt(),
      docentSessionId: (json['docentSessionId'] as num?)?.toInt(),
      voiceUrl: json['voiceUrl'] as String?,
      voiceDurationSeconds: (json['voiceDurationSeconds'] as num?)?.toInt(),
      inputMethod: json['inputMethod'] as String,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: json['category'] as String?,
      isSharedWithCompanion: json['isSharedWithCompanion'] as bool?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$MemoResponseImplToJson(_$MemoResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'content': instance.content,
      'artworkId': instance.artworkId,
      'docentSessionId': instance.docentSessionId,
      'voiceUrl': instance.voiceUrl,
      'voiceDurationSeconds': instance.voiceDurationSeconds,
      'inputMethod': instance.inputMethod,
      'tags': instance.tags,
      'category': instance.category,
      'isSharedWithCompanion': instance.isSharedWithCompanion,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$MemoApiResponseImpl _$$MemoApiResponseImplFromJson(
  Map<String, dynamic> json,
) => _$MemoApiResponseImpl(
  success: json['success'] as bool,
  data: MemoResponse.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$$MemoApiResponseImplToJson(
  _$MemoApiResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
};
