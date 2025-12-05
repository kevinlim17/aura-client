import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_data.freezed.dart';
part 'onboarding_data.g.dart';

/// Onboarding step enumeration
enum OnboardingStep {
  /// Step 1: Profile creation (interests, hobbies, favorite artists)
  profile,

  /// Step 2: Context addition (memories, emotions, goals)
  context,

  /// Step 3: Preference settings (narrative style, TTS speed, etc.)
  preferences,

  /// Onboarding completed
  completed,
}

/// Configuration for each onboarding step
class OnboardingStepConfig {
  final OnboardingStep step;
  final String title;
  final String description;
  final String ttsMessage;
  final bool isSkippable;
  final int stepNumber;
  final int totalSteps;

  const OnboardingStepConfig({
    required this.step,
    required this.title,
    required this.description,
    required this.ttsMessage,
    required this.isSkippable,
    required this.stepNumber,
    required this.totalSteps,
  });

  /// Get all step configurations
  static List<OnboardingStepConfig> get allSteps => [
        const OnboardingStepConfig(
          step: OnboardingStep.profile,
          title: '프로필 생성',
          description: '관심사, 취미, 좋아하는 화가를 알려주세요',
          ttsMessage: '1단계, 프로필 생성입니다. 관심사, 취미, 좋아하는 화가를 입력해주세요. 이 단계는 건너뛸 수 없습니다.',
          isSkippable: false,
          stepNumber: 1,
          totalSteps: 3,
        ),
        const OnboardingStepConfig(
          step: OnboardingStep.context,
          title: '컨텍스트 추가',
          description: '미술 관련 기억, 감정, 목표를 공유해주세요',
          ttsMessage: '2단계, 컨텍스트 추가입니다. 미술 관련 기억, 감정, 목표를 공유해주세요. 이 단계는 건너뛸 수 있습니다.',
          isSkippable: true,
          stepNumber: 2,
          totalSteps: 3,
        ),
        const OnboardingStepConfig(
          step: OnboardingStep.preferences,
          title: '선호도 설정',
          description: '서사 스타일과 TTS 속도를 설정하세요',
          ttsMessage: '3단계, 선호도 설정입니다. 서사 스타일과 음성 안내 속도를 설정해주세요. 이 단계는 건너뛸 수 있습니다.',
          isSkippable: true,
          stepNumber: 3,
          totalSteps: 3,
        ),
      ];

  /// Get config for a specific step
  static OnboardingStepConfig getConfig(OnboardingStep step) {
    return allSteps.firstWhere(
      (config) => config.step == step,
      orElse: () => allSteps.first,
    );
  }
}

/// Narrative style preference
enum NarrativeStyle {
  @JsonValue('DESCRIPTIVE')
  descriptive, // 상세한 묘사

  @JsonValue('EMOTIONAL')
  emotional, // 감정 중심

  @JsonValue('HISTORICAL')
  historical, // 역사적 맥락

  @JsonValue('SIMPLE')
  simple, // 간결한 설명
}

/// TTS speed preference
enum TtsSpeed {
  @JsonValue('SLOW')
  slow, // 0.7x

  @JsonValue('NORMAL')
  normal, // 1.0x

  @JsonValue('FAST')
  fast, // 1.3x
}

/// Profile data (Step 1)
@freezed
class ProfileData with _$ProfileData {
  const factory ProfileData({
    @Default([]) List<String> interests,
    @Default([]) List<String> hobbies,
    @Default([]) List<String> favoriteArtists,
    String? additionalInfo,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}

/// Context data (Step 2)
@freezed
class ContextData with _$ContextData {
  const factory ContextData({
    String? artMemory,
    String? emotionalConnection,
    String? visitGoal,
    String? additionalContext,
  }) = _ContextData;

  factory ContextData.fromJson(Map<String, dynamic> json) =>
      _$ContextDataFromJson(json);
}

/// Preferences data (Step 3)
@freezed
class PreferencesData with _$PreferencesData {
  const factory PreferencesData({
    @Default(NarrativeStyle.descriptive) NarrativeStyle narrativeStyle,
    @Default(TtsSpeed.normal) TtsSpeed ttsSpeed,
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableAutoPlay,
    @Default('ko-KR') String preferredLanguage,
  }) = _PreferencesData;

  factory PreferencesData.fromJson(Map<String, dynamic> json) =>
      _$PreferencesDataFromJson(json);
}

/// Complete onboarding data containing all steps
@freezed
class OnboardingData with _$OnboardingData {
  const factory OnboardingData({
    @Default(ProfileData()) ProfileData profile,
    @Default(ContextData()) ContextData context,
    @Default(PreferencesData()) PreferencesData preferences,
    @Default(OnboardingStep.profile) OnboardingStep currentStep,
    @Default({}) Map<OnboardingStep, bool> completedSteps,
    @Default({}) Map<OnboardingStep, bool> skippedSteps,
  }) = _OnboardingData;

  factory OnboardingData.fromJson(Map<String, dynamic> json) =>
      _$OnboardingDataFromJson(json);
}

/// Extension for OnboardingData helper methods
extension OnboardingDataX on OnboardingData {
  /// Check if a step is completed
  bool isStepCompleted(OnboardingStep step) =>
      completedSteps[step] ?? false;

  /// Check if a step is skipped
  bool isStepSkipped(OnboardingStep step) =>
      skippedSteps[step] ?? false;

  /// Check if onboarding is fully completed
  bool get isOnboardingComplete =>
      currentStep == OnboardingStep.completed;

  /// Get progress percentage (0.0 - 1.0)
  double get progressPercentage {
    final completedCount = completedSteps.values.where((v) => v).length +
        skippedSteps.values.where((v) => v).length;
    return completedCount / 3;
  }

  /// Get current step config
  OnboardingStepConfig get currentStepConfig =>
      OnboardingStepConfig.getConfig(currentStep);

  /// Check if current step can be skipped
  bool get canSkipCurrentStep =>
      OnboardingStepConfig.getConfig(currentStep).isSkippable;
}