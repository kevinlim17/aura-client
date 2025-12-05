// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileDataImpl _$$ProfileDataImplFromJson(
  Map<String, dynamic> json,
) => _$ProfileDataImpl(
  interests:
      (json['interests'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  hobbies:
      (json['hobbies'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  favoriteArtists:
      (json['favoriteArtists'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  additionalInfo: json['additionalInfo'] as String?,
);

Map<String, dynamic> _$$ProfileDataImplToJson(_$ProfileDataImpl instance) =>
    <String, dynamic>{
      'interests': instance.interests,
      'hobbies': instance.hobbies,
      'favoriteArtists': instance.favoriteArtists,
      'additionalInfo': instance.additionalInfo,
    };

_$ContextDataImpl _$$ContextDataImplFromJson(Map<String, dynamic> json) =>
    _$ContextDataImpl(
      artMemory: json['artMemory'] as String?,
      emotionalConnection: json['emotionalConnection'] as String?,
      visitGoal: json['visitGoal'] as String?,
      additionalContext: json['additionalContext'] as String?,
    );

Map<String, dynamic> _$$ContextDataImplToJson(_$ContextDataImpl instance) =>
    <String, dynamic>{
      'artMemory': instance.artMemory,
      'emotionalConnection': instance.emotionalConnection,
      'visitGoal': instance.visitGoal,
      'additionalContext': instance.additionalContext,
    };

_$PreferencesDataImpl _$$PreferencesDataImplFromJson(
  Map<String, dynamic> json,
) => _$PreferencesDataImpl(
  narrativeStyle:
      $enumDecodeNullable(_$NarrativeStyleEnumMap, json['narrativeStyle']) ??
      NarrativeStyle.descriptive,
  ttsSpeed:
      $enumDecodeNullable(_$TtsSpeedEnumMap, json['ttsSpeed']) ??
      TtsSpeed.normal,
  enableHapticFeedback: json['enableHapticFeedback'] as bool? ?? true,
  enableAutoPlay: json['enableAutoPlay'] as bool? ?? true,
  preferredLanguage: json['preferredLanguage'] as String? ?? 'ko-KR',
);

Map<String, dynamic> _$$PreferencesDataImplToJson(
  _$PreferencesDataImpl instance,
) => <String, dynamic>{
  'narrativeStyle': _$NarrativeStyleEnumMap[instance.narrativeStyle]!,
  'ttsSpeed': _$TtsSpeedEnumMap[instance.ttsSpeed]!,
  'enableHapticFeedback': instance.enableHapticFeedback,
  'enableAutoPlay': instance.enableAutoPlay,
  'preferredLanguage': instance.preferredLanguage,
};

const _$NarrativeStyleEnumMap = {
  NarrativeStyle.descriptive: 'DESCRIPTIVE',
  NarrativeStyle.emotional: 'EMOTIONAL',
  NarrativeStyle.historical: 'HISTORICAL',
  NarrativeStyle.simple: 'SIMPLE',
};

const _$TtsSpeedEnumMap = {
  TtsSpeed.slow: 'SLOW',
  TtsSpeed.normal: 'NORMAL',
  TtsSpeed.fast: 'FAST',
};

_$OnboardingDataImpl _$$OnboardingDataImplFromJson(Map<String, dynamic> json) =>
    _$OnboardingDataImpl(
      profile: json['profile'] == null
          ? const ProfileData()
          : ProfileData.fromJson(json['profile'] as Map<String, dynamic>),
      context: json['context'] == null
          ? const ContextData()
          : ContextData.fromJson(json['context'] as Map<String, dynamic>),
      preferences: json['preferences'] == null
          ? const PreferencesData()
          : PreferencesData.fromJson(
              json['preferences'] as Map<String, dynamic>,
            ),
      currentStep:
          $enumDecodeNullable(_$OnboardingStepEnumMap, json['currentStep']) ??
          OnboardingStep.profile,
      completedSteps:
          (json['completedSteps'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry($enumDecode(_$OnboardingStepEnumMap, k), e as bool),
          ) ??
          const {},
      skippedSteps:
          (json['skippedSteps'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry($enumDecode(_$OnboardingStepEnumMap, k), e as bool),
          ) ??
          const {},
    );

Map<String, dynamic> _$$OnboardingDataImplToJson(
  _$OnboardingDataImpl instance,
) => <String, dynamic>{
  'profile': instance.profile,
  'context': instance.context,
  'preferences': instance.preferences,
  'currentStep': _$OnboardingStepEnumMap[instance.currentStep]!,
  'completedSteps': instance.completedSteps.map(
    (k, e) => MapEntry(_$OnboardingStepEnumMap[k]!, e),
  ),
  'skippedSteps': instance.skippedSteps.map(
    (k, e) => MapEntry(_$OnboardingStepEnumMap[k]!, e),
  ),
};

const _$OnboardingStepEnumMap = {
  OnboardingStep.profile: 'profile',
  OnboardingStep.context: 'context',
  OnboardingStep.preferences: 'preferences',
  OnboardingStep.completed: 'completed',
};
