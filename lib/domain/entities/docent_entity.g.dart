// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'docent_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FewShotExampleImpl _$$FewShotExampleImplFromJson(Map<String, dynamic> json) =>
    _$FewShotExampleImpl(
      userContextSummary: json['userContextSummary'] as String,
      exemplarText: json['exemplarText'] as String,
      qualityScore: (json['qualityScore'] as num).toDouble(),
    );

Map<String, dynamic> _$$FewShotExampleImplToJson(
  _$FewShotExampleImpl instance,
) => <String, dynamic>{
  'userContextSummary': instance.userContextSummary,
  'exemplarText': instance.exemplarText,
  'qualityScore': instance.qualityScore,
};

_$DocentSessionEntityImpl _$$DocentSessionEntityImplFromJson(
  Map<String, dynamic> json,
) => _$DocentSessionEntityImpl(
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
          ?.map((e) => FewShotExample.fromJson(e as Map<String, dynamic>))
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
  status: $enumDecode(_$DocentStatusEnumMap, json['status']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  lastPlayedAt: json['lastPlayedAt'] == null
      ? null
      : DateTime.parse(json['lastPlayedAt'] as String),
);

Map<String, dynamic> _$$DocentSessionEntityImplToJson(
  _$DocentSessionEntityImpl instance,
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
  'status': _$DocentStatusEnumMap[instance.status]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'lastPlayedAt': instance.lastPlayedAt?.toIso8601String(),
};

const _$DocentStatusEnumMap = {
  DocentStatus.generating: 'GENERATING',
  DocentStatus.completed: 'COMPLETED',
  DocentStatus.failed: 'FAILED',
};

_$DocentGenerationRequestImpl _$$DocentGenerationRequestImplFromJson(
  Map<String, dynamic> json,
) => _$DocentGenerationRequestImpl(
  userId: (json['userId'] as num).toInt(),
  artworkId: (json['artworkId'] as num).toInt(),
  narrativeStyle: $enumDecodeNullable(
    _$NarrativeStyleEnumMap,
    json['narrativeStyle'],
  ),
  preferredLength: $enumDecodeNullable(
    _$PreferredLengthEnumMap,
    json['preferredLength'],
  ),
  includeCompanionContext: json['includeCompanionContext'] as bool? ?? false,
  useFewShotExamples: json['useFewShotExamples'] as bool? ?? true,
  customPrompt: json['customPrompt'] as String?,
);

Map<String, dynamic> _$$DocentGenerationRequestImplToJson(
  _$DocentGenerationRequestImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'artworkId': instance.artworkId,
  'narrativeStyle': _$NarrativeStyleEnumMap[instance.narrativeStyle],
  'preferredLength': _$PreferredLengthEnumMap[instance.preferredLength],
  'includeCompanionContext': instance.includeCompanionContext,
  'useFewShotExamples': instance.useFewShotExamples,
  'customPrompt': instance.customPrompt,
};

const _$NarrativeStyleEnumMap = {
  NarrativeStyle.descriptive: 'DESCRIPTIVE',
  NarrativeStyle.literary: 'LITERARY',
  NarrativeStyle.simple: 'SIMPLE',
  NarrativeStyle.professional: 'PROFESSIONAL',
};

const _$PreferredLengthEnumMap = {
  PreferredLength.short: 'SHORT',
  PreferredLength.medium: 'MEDIUM',
  PreferredLength.long: 'LONG',
};

_$DocentGenerationResultImpl _$$DocentGenerationResultImplFromJson(
  Map<String, dynamic> json,
) => _$DocentGenerationResultImpl(
  sessionId: (json['sessionId'] as num).toInt(),
  status: $enumDecode(_$DocentStatusEnumMap, json['status']),
  result: json['result'] == null
      ? null
      : DocentSessionEntity.fromJson(json['result'] as Map<String, dynamic>),
  errorMessage: json['errorMessage'] as String?,
  progress: (json['progress'] as num?)?.toInt(),
  pollingUrl: json['pollingUrl'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$$DocentGenerationResultImplToJson(
  _$DocentGenerationResultImpl instance,
) => <String, dynamic>{
  'sessionId': instance.sessionId,
  'status': _$DocentStatusEnumMap[instance.status]!,
  'result': instance.result,
  'errorMessage': instance.errorMessage,
  'progress': instance.progress,
  'pollingUrl': instance.pollingUrl,
  'message': instance.message,
};

_$PlaybackStatsRequestImpl _$$PlaybackStatsRequestImplFromJson(
  Map<String, dynamic> json,
) => _$PlaybackStatsRequestImpl(
  playCount: (json['playCount'] as num).toInt(),
  totalListeningSeconds: (json['totalListeningSeconds'] as num).toInt(),
  completionRate: (json['completionRate'] as num).toDouble(),
);

Map<String, dynamic> _$$PlaybackStatsRequestImplToJson(
  _$PlaybackStatsRequestImpl instance,
) => <String, dynamic>{
  'playCount': instance.playCount,
  'totalListeningSeconds': instance.totalListeningSeconds,
  'completionRate': instance.completionRate,
};
