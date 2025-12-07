import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/providers/onboarding_provider.dart';
import '../../../domain/providers/auth_provider.dart';
import '../../../domain/providers/profile_provider.dart';
import '../../../domain/providers/tts_provider.dart';
import '../../../domain/entities/onboarding_state.dart';
import '../../../domain/entities/profile_entity.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';
import '../../widgets/step_progress_indicator.dart';
import '../../widgets/voice_input_button.dart';
import '../../navigation/app_routes.dart';

/// Profile setup screen (Step 1 of onboarding)
/// User selects interests, hobbies, favorite artists
class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  // Form controllers
  final _hobbiesController = TextEditingController();
  final _artistInputController = TextEditingController();
  final _bioController = TextEditingController();

  // Selected interests
  final Set<String> _selectedInterests = {};

  // Favorite artists list
  final List<String> _favoriteArtists = [];

  // Voice recording state
  bool _isRecording = false;
  String? _hobbiesVoiceUrl;

  // Loading state
  bool _isLoading = false;

  // Available interest options
  static const List<String> _interestOptions = [
    '예술',
    '음악',
    '자연',
    '여행',
    '인상주의',
    '현대미술',
    '추상화',
    '르네상스',
    '바로크',
    '팝아트',
  ];

  @override
  void initState() {
    super.initState();
    // TTS announcement when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ttsService = ref.read(ttsServiceProvider);
      final config = ref.read(currentStepConfigProvider);
      if (config != null) {
        ttsService.speak(config.ttsMessage);
      }
    });
  }

  @override
  void dispose() {
    _hobbiesController.dispose();
    _artistInputController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  /// Add artist to favorites list
  void _addArtist(String artist) {
    if (artist.trim().isEmpty) return;
    if (_favoriteArtists.contains(artist.trim())) return;

    setState(() {
      _favoriteArtists.add(artist.trim());
      _artistInputController.clear();
    });

    // TTS feedback
    final ttsService = ref.read(ttsServiceProvider);
    ttsService.speak('$artist 추가됨');

    // Haptic feedback
    HapticFeedback.selectionClick();
  }

  /// Remove artist from favorites list
  void _removeArtist(String artist) {
    setState(() {
      _favoriteArtists.remove(artist);
    });

    // TTS feedback
    final ttsService = ref.read(ttsServiceProvider);
    ttsService.speak('$artist 제거됨');

    // Haptic feedback
    HapticFeedback.selectionClick();
  }

  /// Toggle voice recording
  Future<void> _toggleVoiceRecording() async {
    final ttsService = ref.read(ttsServiceProvider);

    if (_isRecording) {
      // Stop recording
      setState(() => _isRecording = false);
      ttsService.speak('녹음이 종료되었습니다');

      // TODO: Implement actual voice recording service
      // For now, just simulate a recorded URL
      setState(() {
        _hobbiesVoiceUrl = 'https://example.com/voice/hobbies_${DateTime.now().millisecondsSinceEpoch}.mp3';
      });

      ttsService.speak('음성이 저장되었습니다');
    } else {
      // Start recording
      setState(() => _isRecording = true);
      ttsService.speak('녹음을 시작합니다. 취미에 대해 말씀해주세요.');

      // TODO: Implement actual voice recording service
    }
  }

  /// Handle next button press
  Future<void> _handleNext() async {
    // Haptic feedback
    HapticFeedback.mediumImpact();

    final ttsService = ref.read(ttsServiceProvider);

    // Validate at least one interest is selected
    if (_selectedInterests.isEmpty) {
      ttsService.speak('최소 한 개의 관심 분야를 선택해주세요.');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('최소 한 개의 관심 분야를 선택해주세요'),
            duration: Duration(seconds: 2),
          ),
        );
      }
      return;
    }

    // Validate hobbies (either text or voice)
    if (_hobbiesController.text.trim().isEmpty && _hobbiesVoiceUrl == null) {
      ttsService.speak('취미를 입력하거나 음성으로 녹음해주세요.');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('취미를 입력하거나 음성으로 녹음해주세요'),
            duration: Duration(seconds: 2),
          ),
        );
      }
      return;
    }

    // Validate bio
    if (_bioController.text.trim().isEmpty) {
      ttsService.speak('자기소개를 입력해주세요.');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('자기소개를 입력해주세요'),
            duration: Duration(seconds: 2),
          ),
        );
      }
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Get current user
      final authState = ref.read(authNotifierProvider);

      final (user, accessToken) = authState.maybeMap(
        authenticated: (state) => (state.user, state.accessToken),
        orElse: () => (null, null),
      );
      /**
      final user = authState.user;
      final accessToken = authState.accessToken;
       */

      if (user == null || accessToken == null) {
        throw Exception('User not authenticated');
      }

      // Create profile request
      final profileRequest = ProfileRequest(
        interests: _selectedInterests.toList(),
        hobbies: _hobbiesController.text.trim(),
        hobbiesVoiceUrl: _hobbiesVoiceUrl,
        favoriteArtists: _favoriteArtists,
        bio: _bioController.text.trim(),
      );

      // Get profile service
      final profileService = ref.read(profileServiceProvider);

      // Call API to create profile
      await profileService.createProfile(
        userId: int.parse(user.id),
        accessToken: accessToken,
        request: profileRequest,
      );

      await ttsService.speak('프로필이 저장되었습니다. 컨텍스트 설정으로 이동합니다.');

      // Complete current step and move to next
      await ref.read(onboardingNotifierProvider.notifier).completeCurrentStep();

      // Navigate to context setup screen
      if (mounted) {
        await AppNavigation.replaceWithContextSetup(context);
      }
    } catch (e) {
      setState(() => _isLoading = false);

      ttsService.speak('프로필 저장에 실패했습니다. 다시 시도해주세요.');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('프로필 저장 실패: $e'),
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  /// Handle back button press
  void _handleBack() {
    HapticFeedback.lightImpact();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final stepConfig = ref.watch(currentStepConfigProvider);
    final onboardingState = ref.watch(onboardingNotifierProvider);
    final isLoading = onboardingState.isLoading;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress indicator
              if (stepConfig != null)
                StepProgressIndicator(
                  currentStep: stepConfig.stepNumber,
                  totalSteps: stepConfig.totalSteps,
                ),
              const SizedBox(height: AppSpacing.xl),

              // Title
              Semantics(
                header: true,
                label: stepConfig?.title ?? '프로필 생성',
                child: Text(
                  stepConfig?.title ?? '프로필 생성',
                  style: AppTypography.headline1,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                stepConfig?.description ?? '관심사, 취미, 좋아하는 화가를 알려주세요',
                style: AppTypography.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Interests section
                      Semantics(
                        label: '관심 분야 선택',
                        child: Text('관심 분야 *', style: AppTypography.body1),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text('최소 1개 이상 선택해주세요', style: AppTypography.caption),
                      const SizedBox(height: AppSpacing.md),

                      // Interest chips
                      Wrap(
                        spacing: AppSpacing.sm,
                        runSpacing: AppSpacing.sm,
                        children: _interestOptions.map((interest) {
                          final isSelected = _selectedInterests.contains(
                            interest,
                          );

                          return Semantics(
                            label: '$interest, ${isSelected ? "선택됨" : "선택 안됨"}',
                            button: true,
                            selected: isSelected,
                            child: FilterChip(
                              label: Text(interest),
                              selected: isSelected,
                              onSelected: isLoading
                                  ? null
                                  : (selected) {
                                      HapticFeedback.selectionClick();
                                      setState(() {
                                        if (selected) {
                                          _selectedInterests.add(interest);
                                        } else {
                                          _selectedInterests.remove(interest);
                                        }
                                      });

                                      // TTS feedback
                                      final ttsService = ref.read(
                                        ttsServiceProvider,
                                      );
                                      ttsService.speak(
                                        selected
                                            ? '$interest 선택됨'
                                            : '$interest 선택 해제됨',
                                      );
                                    },
                              selectedColor: AppColors.primary,
                              checkmarkColor: AppColors.textOnPrimary,
                              backgroundColor: AppColors.surface,
                              labelStyle: AppTypography.body2.copyWith(
                                color: isSelected
                                    ? AppColors.textOnPrimary
                                    : AppColors.textPrimary,
                              ),
                              side: BorderSide(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.dividerLight,
                                width: 1.5,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: AppSpacing.xl),

                      // Hobbies section
                      Text('취미 *', style: AppTypography.body1),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        '텍스트로 입력하거나 음성으로 녹음하세요',
                        style: AppTypography.caption,
                      ),
                      const SizedBox(height: AppSpacing.md),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: AppTextField(
                              label: '',
                              hint: '예: 산책하며 새소리 듣기를 좋아합니다',
                              semanticLabel: '취미 입력 필드',
                              controller: _hobbiesController,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              maxLines: 3,
                              enabled: !isLoading && !_isRecording,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Column(
                            children: [
                              VoiceInputButton(
                                isRecording: _isRecording,
                                onTap: (_isLoading || _isRecording) ? () => _toggleVoiceRecording() : _toggleVoiceRecording,
                                semanticLabel: '취미 음성 녹음 버튼',
                              ),
                              if (_hobbiesVoiceUrl != null) ...[
                                const SizedBox(height: AppSpacing.sm),
                                Semantics(
                                  label: '음성 녹음 완료',
                                  child: Icon(
                                    Icons.check_circle,
                                    color: AppColors.success,
                                    size: 32,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.xl),

                      // Favorite artists section
                      Text('좋아하는 화가', style: AppTypography.body1),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        children: [
                          Expanded(
                            child: AppTextField(
                              label: '',
                              hint: '화가 이름 입력',
                              semanticLabel: '좋아하는 화가 입력 필드',
                              controller: _artistInputController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              enabled: !isLoading,
                              onSubmitted: _addArtist,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Semantics(
                            label: '화가 추가 버튼',
                            button: true,
                            child: IconButton(
                              icon: const Icon(Icons.add_circle),
                              iconSize: 40,
                              color: AppColors.primary,
                              onPressed: isLoading
                                  ? null
                                  : () =>
                                        _addArtist(_artistInputController.text),
                              tooltip: '추가',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // Artist tags
                      if (_favoriteArtists.isNotEmpty)
                        Semantics(
                          label: '선택된 화가: ${_favoriteArtists.join(", ")}',
                          child: Wrap(
                            spacing: AppSpacing.sm,
                            runSpacing: AppSpacing.sm,
                            children: _favoriteArtists.map((artist) {
                              return Chip(
                                label: Text(artist),
                                deleteIcon: const Icon(Icons.close, size: 18),
                                onDeleted: isLoading
                                    ? null
                                    : () => _removeArtist(artist),
                                backgroundColor: AppColors.primaryLight,
                                labelStyle: AppTypography.body2.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                                side: BorderSide.none,
                              );
                            }).toList(),
                          ),
                        ),
                      const SizedBox(height: AppSpacing.xl),

                      // Bio section
                      AppTextField(
                        label: '자기소개',
                        hint: '자신에 대해 간단히 소개해주세요',
                        semanticLabel: '자기소개 입력 필드',
                        controller: _bioController,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        maxLines: 4,
                        enabled: !isLoading,
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom buttons
              const SizedBox(height: AppSpacing.lg),
              PrimaryButton(
                label: '다음',
                semanticLabel: '다음 단계로 이동',
                onPressed: isLoading ? null : _handleNext,
                isLoading: isLoading,
              ),
              const SizedBox(height: AppSpacing.md),
              SecondaryButton(
                label: '이전',
                semanticLabel: '이전 화면으로 돌아가기',
                onPressed: isLoading ? null : _handleBack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
