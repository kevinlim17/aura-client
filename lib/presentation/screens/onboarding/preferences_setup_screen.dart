import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/providers/preferences_provider.dart';
import '../../../domain/providers/onboarding_provider.dart';
import '../../../domain/providers/tts_provider.dart';
import '../../../domain/entities/preferences_entity.dart';
import '../../../domain/entities/preferences_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';

/// Preferences setup screen for onboarding
/// Allows users to configure their preferences including TTS settings and accessibility options
class PreferencesSetupScreen extends ConsumerStatefulWidget {
  const PreferencesSetupScreen({super.key});

  @override
  ConsumerState<PreferencesSetupScreen> createState() =>
      _PreferencesSetupScreenState();
}

class _PreferencesSetupScreenState
    extends ConsumerState<PreferencesSetupScreen> {
  @override
  void initState() {
    super.initState();

    // Initialize with defaults and announce screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = ref.read(preferencesNotifierProvider.notifier);
      notifier.initializeWithDefaults();

      final ttsService = ref.read(ttsServiceProvider);
      ttsService.speak(
        '선호도 설정 화면입니다. 서사 스타일, 음성 설정, 접근성 옵션을 설정할 수 있습니다.',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final preferencesState = ref.watch(preferencesNotifierProvider);
    final preferences = preferencesState.preferences ?? PreferencesEntity.defaults();
    final isLoading = preferencesState.isLoading;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          '선호도 설정',
          style: AppTypography.headline1,
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Narrative Style Section
                _buildSectionTitle('서사 스타일'),
                _buildNarrativeStyleSelector(preferences),
                const SizedBox(height: AppSpacing.xl),

                // Preferred Length Section
                _buildSectionTitle('길이 선호도'),
                _buildPreferredLengthSelector(preferences),
                const SizedBox(height: AppSpacing.xl),

                // TTS Speed Section
                _buildSectionTitle('음성 속도'),
                _buildTtsSpeedSlider(preferences),
                const SizedBox(height: AppSpacing.xl),

                // TTS Pitch Section
                _buildSectionTitle('음성 높이'),
                _buildTtsPitchSlider(preferences),
                const SizedBox(height: AppSpacing.xl),

                // TTS Voice Section
                _buildSectionTitle('음성 유형'),
                _buildTtsVoiceSelector(preferences),
                const SizedBox(height: AppSpacing.xl),

                // Preview Button
                _buildPreviewButton(),
                const SizedBox(height: AppSpacing.xl),

                // Accessibility Options Section
                _buildSectionTitle('접근성 옵션'),
                _buildAccessibilityOptions(preferences),
                const SizedBox(height: AppSpacing.xxl),

                // Save Button
                _buildSaveButton(preferences, isLoading),
                const SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
          if (isLoading) _buildLoadingOverlay(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Semantics(
      header: true,
      child: Text(
        title,
        style: AppTypography.headline2.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildNarrativeStyleSelector(PreferencesEntity preferences) {
    return Column(
      children: NarrativeStyle.values.map((style) {
        final isSelected = preferences.narrativeStyle == style;
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: InkWell(
            onTap: () async {
              if (preferences.enableHapticFeedback) {
                HapticFeedback.selectionClick();
              }
              await ref
                  .read(preferencesNotifierProvider.notifier)
                  .updateNarrativeStyle(style);
            },
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withValues(alpha: 0.1)
                    : AppColors.surface,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.dividerLight,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Icon(
                    isSelected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    color: isSelected ? AppColors.primary : AppColors.textSecondary,
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(
                      _getNarrativeStyleDescription(style),
                      style: AppTypography.body1.copyWith(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.textPrimary,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPreferredLengthSelector(PreferencesEntity preferences) {
    return Row(
      children: PreferredLength.values.map((length) {
        final isSelected = preferences.preferredLength == length;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
            child: InkWell(
              onTap: () async {
                if (preferences.enableHapticFeedback) {
                  HapticFeedback.selectionClick();
                }
                await ref
                    .read(preferencesNotifierProvider.notifier)
                    .updatePreferredLength(length);
              },
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.md,
                  horizontal: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.surface,
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.dividerLight,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    _getPreferredLengthDescription(length),
                    style: AppTypography.body2.copyWith(
                      color: isSelected
                          ? AppColors.textOnPrimary
                          : AppColors.textPrimary,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTtsSpeedSlider(PreferencesEntity preferences) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '현재: ${preferences.ttsSpeedDescription}',
              style: AppTypography.body2.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              '${preferences.ttsSpeed.toStringAsFixed(1)}x',
              style: AppTypography.body2.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Slider(
          value: preferences.ttsSpeed,
          min: 0.5,
          max: 2.0,
          divisions: 15,
          label: '${preferences.ttsSpeed.toStringAsFixed(1)}x',
          onChanged: (value) async {
            if (preferences.enableHapticFeedback) {
              HapticFeedback.selectionClick();
            }
            await ref
                .read(preferencesNotifierProvider.notifier)
                .updateTtsSpeed(value);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('0.5x', style: AppTypography.caption),
            Text('2.0x', style: AppTypography.caption),
          ],
        ),
      ],
    );
  }

  Widget _buildTtsPitchSlider(PreferencesEntity preferences) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '현재: ${preferences.ttsPitchDescription}',
              style: AppTypography.body2.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              preferences.ttsPitch.toStringAsFixed(1),
              style: AppTypography.body2.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Slider(
          value: preferences.ttsPitch,
          min: 0.5,
          max: 2.0,
          divisions: 15,
          label: preferences.ttsPitch.toStringAsFixed(1),
          onChanged: (value) async {
            if (preferences.enableHapticFeedback) {
              HapticFeedback.selectionClick();
            }
            await ref
                .read(preferencesNotifierProvider.notifier)
                .updateTtsPitch(value);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('0.5', style: AppTypography.caption),
            Text('2.0', style: AppTypography.caption),
          ],
        ),
      ],
    );
  }

  Widget _buildTtsVoiceSelector(PreferencesEntity preferences) {
    return Row(
      children: TtsVoice.values.map((voice) {
        final isSelected = preferences.ttsVoice == voice;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
            child: InkWell(
              onTap: () async {
                if (preferences.enableHapticFeedback) {
                  HapticFeedback.selectionClick();
                }
                await ref
                    .read(preferencesNotifierProvider.notifier)
                    .updateTtsVoice(voice);
              },
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.md,
                  horizontal: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.surface,
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.dividerLight,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    _getTtsVoiceDescription(voice),
                    style: AppTypography.body2.copyWith(
                      color: isSelected
                          ? AppColors.textOnPrimary
                          : AppColors.textPrimary,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPreviewButton() {
    return Center(
      child: SecondaryButton(
        label: '미리듣기',
        semanticLabel: '현재 설정된 음성으로 미리듣기',
        onPressed: () {
          ref.read(preferencesNotifierProvider.notifier).playSample();
        },
        icon: Icons.play_arrow,
      ),
    );
  }

  Widget _buildAccessibilityOptions(PreferencesEntity preferences) {
    return Column(
      children: [
        _buildToggleOption(
          title: '햅틱 피드백',
          subtitle: '터치 시 진동 피드백',
          value: preferences.enableHapticFeedback,
          onChanged: (_) {
            ref
                .read(preferencesNotifierProvider.notifier)
                .toggleHapticFeedback();
          },
        ),
        _buildToggleOption(
          title: '오디오 설명',
          subtitle: '상세한 음성 안내',
          value: preferences.enableAudioDescriptions,
          onChanged: (_) {
            ref
                .read(preferencesNotifierProvider.notifier)
                .toggleAudioDescriptions();
          },
        ),
        _buildToggleOption(
          title: '고대비 모드',
          subtitle: '화면 대비 향상',
          value: preferences.highContrastMode,
          onChanged: (_) {
            ref
                .read(preferencesNotifierProvider.notifier)
                .toggleHighContrastMode();
          },
        ),
        _buildToggleOption(
          title: '푸시 알림',
          subtitle: '중요한 알림 수신',
          value: preferences.enablePushNotifications,
          onChanged: (_) {
            ref
                .read(preferencesNotifierProvider.notifier)
                .togglePushNotifications();
          },
        ),
      ],
    );
  }

  Widget _buildToggleOption({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(
            color: AppColors.dividerLight,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.body1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    subtitle,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeTrackColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton(PreferencesEntity preferences, bool isLoading) {
    return PrimaryButton(
      label: '저장하고 계속',
      semanticLabel: '선호도 설정을 저장하고 다음 단계로 이동',
      onPressed: isLoading
          ? null
          : () async {
              // Save preferences to server
              await ref
                  .read(preferencesNotifierProvider.notifier)
                  .savePreferences(preferences);

              if (mounted) {
                final ttsService = ref.read(ttsServiceProvider);

                // Check if save was successful
                final preferencesState = ref.read(preferencesNotifierProvider);
                if (preferencesState.hasError) {
                  await ttsService.speak('설정 저장에 실패했습니다. 다시 시도해주세요.');
                  return;
                }

                await ttsService.speak('선호도 설정이 완료되었습니다.');

                // Complete onboarding preferences step
                await ref
                    .read(onboardingNotifierProvider.notifier)
                    .completeCurrentStep();
              }
            },
      isLoading: isLoading,
    );
  }

  Widget _buildLoadingOverlay() {
    return Container(
      color: Colors.black54,
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
        ),
      ),
    );
  }

  String _getNarrativeStyleDescription(NarrativeStyle style) {
    switch (style) {
      case NarrativeStyle.literary:
        return '문학적 서사';
      case NarrativeStyle.conversational:
        return '대화형 서사';
      case NarrativeStyle.scholarly:
        return '학술적 서사';
      case NarrativeStyle.poetic:
        return '시적 서사';
    }
  }

  String _getPreferredLengthDescription(PreferredLength length) {
    switch (length) {
      case PreferredLength.short:
        return '짧게';
      case PreferredLength.medium:
        return '보통';
      case PreferredLength.long:
        return '길게';
    }
  }

  String _getTtsVoiceDescription(TtsVoice voice) {
    switch (voice) {
      case TtsVoice.male:
        return '남성';
      case TtsVoice.female:
        return '여성';
      case TtsVoice.neutral:
        return '중성';
    }
  }
}