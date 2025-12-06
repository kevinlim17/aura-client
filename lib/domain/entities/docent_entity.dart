import 'package:freezed_annotation/freezed_annotation.dart';

part 'docent_entity.freezed.dart';
part 'docent_entity.g.dart';

/// Narrative style for docent generation
enum NarrativeStyle {
  @JsonValue('DESCRIPTIVE')
  descriptive,
  @JsonValue('LITERARY')
  literary,
  @JsonValue('SIMPLE')
  simple,
  @JsonValue('PROFESSIONAL')
  professional,
}

/// Preferred length for docent generation
enum PreferredLength {
  @JsonValue('SHORT')
  short,
  @JsonValue('MEDIUM')
  medium,
  @JsonValue('LONG')
  long,
}

/// Docent generation status
enum DocentStatus {
  @JsonValue('GENERATING')
  generating,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('FAILED')
  failed,
}

/// Few-shot example for prompt engineering
@freezed
class FewShotExample with _$FewShotExample {
  const factory FewShotExample({
    required String userContextSummary,
    required String exemplarText,
    required double qualityScore,
  }) = _FewShotExample;

  factory FewShotExample.fromJson(Map<String, dynamic> json) =>
      _$FewShotExampleFromJson(json);
}

/// Docent session entity
@freezed
class DocentSessionEntity with _$DocentSessionEntity {
  const factory DocentSessionEntity({
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
    @Default([]) List<FewShotExample> fewShotExamples,
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
    required DocentStatus status,
    // Timestamps
    required DateTime createdAt,
    DateTime? lastPlayedAt,
  }) = _DocentSessionEntity;

  const DocentSessionEntity._();

  factory DocentSessionEntity.fromJson(Map<String, dynamic> json) =>
      _$DocentSessionEntityFromJson(json);

  /// Get estimated reading time in seconds (based on Korean reading speed: ~300 chars/min)
  int get estimatedReadingSeconds {
    final charCount = generatedText.length;
    return (charCount / 300 * 60).ceil();
  }

  /// Check if TTS audio is available
  bool get hasTtsAudio => ttsAudioUrl != null && ttsAudioUrl!.isNotEmpty;

  /// Get duration for TTS playback or estimated reading time
  int get playbackDurationSeconds => ttsDurationSeconds ?? estimatedReadingSeconds;
}

/// Docent generation request
@freezed
class DocentGenerationRequest with _$DocentGenerationRequest {
  const factory DocentGenerationRequest({
    required int userId,
    required int artworkId,
    NarrativeStyle? narrativeStyle, // optional, uses user preference if not provided
    PreferredLength? preferredLength, // optional, uses user preference if not provided
    @Default(false) bool includeCompanionContext,
    @Default(true) bool useFewShotExamples,
    String? customPrompt,
  }) = _DocentGenerationRequest;

  const DocentGenerationRequest._();

  factory DocentGenerationRequest.fromJson(Map<String, dynamic> json) =>
      _$DocentGenerationRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'userId': userId,
      'artworkId': artworkId,
      'includeCompanionContext': includeCompanionContext,
      'useFewShotExamples': useFewShotExamples,
    };

    if (narrativeStyle != null) {
      map['narrativeStyle'] = narrativeStyle!.name.toUpperCase();
    }

    if (preferredLength != null) {
      map['preferredLength'] = preferredLength!.name.toUpperCase();
    }

    if (customPrompt != null) {
      map['customPrompt'] = customPrompt;
    }

    return map;
  }
}

/// Docent generation result
@freezed
class DocentGenerationResult with _$DocentGenerationResult {
  const factory DocentGenerationResult({
    required int sessionId,
    required DocentStatus status,
    DocentSessionEntity? result,
    String? errorMessage,
    int? progress, // 0-100 percentage
    String? pollingUrl, // URL to poll for status updates
    String? message, // Optional message from server
  }) = _DocentGenerationResult;

  const DocentGenerationResult._();

  factory DocentGenerationResult.fromJson(Map<String, dynamic> json) =>
      _$DocentGenerationResultFromJson(json);

  /// Check if generation is still in progress
  bool get isGenerating => status == DocentStatus.generating;

  /// Check if generation is completed
  bool get isCompleted => status == DocentStatus.completed;

  /// Check if generation failed
  bool get isFailed => status == DocentStatus.failed;
}

/// Playback statistics update request
@freezed
class PlaybackStatsRequest with _$PlaybackStatsRequest {
  const factory PlaybackStatsRequest({
    required int playCount,
    required int totalListeningSeconds,
    required double completionRate,
  }) = _PlaybackStatsRequest;

  const PlaybackStatsRequest._();

  factory PlaybackStatsRequest.fromJson(Map<String, dynamic> json) =>
      _$PlaybackStatsRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        'playCount': playCount,
        'totalListeningSeconds': totalListeningSeconds,
        'completionRate': completionRate,
      };
}
