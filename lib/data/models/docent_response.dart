import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/docent_entity.dart';

part 'docent_response.freezed.dart';
part 'docent_response.g.dart';

/// Few-shot example response
@freezed
class FewShotExampleResponse with _$FewShotExampleResponse {
  const factory FewShotExampleResponse({
    required String userContextSummary,
    required String exemplarText,
    required double qualityScore,
  }) = _FewShotExampleResponse;

  const FewShotExampleResponse._();

  factory FewShotExampleResponse.fromJson(Map<String, dynamic> json) =>
      _$FewShotExampleResponseFromJson(json);

  /// Convert to domain entity
  FewShotExample toEntity() {
    return FewShotExample(
      userContextSummary: userContextSummary,
      exemplarText: exemplarText,
      qualityScore: qualityScore,
    );
  }
}

/// Docent session response
@freezed
class DocentSessionResponse with _$DocentSessionResponse {
  const factory DocentSessionResponse({
    required int id,
    required int userId,
    required int artworkId,
    String? artworkTitle,
    String? artworkArtist,
    String? artworkImageUrl,
    // Prompt information
    required String promptTemplate,
    String? promptPersona,
    String? promptTask,
    String? promptContext,
    String? promptForm,
    @Default([]) List<FewShotExampleResponse> fewShotExamples,
    // Generated content
    required String generatedText,
    // Gemini API metadata
    String? geminiModel,
    double? geminiTemperature,
    double? geminiTopP,
    int? geminiTopK,
    int? generationTimeMs,
    // TTS audio
    String? ttsAudioUrl,
    int? ttsDurationSeconds,
    // Playback statistics
    @Default(0) int playCount,
    @Default(0) int totalListeningSeconds,
    double? completionRate,
    // Status
    required String status,
    // Timestamps
    required String createdAt,
    String? lastPlayedAt,
  }) = _DocentSessionResponse;

  const DocentSessionResponse._();

  factory DocentSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$DocentSessionResponseFromJson(json);

  /// Convert to domain entity
  DocentSessionEntity toEntity() {
    return DocentSessionEntity(
      id: id,
      userId: userId,
      artworkId: artworkId,
      artworkTitle: artworkTitle,
      artworkArtist: artworkArtist,
      artworkImageUrl: artworkImageUrl,
      promptTemplate: promptTemplate,
      promptPersona: promptPersona,
      promptTask: promptTask,
      promptContext: promptContext,
      promptForm: promptForm,
      fewShotExamples: fewShotExamples.map((e) => e.toEntity()).toList(),
      generatedText: generatedText,
      geminiModel: geminiModel,
      geminiTemperature: geminiTemperature,
      geminiTopP: geminiTopP,
      geminiTopK: geminiTopK,
      generationTimeMs: generationTimeMs,
      ttsAudioUrl: ttsAudioUrl,
      ttsDurationSeconds: ttsDurationSeconds,
      playCount: playCount,
      totalListeningSeconds: totalListeningSeconds,
      completionRate: completionRate,
      status: _parseDocentStatus(status),
      createdAt: DateTime.parse(createdAt),
      lastPlayedAt: lastPlayedAt == null ? null : DateTime.tryParse(lastPlayedAt!)
    );
  }

  static DocentStatus _parseDocentStatus(String status) {
    switch (status.toUpperCase()) {
      case 'GENERATING':
        return DocentStatus.generating;
      case 'COMPLETED':
        return DocentStatus.completed;
      case 'FAILED':
        return DocentStatus.failed;
      default:
        return DocentStatus.generating;
    }
  }
}

/// Docent generation result response
@freezed
class DocentGenerationResultResponse with _$DocentGenerationResultResponse {
  const factory DocentGenerationResultResponse({
    required int sessionId,
    required String status,
    DocentSessionResponse? result,
    String? errorMessage,
    int? progress,
    String? pollingUrl,
    String? message,
  }) = _DocentGenerationResultResponse;

  const DocentGenerationResultResponse._();

  factory DocentGenerationResultResponse.fromJson(Map<String, dynamic> json) =>
      _$DocentGenerationResultResponseFromJson(json);

  /// Convert to domain entity
  DocentGenerationResult toEntity() {
    return DocentGenerationResult(
      sessionId: sessionId,
      status: _parseDocentStatus(status),
      result: result?.toEntity(),
      errorMessage: errorMessage,
      progress: progress,
      pollingUrl: pollingUrl,
      message: message,
    );
  }

  static DocentStatus _parseDocentStatus(String status) {
    switch (status.toUpperCase()) {
      case 'GENERATING':
        return DocentStatus.generating;
      case 'COMPLETED':
        return DocentStatus.completed;
      case 'FAILED':
        return DocentStatus.failed;
      default:
        return DocentStatus.generating;
    }
  }
}

/// Docent API response wrapper
@freezed
class DocentApiResponse with _$DocentApiResponse {
  const factory DocentApiResponse({
    required bool success,
    DocentSessionResponse? data,
    String? message,
  }) = _DocentApiResponse;

  const DocentApiResponse._();

  factory DocentApiResponse.fromJson(Map<String, dynamic> json) =>
      _$DocentApiResponseFromJson(json);
}

/// Docent generation API response wrapper
@freezed
class DocentGenerationApiResponse with _$DocentGenerationApiResponse {
  const factory DocentGenerationApiResponse({
    required bool success,
    DocentGenerationResultResponse? data,
    String? message,
  }) = _DocentGenerationApiResponse;

  const DocentGenerationApiResponse._();

  factory DocentGenerationApiResponse.fromJson(Map<String, dynamic> json) =>
      _$DocentGenerationApiResponseFromJson(json);
}
