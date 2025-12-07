// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImprovementSuggestionsImpl _$$ImprovementSuggestionsImplFromJson(
  Map<String, dynamic> json,
) => _$ImprovementSuggestionsImpl(
  length: json['length'] as String?,
  style: json['style'] as String?,
);

Map<String, dynamic> _$$ImprovementSuggestionsImplToJson(
  _$ImprovementSuggestionsImpl instance,
) => <String, dynamic>{'length': instance.length, 'style': instance.style};

_$FeedbackSubmissionRequestImpl _$$FeedbackSubmissionRequestImplFromJson(
  Map<String, dynamic> json,
) => _$FeedbackSubmissionRequestImpl(
  emotionalResonance: (json['emotionalResonance'] as num).toInt(),
  imaginativeEngagement: (json['imaginativeEngagement'] as num?)?.toInt(),
  emotionalImpact: (json['emotionalImpact'] as num?)?.toInt(),
  comment: json['comment'] as String?,
  improvementSuggestions: json['improvementSuggestions'] == null
      ? null
      : ImprovementSuggestions.fromJson(
          json['improvementSuggestions'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$FeedbackSubmissionRequestImplToJson(
  _$FeedbackSubmissionRequestImpl instance,
) => <String, dynamic>{
  'emotionalResonance': instance.emotionalResonance,
  'imaginativeEngagement': instance.imaginativeEngagement,
  'emotionalImpact': instance.emotionalImpact,
  'comment': instance.comment,
  'improvementSuggestions': instance.improvementSuggestions,
};

_$FeedbackEntityImpl _$$FeedbackEntityImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackEntityImpl(
      id: (json['id'] as num).toInt(),
      docentSessionId: (json['docentSessionId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      emotionalResonance: (json['emotionalResonance'] as num).toInt(),
      imaginativeEngagement: (json['imaginativeEngagement'] as num?)?.toInt(),
      emotionalImpact: (json['emotionalImpact'] as num?)?.toInt(),
      overallSatisfaction: (json['overallSatisfaction'] as num).toDouble(),
      comment: json['comment'] as String?,
      improvementSuggestions: json['improvementSuggestions'] == null
          ? null
          : ImprovementSuggestions.fromJson(
              json['improvementSuggestions'] as Map<String, dynamic>,
            ),
      isFewShotCandidate: json['isFewShotCandidate'] as bool,
      fewShotSelectedAt: json['fewShotSelectedAt'] == null
          ? null
          : DateTime.parse(json['fewShotSelectedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$FeedbackEntityImplToJson(
  _$FeedbackEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'docentSessionId': instance.docentSessionId,
  'userId': instance.userId,
  'emotionalResonance': instance.emotionalResonance,
  'imaginativeEngagement': instance.imaginativeEngagement,
  'emotionalImpact': instance.emotionalImpact,
  'overallSatisfaction': instance.overallSatisfaction,
  'comment': instance.comment,
  'improvementSuggestions': instance.improvementSuggestions,
  'isFewShotCandidate': instance.isFewShotCandidate,
  'fewShotSelectedAt': instance.fewShotSelectedAt?.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
};
