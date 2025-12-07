import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_entity.freezed.dart';
part 'feedback_entity.g.dart';

/// Improvement suggestions for feedback
@freezed
class ImprovementSuggestions with _$ImprovementSuggestions {
  const factory ImprovementSuggestions({
    String? length,
    String? style,
  }) = _ImprovementSuggestions;

  factory ImprovementSuggestions.fromJson(Map<String, dynamic> json) =>
      _$ImprovementSuggestionsFromJson(json);
}

/// Feedback submission request
@freezed
class FeedbackSubmissionRequest with _$FeedbackSubmissionRequest {
  const factory FeedbackSubmissionRequest({
    required int emotionalResonance,
    int? imaginativeEngagement,
    int? emotionalImpact,
    String? comment,
    ImprovementSuggestions? improvementSuggestions,
  }) = _FeedbackSubmissionRequest;

  const FeedbackSubmissionRequest._();

  factory FeedbackSubmissionRequest.fromJson(Map<String, dynamic> json) =>
      _$FeedbackSubmissionRequestFromJson(json);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'emotionalResonance': emotionalResonance,
    };

    if (imaginativeEngagement != null) {
      map['imaginativeEngagement'] = imaginativeEngagement;
    }
    if (emotionalImpact != null) {
      map['emotionalImpact'] = emotionalImpact;
    }
    if (comment != null && comment!.isNotEmpty) {
      map['comment'] = comment;
    }
    if (improvementSuggestions != null) {
      map['improvementSuggestions'] = improvementSuggestions!.toJson();
    }

    return map;
  }
}

/// Feedback entity
@freezed
class FeedbackEntity with _$FeedbackEntity {
  const factory FeedbackEntity({
    required int id,
    required int docentSessionId,
    required int userId,
    required int emotionalResonance,
    int? imaginativeEngagement,
    int? emotionalImpact,
    required double overallSatisfaction,
    String? comment,
    ImprovementSuggestions? improvementSuggestions,
    required bool isFewShotCandidate,
    DateTime? fewShotSelectedAt,
    required DateTime createdAt,
  }) = _FeedbackEntity;

  factory FeedbackEntity.fromJson(Map<String, dynamic> json) =>
      _$FeedbackEntityFromJson(json);
}