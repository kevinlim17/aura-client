import 'package:freezed_annotation/freezed_annotation.dart';
import 'onboarding_data.dart';

part 'onboarding_state.freezed.dart';

/// Onboarding state representation using freezed sealed class
@freezed
class OnboardingState with _$OnboardingState {
  /// Initial state - onboarding not started
  const factory OnboardingState.initial() = _Initial;

  /// Loading state during data operations
  const factory OnboardingState.loading({
    OnboardingData? data,
    String? message,
  }) = _Loading;

  /// In progress state with current step data
  const factory OnboardingState.inProgress({
    required OnboardingData data,
  }) = _InProgress;

  /// Step completed successfully
  const factory OnboardingState.stepCompleted({
    required OnboardingData data,
    required OnboardingStep completedStep,
  }) = _StepCompleted;

  /// Onboarding fully completed
  const factory OnboardingState.completed({
    required OnboardingData data,
  }) = _Completed;

  /// Error state
  const factory OnboardingState.error({
    required String message,
    OnboardingData? data,
  }) = _Error;
}

/// Extension for state checking and data access
extension OnboardingStateX on OnboardingState {
  /// Get onboarding data if available
  OnboardingData? get data => maybeWhen(
        loading: (data, _) => data,
        inProgress: (data) => data,
        stepCompleted: (data, _) => data,
        completed: (data) => data,
        error: (_, data) => data,
        orElse: () => null,
      );

  /// Check if currently loading
  bool get isLoading => this is _Loading;

  /// Check if in progress
  bool get isInProgress => this is _InProgress;

  /// Check if completed
  bool get isCompleted => this is _Completed;

  /// Check if has error
  bool get hasError => this is _Error;

  /// Get current step
  OnboardingStep? get currentStep => data?.currentStep;

  /// Get current step config
  OnboardingStepConfig? get currentStepConfig =>
      currentStep != null ? OnboardingStepConfig.getConfig(currentStep!) : null;

  /// Get progress percentage
  double get progress => data?.progressPercentage ?? 0.0;

  /// Check if can skip current step
  bool get canSkip => currentStepConfig?.isSkippable ?? false;
}