import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/feedback_entity.dart';

part 'feedback_response.freezed.dart';
part 'feedback_response.g.dart';

/// Improvement suggestions response
@freezed
class ImprovementSuggestionsResponse with _$ImprovementSuggestionsResponse {
  const factory ImprovementSuggestionsResponse({
    String? length,
    String? style,
  }) = _ImprovementSuggestionsResponse;

  const ImprovementSuggestionsResponse._();

  factory ImprovementSuggestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ImprovementSuggestionsResponseFromJson(json);

  ImprovementSuggestions toEntity() {
    return ImprovementSuggestions(
      length: length,
      style: style,
    );
  }
}

/// Feedback response from API
@freezed
class FeedbackResponse with _$FeedbackResponse {
  const factory FeedbackResponse({
    required int id,
    required int docentSessionId,
    required int userId,
    required int emotionalResonance,
    int? imaginativeEngagement,
    int? emotionalImpact,
    required double overallSatisfaction,
    String? comment,
    ImprovementSuggestionsResponse? improvementSuggestions,
    required bool isFewShotCandidate,
    DateTime? fewShotSelectedAt,
    required DateTime createdAt,
  }) = _FeedbackResponse;

  const FeedbackResponse._();

  factory FeedbackResponse.fromJson(Map<String, dynamic> json) =>
      _$FeedbackResponseFromJson(json);

  FeedbackEntity toEntity() {
    return FeedbackEntity(
      id: id,
      docentSessionId: docentSessionId,
      userId: userId,
      emotionalResonance: emotionalResonance,
      imaginativeEngagement: imaginativeEngagement,
      emotionalImpact: emotionalImpact,
      overallSatisfaction: overallSatisfaction,
      comment: comment,
      improvementSuggestions: improvementSuggestions?.toEntity(),
      isFewShotCandidate: isFewShotCandidate,
      fewShotSelectedAt: fewShotSelectedAt,
      createdAt: createdAt,
    );
  }
}

/// API response wrapper for feedback
@freezed
class FeedbackApiResponse with _$FeedbackApiResponse {
  const factory FeedbackApiResponse({
    required bool success,
    required FeedbackResponse data,
    String? message,
  }) = _FeedbackApiResponse;

  const FeedbackApiResponse._();

  factory FeedbackApiResponse.fromJson(Map<String, dynamic> json) =>
      _$FeedbackApiResponseFromJson(json);

  FeedbackEntity toEntity() => data.toEntity();
}