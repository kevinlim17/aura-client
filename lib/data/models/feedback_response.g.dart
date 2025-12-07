// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImprovementSuggestionsResponseImpl
_$$ImprovementSuggestionsResponseImplFromJson(Map<String, dynamic> json) =>
    _$ImprovementSuggestionsResponseImpl(
      length: json['length'] as String?,
      style: json['style'] as String?,
    );

Map<String, dynamic> _$$ImprovementSuggestionsResponseImplToJson(
  _$ImprovementSuggestionsResponseImpl instance,
) => <String, dynamic>{'length': instance.length, 'style': instance.style};

_$FeedbackResponseImpl _$$FeedbackResponseImplFromJson(
  Map<String, dynamic> json,
) => _$FeedbackResponseImpl(
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
      : ImprovementSuggestionsResponse.fromJson(
          json['improvementSuggestions'] as Map<String, dynamic>,
        ),
  isFewShotCandidate: json['isFewShotCandidate'] as bool,
  fewShotSelectedAt: json['fewShotSelectedAt'] == null
      ? null
      : DateTime.parse(json['fewShotSelectedAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$FeedbackResponseImplToJson(
  _$FeedbackResponseImpl instance,
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

_$FeedbackApiResponseImpl _$$FeedbackApiResponseImplFromJson(
  Map<String, dynamic> json,
) => _$FeedbackApiResponseImpl(
  success: json['success'] as bool,
  data: FeedbackResponse.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$$FeedbackApiResponseImplToJson(
  _$FeedbackApiResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'message': instance.message,
};
