// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'docent_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FewShotExampleResponseImpl _$$FewShotExampleResponseImplFromJson(
  Map<String, dynamic> json,
) => _$FewShotExampleResponseImpl(
  userContextSummary: json['userContextSummary'] as String,
  exemplarText: json['exemplarText'] as String,
  qualityScore: (json['qualityScore'] as num).toDouble(),
);

Map<String, dynamic> _$$FewShotExampleResponseImplToJson(
  _$FewShotExampleResponseImpl instance,
) => <String, dynamic>{
  'userContextSummary': instance.userContextSummary,
  'exemplarText': instance.exemplarText,
  'qualityScore': instance.qualityScore,
};

_$DocentSessionResponseImpl _$$DocentSessionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DocentSessionResponseImpl(
  id: (json['id'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  artworkId: (json['artworkId'] as num).toInt(),
  artworkTitle: json['artworkTitle'] as String?,
  artworkArtist: json['artworkArtist'] as String?,
  artworkImageUrl: json['artworkImageUrl'] as String?,
  promptTemplate: json['promptTemplate'] as String,
  promptPersona: json['promptPersona'] as String?,
  promptTask: json['promptTask'] as String?,
  promptContext: json['promptContext'] as String?,
  promptForm: json['promptForm'] as String?,
  fewShotExamples:
      (json['fewShotExamples'] as List<dynamic>?)
          ?.map(
            (e) => FewShotExampleResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  generatedText: json['generatedText'] as String,
  geminiModel: json['geminiModel'] as String?,
  geminiTemperature: (json['geminiTemperature'] as num?)?.toDouble(),
  geminiTopP: (json['geminiTopP'] as num?)?.toDouble(),
  geminiTopK: (json['geminiTopK'] as num?)?.toInt(),
  generationTimeMs: (json['generationTimeMs'] as num?)?.toInt(),
  ttsAudioUrl: json['ttsAudioUrl'] as String?,
  ttsDurationSeconds: (json['ttsDurationSeconds'] as num?)?.toInt(),
  playCount: (json['playCount'] as num?)?.toInt() ?? 0,
  totalListeningSeconds: (json['totalListeningSeconds'] as num?)?.toInt() ?? 0,
  completionRate: (json['completionRate'] as num?)?.toDouble(),
  status: json['status'] as String,
  createdAt: json['createdAt'] as String,
  lastPlayedAt: json['lastPlayedAt'] as String?,
);

Map<String, dynamic> _$$DocentSessionResponseImplToJson(
  _$DocentSessionResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'artworkId': instance.artworkId,
  'artworkTitle': instance.artworkTitle,
  'artworkArtist': instance.artworkArtist,
  'artworkImageUrl': instance.artworkImageUrl,
  'promptTemplate': instance.promptTemplate,
  'promptPersona': instance.promptPersona,
  'promptTask': instance.promptTask,
  'promptContext': instance.promptContext,
  'promptForm': instance.promptForm,
  'fewShotExamples': instance.fewShotExamples,
  'generatedText': instance.generatedText,
  'geminiModel': instance.geminiModel,
  'geminiTemperature': instance.geminiTemperature,
  'geminiTopP': instance.geminiTopP,
  'geminiTopK': instance.geminiTopK,
  'generationTimeMs': instance.generationTimeMs,
  'ttsAudioUrl': instance.ttsAudioUrl,
  'ttsDurationSeconds': instance.ttsDurationSeconds,
  'playCount': instance.playCount,
  'totalListeningSeconds': instance.totalListeningSeconds,
  'completionRate': instance.completionRate,
  'status': instance.status,
  'createdAt': instance.createdAt,
  'lastPlayedAt': instance.lastPlayedAt,
};

_$DocentGenerationResultResponseImpl
_$$DocentGenerationResultResponseImplFromJson(Map<String, dynamic> json) =>
    _$DocentGenerationResultResponseImpl(
      sessionId: (json['sessionId'] as num).toInt(),
      status: json['status'] as String,
      result: json['result'] == null
          ? null
          : DocentSessionResponse.fromJson(
              json['result'] as Map<String, dynamic>,
            ),
      errorMessage: json['errorMessage'] as String?,
      progress: (json['progress'] as num?)?.toInt(),
      pollingUrl: json['pollingUrl'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$DocentGenerationResultResponseImplToJson(
  _$DocentGenerationResultResponseImpl instance,
) => <String, dynamic>{
  'sessionId': instance.sessionId,
  'status': instance.status,
  'result': instance.result,
  'errorMessage': instance.errorMessage,
  'progress': instance.progress,
  'pollingUrl': instance.pollingUrl,
  'message': instance.message,
};

_$DocentApiResponseImpl _$$DocentApiResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DocentApiResponseImpl(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : DocentSessionResponse.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$$DocentApiResponseImplToJson(
  _$DocentApiResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
};

_$DocentGenerationApiResponseImpl _$$DocentGenerationApiResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DocentGenerationApiResponseImpl(
  success: json['success'] as bool,
  data: json['data'] == null
      ? null
      : DocentGenerationResultResponse.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
  message: json['message'] as String?,
);

Map<String, dynamic> _$$DocentGenerationApiResponseImplToJson(
  _$DocentGenerationApiResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
};
