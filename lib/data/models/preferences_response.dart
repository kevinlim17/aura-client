import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/preferences_entity.dart';

part 'preferences_response.freezed.dart';
part 'preferences_response.g.dart';

/// Preferences response from API
@freezed
class PreferencesResponse with _$PreferencesResponse {
  const factory PreferencesResponse({
    required int id,
    required int userId,
    required String narrativeStyle,
    required String preferredLength,
    required double ttsSpeed,
    required double ttsPitch,
    required String ttsVoice,
    required String preferredLanguage,
    required bool enableHapticFeedback,
    required bool enableAudioDescriptions,
    required bool highContrastMode,
    required bool enablePushNotifications,
    required bool isVisuallyImpaired,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PreferencesResponse;

  const PreferencesResponse._();

  factory PreferencesResponse.fromJson(Map<String, dynamic> json) =>
      _$PreferencesResponseFromJson(json);

  /// Convert response to domain entity
  PreferencesEntity toEntity() {
    return PreferencesEntity(
      narrativeStyle: _parseNarrativeStyle(narrativeStyle),
      preferredLength: _parsePreferredLength(preferredLength),
      ttsSpeed: ttsSpeed,
      ttsPitch: ttsPitch,
      ttsVoice: _parseTtsVoice(ttsVoice),
      preferredLanguage: preferredLanguage,
      enableHapticFeedback: enableHapticFeedback,
      enableAudioDescriptions: enableAudioDescriptions,
      highContrastMode: highContrastMode,
      enablePushNotifications: enablePushNotifications,
    );
  }

  /// Parse narrative style from API string
  static NarrativeStyle _parseNarrativeStyle(String value) {
    switch (value.toUpperCase()) {
      case 'LITERARY':
        return NarrativeStyle.literary;
      case 'SCHOLARLY':
        return NarrativeStyle.scholarly;
      case 'CONVERSATIONAL':
        return NarrativeStyle.conversational;
      case 'POETIC':
        return NarrativeStyle.poetic;
      default:
        return NarrativeStyle.conversational;
    }
  }

  /// Parse preferred length from API string
  static PreferredLength _parsePreferredLength(String value) {
    switch (value.toUpperCase()) {
      case 'SHORT':
        return PreferredLength.short;
      case 'MEDIUM':
        return PreferredLength.medium;
      case 'LONG':
        return PreferredLength.long;
      default:
        return PreferredLength.medium;
    }
  }

  /// Parse TTS voice from API string
  static TtsVoice _parseTtsVoice(String value) {
    switch (value.toUpperCase()) {
      case 'MALE':
        return TtsVoice.male;
      case 'FEMALE':
        return TtsVoice.female;
      case 'NEUTRAL':
        return TtsVoice.neutral;
      default:
        return TtsVoice.neutral;
    }
  }
}

/// API response wrapper
@freezed
class PreferencesApiResponse with _$PreferencesApiResponse {
  const factory PreferencesApiResponse({
    required bool success,
    required PreferencesResponse data,
    String? message,
  }) = _PreferencesApiResponse;

  const PreferencesApiResponse._();

  factory PreferencesApiResponse.fromJson(Map<String, dynamic> json) =>
      _$PreferencesApiResponseFromJson(json);

  /// Convert response to domain entity
  PreferencesEntity toEntity() => data.toEntity();
}
