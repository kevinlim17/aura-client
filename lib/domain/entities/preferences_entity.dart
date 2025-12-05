import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences_entity.freezed.dart';
part 'preferences_entity.g.dart';

/// Narrative style as defined by the API
enum NarrativeStyle {
  @JsonValue('LITERARY')
  literary, // 문학적 서사
  @JsonValue('SCHOLARLY')
  scholarly, // 학술적 맥락 중심
  @JsonValue('CONVERSATIONAL')
  conversational, // 감정적 공감 중심
  @JsonValue('POETIC')
  poetic, // 시적 묘사 중심
}

/// Preferred length as defined by the API
enum PreferredLength {
  @JsonValue('SHORT')
  short,
  @JsonValue('MEDIUM')
  medium,
  @JsonValue('LONG')
  long,
}

/// Preferred TTS Voice as defined by the API
enum TtsVoice {
  @JsonValue('MALE')
  male,
  @JsonValue('FEMALE')
  female,
  @JsonValue('NEUTRAL')
  neutral,
}

/// User preferences entity
@freezed
class PreferencesEntity with _$PreferencesEntity {
  const factory PreferencesEntity({
    required NarrativeStyle narrativeStyle,
    required PreferredLength preferredLength,
    required double ttsSpeed,
    required double ttsPitch,
    required TtsVoice ttsVoice,
    required String preferredLanguage,
    required bool enableHapticFeedback,
    required bool enableAudioDescriptions,
    required bool highContrastMode,
    required bool enablePushNotifications,
  }) = _PreferencesEntity;

  factory PreferencesEntity.fromJson(Map<String, dynamic> json) =>
      _$PreferencesEntityFromJson(json);

  /// Default preferences
  factory PreferencesEntity.defaults() => const PreferencesEntity(
        narrativeStyle: NarrativeStyle.conversational,
        preferredLength: PreferredLength.medium,
        ttsSpeed: 0.5,
        ttsPitch: 1.0,
        ttsVoice: TtsVoice.neutral,
        preferredLanguage: 'ko-KR',
        enableHapticFeedback: true,
        enableAudioDescriptions: true,
        highContrastMode: false,
        enablePushNotifications: true,
      );
}

/// Extension for preferences-related helper methods
extension PreferencesEntityX on PreferencesEntity {
  /// Get Korean description for narrative style
  String get narrativeStyleDescription {
    switch (narrativeStyle) {
      case NarrativeStyle.literary:
        return '문학적 서사';
      case NarrativeStyle.scholarly:
        return '학술적 맥락 중심';
      case NarrativeStyle.conversational:
        return '감정적 공감 중심';
      case NarrativeStyle.poetic:
        return '시적 묘사 중심';
    }
  }

  /// Get Korean description for preferred length
  String get preferredLengthDescription {
    switch (preferredLength) {
      case PreferredLength.short:
        return '짧게';
      case PreferredLength.medium:
        return '보통';
      case PreferredLength.long:
        return '길게';
    }
  }

  /// Get TTS speed description
  String get ttsSpeedDescription {
    if (ttsSpeed < 0.7) return '매우 느림';
    if (ttsSpeed < 1.0) return '느림';
    if (ttsSpeed < 1.3) return '보통';
    if (ttsSpeed < 1.7) return '빠름';
    return '매우 빠름';
  }

  /// Get TTS pitch description
  String get ttsPitchDescription {
    if (ttsPitch < 0.7) return '매우 낮음';
    if (ttsPitch < 1.0) return '낮음';
    if (ttsPitch < 1.3) return '보통';
    if (ttsPitch < 1.7) return '높음';
    return '매우 높음';
  }

  /// Get TTS voice description
  String get ttsVoiceDescription {
    switch (ttsVoice) {
      case TtsVoice.male:
        return '남성 음성';
      case TtsVoice.female:
        return '여성 음성';
      case TtsVoice.neutral:
        return '중성 음성';
    }
  }
}