import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/onboarding_data.dart';
import '../entities/onboarding_state.dart';
import 'onboarding_notifier.dart';
import 'auth_provider.dart';

/// Onboarding state notifier provider
/// Main provider for managing onboarding flow
final onboardingNotifierProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) {
  final ttsService = ref.watch(ttsServiceProvider);

  return OnboardingNotifier(ttsService: ttsService);
});

/// Provider to get current onboarding data
final onboardingDataProvider = Provider<OnboardingData?>((ref) {
  final state = ref.watch(onboardingNotifierProvider);
  return state.data;
});

/// Provider to get current onboarding step
final currentOnboardingStepProvider = Provider<OnboardingStep?>((ref) {
  final data = ref.watch(onboardingDataProvider);
  return data?.currentStep;
});

/// Provider to get current step configuration
final currentStepConfigProvider = Provider<OnboardingStepConfig?>((ref) {
  final step = ref.watch(currentOnboardingStepProvider);
  if (step == null) return null;
  return OnboardingStepConfig.getConfig(step);
});

/// Provider to check if current step can be skipped
final canSkipCurrentStepProvider = Provider<bool>((ref) {
  final config = ref.watch(currentStepConfigProvider);
  return config?.isSkippable ?? false;
});

/// Provider to get onboarding progress (0.0 - 1.0)
final onboardingProgressProvider = Provider<double>((ref) {
  final data = ref.watch(onboardingDataProvider);
  return data?.progressPercentage ?? 0.0;
});

/// Provider to check if onboarding is completed
final isOnboardingCompletedProvider = Provider<bool>((ref) {
  final state = ref.watch(onboardingNotifierProvider);
  return state.isCompleted;
});

/// Provider to check if onboarding is in progress
final isOnboardingInProgressProvider = Provider<bool>((ref) {
  final state = ref.watch(onboardingNotifierProvider);
  return state.isInProgress;
});

/// Provider to get profile data
final profileDataProvider = Provider<ProfileData?>((ref) {
  final data = ref.watch(onboardingDataProvider);
  return data?.profile;
});

/// Provider to get context data
final contextDataProvider = Provider<ContextData?>((ref) {
  final data = ref.watch(onboardingDataProvider);
  return data?.context;
});

/// Provider to get preferences data
final preferencesDataProvider = Provider<PreferencesData?>((ref) {
  final data = ref.watch(onboardingDataProvider);
  return data?.preferences;
});

/// Provider to check if step is completed
final isStepCompletedProvider =
    Provider.family<bool, OnboardingStep>((ref, step) {
  final data = ref.watch(onboardingDataProvider);
  return data?.isStepCompleted(step) ?? false;
});

/// Provider to check if step is skipped
final isStepSkippedProvider =
    Provider.family<bool, OnboardingStep>((ref, step) {
  final data = ref.watch(onboardingDataProvider);
  return data?.isStepSkipped(step) ?? false;
});

/// Provider to get TTS speed from preferences
final onboardingTtsSpeedProvider = Provider<TtsSpeed>((ref) {
  final preferences = ref.watch(preferencesDataProvider);
  return preferences?.ttsSpeed ?? TtsSpeed.normal;
});

/// Provider to get narrative style from preferences
final narrativeStyleProvider = Provider<NarrativeStyle>((ref) {
  final preferences = ref.watch(preferencesDataProvider);
  return preferences?.narrativeStyle ?? NarrativeStyle.descriptive;
});

/// Provider to check if haptic feedback is enabled
final isHapticEnabledProvider = Provider<bool>((ref) {
  final preferences = ref.watch(preferencesDataProvider);
  return preferences?.enableHapticFeedback ?? true;
});

/// Provider to check if auto play is enabled
final isAutoPlayEnabledProvider = Provider<bool>((ref) {
  final preferences = ref.watch(preferencesDataProvider);
  return preferences?.enableAutoPlay ?? true;
});

/// Combined provider that checks both auth and onboarding status
/// Use this to determine if user needs onboarding after login
final needsOnboardingProvider = Provider<bool>((ref) {
  final isAuthenticated = ref.watch(isAuthenticatedProvider);
  final isOnboardingCompleted = ref.watch(isOnboardingCompletedProvider);

  // User is authenticated but hasn't completed onboarding
  return isAuthenticated && !isOnboardingCompleted;
});

/// Provider for step-specific TTS messages
final stepTtsMessageProvider =
    Provider.family<String, OnboardingStep>((ref, step) {
  final config = OnboardingStepConfig.getConfig(step);
  return config.ttsMessage;
});

/// Provider to get all step configurations
final allStepConfigsProvider = Provider<List<OnboardingStepConfig>>((ref) {
  return OnboardingStepConfig.allSteps;
});