import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/onboarding_data.dart';
import '../entities/onboarding_state.dart';
import '../../core/accessibility/tts_service.dart';

/// OnboardingNotifier manages onboarding state and transitions
class OnboardingNotifier extends StateNotifier<OnboardingState> {
  final TtsService _ttsService;

  OnboardingNotifier({
    required TtsService ttsService,
  })  : _ttsService = ttsService,
        super(const OnboardingState.initial());

  /// Start onboarding process
  Future<void> startOnboarding({bool enableTts = true}) async {
    // Initialize with first step
    final data = const OnboardingData();

    state = OnboardingState.inProgress(data: data);

    // TTS announcement
    if (enableTts) {
      final config = OnboardingStepConfig.getConfig(data.currentStep);
      await _ttsService.speak(
        OnboardingTtsMessages.welcomeMessage,
        interrupt: true,
      );
      await Future.delayed(const Duration(milliseconds: 500));
      await _ttsService.speak(config.ttsMessage);
    }
  }

  /// Update profile data (Step 1)
  void updateProfile({
    List<String>? interests,
    List<String>? hobbies,
    List<String>? favoriteArtists,
    String? additionalInfo,
  }) {
    final currentData = state.data ?? const OnboardingData();
    final updatedProfile = currentData.profile.copyWith(
      interests: interests ?? currentData.profile.interests,
      hobbies: hobbies ?? currentData.profile.hobbies,
      favoriteArtists: favoriteArtists ?? currentData.profile.favoriteArtists,
      additionalInfo: additionalInfo ?? currentData.profile.additionalInfo,
    );

    state = OnboardingState.inProgress(
      data: currentData.copyWith(profile: updatedProfile),
    );
  }

  /// Update context data (Step 2)
  void updateContext({
    String? artMemory,
    String? emotionalConnection,
    String? visitGoal,
    String? additionalContext,
  }) {
    final currentData = state.data ?? const OnboardingData();
    final updatedContext = currentData.context.copyWith(
      artMemory: artMemory ?? currentData.context.artMemory,
      emotionalConnection:
          emotionalConnection ?? currentData.context.emotionalConnection,
      visitGoal: visitGoal ?? currentData.context.visitGoal,
      additionalContext:
          additionalContext ?? currentData.context.additionalContext,
    );

    state = OnboardingState.inProgress(
      data: currentData.copyWith(context: updatedContext),
    );
  }

  /// Update preferences data (Step 3)
  void updatePreferences({
    NarrativeStyle? narrativeStyle,
    TtsSpeed? ttsSpeed,
    bool? enableHapticFeedback,
    bool? enableAutoPlay,
    String? preferredLanguage,
  }) {
    final currentData = state.data ?? const OnboardingData();
    final updatedPreferences = currentData.preferences.copyWith(
      narrativeStyle: narrativeStyle ?? currentData.preferences.narrativeStyle,
      ttsSpeed: ttsSpeed ?? currentData.preferences.ttsSpeed,
      enableHapticFeedback:
          enableHapticFeedback ?? currentData.preferences.enableHapticFeedback,
      enableAutoPlay: enableAutoPlay ?? currentData.preferences.enableAutoPlay,
      preferredLanguage:
          preferredLanguage ?? currentData.preferences.preferredLanguage,
    );

    state = OnboardingState.inProgress(
      data: currentData.copyWith(preferences: updatedPreferences),
    );

    // Apply TTS speed if changed
    if (ttsSpeed != null) {
      _applyTtsSpeed(ttsSpeed);
    }
  }

  /// Apply TTS speed setting
  void _applyTtsSpeed(TtsSpeed speed) {
    final rate = switch (speed) {
      TtsSpeed.slow => 0.7,
      TtsSpeed.normal => 1.0,
      TtsSpeed.fast => 1.3,
    };
    _ttsService.setSpeechRate(rate);
  }

  /// Complete current step and move to next
  Future<void> completeCurrentStep({bool enableTts = true}) async {
    final currentData = state.data;
    if (currentData == null) return;

    final currentStep = currentData.currentStep;

    // Mark current step as completed
    final updatedCompletedSteps = Map<OnboardingStep, bool>.from(
      currentData.completedSteps,
    )..[currentStep] = true;

    // Determine next step
    final nextStep = _getNextStep(currentStep);

    // Update state
    final updatedData = currentData.copyWith(
      completedSteps: updatedCompletedSteps,
      currentStep: nextStep,
    );

    if (nextStep == OnboardingStep.completed) {
      state = OnboardingState.completed(data: updatedData);

      if (enableTts) {
        await _ttsService.speak(
          OnboardingTtsMessages.completedMessage,
          interrupt: true,
        );
      }
    } else {
      state = OnboardingState.stepCompleted(
        data: updatedData,
        completedStep: currentStep,
      );

      if (enableTts) {
        await _ttsService.speak(
          OnboardingTtsMessages.stepCompleted(currentStep),
          interrupt: true,
        );
        await Future.delayed(const Duration(milliseconds: 500));

        final nextConfig = OnboardingStepConfig.getConfig(nextStep);
        await _ttsService.speak(nextConfig.ttsMessage);
      }

      // Transition to in progress for next step
      state = OnboardingState.inProgress(data: updatedData);
    }
  }

  /// Skip current step (if skippable) and move to next
  Future<void> skipCurrentStep({bool enableTts = true}) async {
    final currentData = state.data;
    if (currentData == null) return;

    final currentStep = currentData.currentStep;
    final config = OnboardingStepConfig.getConfig(currentStep);

    // Check if step is skippable
    if (!config.isSkippable) {
      if (enableTts) {
        await _ttsService.speak(
          OnboardingTtsMessages.cannotSkip,
          interrupt: true,
        );
      }
      return;
    }

    // Mark current step as skipped
    final updatedSkippedSteps = Map<OnboardingStep, bool>.from(
      currentData.skippedSteps,
    )..[currentStep] = true;

    // Determine next step
    final nextStep = _getNextStep(currentStep);

    // Update state
    final updatedData = currentData.copyWith(
      skippedSteps: updatedSkippedSteps,
      currentStep: nextStep,
    );

    if (enableTts) {
      await _ttsService.speak(
        OnboardingTtsMessages.stepSkipped(currentStep),
        interrupt: true,
      );
    }

    if (nextStep == OnboardingStep.completed) {
      state = OnboardingState.completed(data: updatedData);

      if (enableTts) {
        await Future.delayed(const Duration(milliseconds: 500));
        await _ttsService.speak(OnboardingTtsMessages.completedMessage);
      }
    } else {
      if (enableTts) {
        await Future.delayed(const Duration(milliseconds: 500));
        final nextConfig = OnboardingStepConfig.getConfig(nextStep);
        await _ttsService.speak(nextConfig.ttsMessage);
      }

      state = OnboardingState.inProgress(data: updatedData);
    }
  }

  /// Go back to previous step
  Future<void> goToPreviousStep({bool enableTts = true}) async {
    final currentData = state.data;
    if (currentData == null) return;

    final currentStep = currentData.currentStep;
    final previousStep = _getPreviousStep(currentStep);

    if (previousStep == null) {
      if (enableTts) {
        await _ttsService.speak(
          OnboardingTtsMessages.noPreviousStep,
          interrupt: true,
        );
      }
      return;
    }

    final updatedData = currentData.copyWith(currentStep: previousStep);
    state = OnboardingState.inProgress(data: updatedData);

    if (enableTts) {
      final config = OnboardingStepConfig.getConfig(previousStep);
      await _ttsService.speak(config.ttsMessage, interrupt: true);
    }
  }

  /// Get next step in sequence
  OnboardingStep _getNextStep(OnboardingStep current) {
    return switch (current) {
      OnboardingStep.profile => OnboardingStep.context,
      OnboardingStep.context => OnboardingStep.preferences,
      OnboardingStep.preferences => OnboardingStep.completed,
      OnboardingStep.completed => OnboardingStep.completed,
    };
  }

  /// Get previous step in sequence
  OnboardingStep? _getPreviousStep(OnboardingStep current) {
    return switch (current) {
      OnboardingStep.profile => null,
      OnboardingStep.context => OnboardingStep.profile,
      OnboardingStep.preferences => OnboardingStep.context,
      OnboardingStep.completed => OnboardingStep.preferences,
    };
  }

  /// Announce current step (for accessibility)
  Future<void> announceCurrentStep() async {
    final currentData = state.data;
    if (currentData == null) return;

    final config = OnboardingStepConfig.getConfig(currentData.currentStep);
    await _ttsService.speak(config.ttsMessage, interrupt: true);
  }

  /// Reset onboarding to initial state
  void reset() {
    state = const OnboardingState.initial();
  }

  /// Mark onboarding as completed directly (used when profile already exists)
  void markAsCompleted() {
    final data = const OnboardingData().copyWith(
      currentStep: OnboardingStep.completed,
    );
    state = OnboardingState.completed(data: data);
  }

  /// Debug mode flag
  bool get debugMode => kDebugMode;
}

/// TTS messages for onboarding
class OnboardingTtsMessages {
  static const String welcomeMessage =
      '온보딩을 시작합니다. 총 3단계로 진행됩니다.';

  static const String completedMessage =
      '온보딩이 완료되었습니다. 이제 Aura를 사용할 준비가 되었습니다.';

  static const String cannotSkip = '이 단계는 건너뛸 수 없습니다.';

  static const String noPreviousStep = '첫 번째 단계입니다. 이전 단계가 없습니다.';

  static String stepCompleted(OnboardingStep step) {
    final stepName = switch (step) {
      OnboardingStep.profile => '프로필 생성',
      OnboardingStep.context => '컨텍스트 추가',
      OnboardingStep.preferences => '선호도 설정',
      OnboardingStep.completed => '완료',
    };
    return '$stepName 단계가 완료되었습니다.';
  }

  static String stepSkipped(OnboardingStep step) {
    final stepName = switch (step) {
      OnboardingStep.profile => '프로필 생성',
      OnboardingStep.context => '컨텍스트 추가',
      OnboardingStep.preferences => '선호도 설정',
      OnboardingStep.completed => '완료',
    };
    return '$stepName 단계를 건너뛰었습니다.';
  }
}