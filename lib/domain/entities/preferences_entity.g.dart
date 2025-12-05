// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreferencesEntityImpl _$$PreferencesEntityImplFromJson(
  Map<String, dynamic> json,
) => _$PreferencesEntityImpl(
  narrativeStyle: $enumDecode(_$NarrativeStyleEnumMap, json['narrativeStyle']),
  preferredLength: $enumDecode(
    _$PreferredLengthEnumMap,
    json['preferredLength'],
  ),
  ttsSpeed: (json['ttsSpeed'] as num).toDouble(),
  ttsPitch: (json['ttsPitch'] as num).toDouble(),
  ttsVoice: $enumDecode(_$TtsVoiceEnumMap, json['ttsVoice']),
  preferredLanguage: json['preferredLanguage'] as String,
  enableHapticFeedback: json['enableHapticFeedback'] as bool,
  enableAudioDescriptions: json['enableAudioDescriptions'] as bool,
  highContrastMode: json['highContrastMode'] as bool,
  enablePushNotifications: json['enablePushNotifications'] as bool,
);

Map<String, dynamic> _$$PreferencesEntityImplToJson(
  _$PreferencesEntityImpl instance,
) => <String, dynamic>{
  'narrativeStyle': _$NarrativeStyleEnumMap[instance.narrativeStyle]!,
  'preferredLength': _$PreferredLengthEnumMap[instance.preferredLength]!,
  'ttsSpeed': instance.ttsSpeed,
  'ttsPitch': instance.ttsPitch,
  'ttsVoice': _$TtsVoiceEnumMap[instance.ttsVoice]!,
  'preferredLanguage': instance.preferredLanguage,
  'enableHapticFeedback': instance.enableHapticFeedback,
  'enableAudioDescriptions': instance.enableAudioDescriptions,
  'highContrastMode': instance.highContrastMode,
  'enablePushNotifications': instance.enablePushNotifications,
};

const _$NarrativeStyleEnumMap = {
  NarrativeStyle.literary: 'LITERARY',
  NarrativeStyle.scholarly: 'SCHOLARLY',
  NarrativeStyle.conversational: 'CONVERSATIONAL',
  NarrativeStyle.poetic: 'POETIC',
};

const _$PreferredLengthEnumMap = {
  PreferredLength.short: 'SHORT',
  PreferredLength.medium: 'MEDIUM',
  PreferredLength.long: 'LONG',
};

const _$TtsVoiceEnumMap = {
  TtsVoice.male: 'MALE',
  TtsVoice.female: 'FEMALE',
  TtsVoice.neutral: 'NEUTRAL',
};
