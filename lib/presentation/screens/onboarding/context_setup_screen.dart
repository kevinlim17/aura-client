import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/providers/onboarding_provider.dart';
import '../../../domain/providers/auth_provider.dart';
import '../../../domain/providers/context_provider.dart';
import '../../../domain/entities/onboarding_state.dart';
import '../../../domain/entities/context_entity.dart';
import '../../../domain/usecases/context_management_usecase.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';
import '../../widgets/step_progress_indicator.dart';
import '../../widgets/context/emotion_tags_selector.dart';
import '../../widgets/context/importance_slider.dart';
import '../../widgets/context/voice_recorder_widget.dart';

/// Context setup screen (Step 2 of onboarding)
/// User provides context with enhanced input options
class ContextSetupScreen extends ConsumerStatefulWidget {
  const ContextSetupScreen({super.key});

  @override
  ConsumerState<ContextSetupScreen> createState() =>
      _ContextSetupScreenState();
}

class _ContextSetupScreenState extends ConsumerState<ContextSetupScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ContextType _selectedContextType;

  // Form controllers
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  int _importanceLevel = 3;
  List<String> _selectedEmotionTags = [];
  InputMethod _inputMethod = InputMethod.text;
  String? _recordedVoiceFilePath;
  Duration? _recordedVoiceDuration;

  @override
  void initState() {
    super.initState();
    _selectedContextType = ContextType.memory;

    // Initialize tab controller
    _tabController = TabController(
      length: ContextType.values.length,
      vsync: this,
      initialIndex: 0,
    );

    _tabController.addListener(_onTabChanged);

    // Listen to content changes for emotion tag recommendations
    _contentController.addListener(_onContentChanged);

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
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _selectedContextType = ContextType.values[_tabController.index];
      });
    }
  }

  void _onContentChanged() {
    final content = _contentController.text;
    if (content.length > 20) {
      ref.read(emotionTagsNotifierProvider.notifier).getRecommendedTags(content);
    }
  }

  void _switchToTextInput() {
    setState(() {
      _inputMethod = InputMethod.text;
      _recordedVoiceFilePath = null;
      _recordedVoiceDuration = null;
    });
  }

  void _switchToVoiceInput() {
    setState(() {
      _inputMethod = InputMethod.voice;
    });
  }

  void _onRecordingComplete(RecordingResult result) {
    setState(() {
      _recordedVoiceFilePath = result.filePath;
      _recordedVoiceDuration = result.duration;
    });
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  /// Handle next button press
  Future<void> _handleNext() async {
    HapticFeedback.mediumImpact();

    // Validate input
    final content = _contentController.text.trim();
    if (_inputMethod == InputMethod.text && content.isEmpty) {
      _showError('내용을 입력해주세요');
      return;
    }

    if (_inputMethod == InputMethod.voice && _recordedVoiceFilePath == null) {
      _showError('음성을 녹음해주세요');
      return;
    }

    try {
      // Submit context
      final notifier = ref.read(contextNotifierProvider.notifier);

      if (_inputMethod == InputMethod.text) {
        await notifier.submitTextContext(
          contextType: _selectedContextType,
          content: content,
          title: _titleController.text.trim().isEmpty
              ? null
              : _titleController.text.trim(),
          emotionTags: _selectedEmotionTags,
          importanceLevel: _importanceLevel,
        );
      } else {
        await notifier.submitVoiceContext(
          contextType: _selectedContextType,
          voiceFilePath: _recordedVoiceFilePath!,
          title: _titleController.text.trim().isEmpty
              ? null
              : _titleController.text.trim(),
          transcribedText: _contentController.text.trim().isEmpty
              ? null
              : _contentController.text.trim(),
          emotionTags: _selectedEmotionTags,
          importanceLevel: _importanceLevel,
          autoTranscribe: true,
        );
      }

      _showSuccess('컨텍스트가 저장되었습니다');

      // Complete current step and move to next
      await ref.read(onboardingNotifierProvider.notifier).completeCurrentStep();
    } catch (e) {
      _showError('컨텍스트 저장에 실패했습니다: ${e.toString()}');
    }
  }

  /// Handle skip button press
  Future<void> _handleSkip() async {
    HapticFeedback.lightImpact();

    // Skip current step
    await ref.read(onboardingNotifierProvider.notifier).skipCurrentStep();
  }

  /// Handle back button press
  Future<void> _handleBack() async {
    HapticFeedback.lightImpact();

    // Go to previous step
    await ref.read(onboardingNotifierProvider.notifier).goToPreviousStep();
  }

  @override
  Widget build(BuildContext context) {
    final stepConfig = ref.watch(currentStepConfigProvider);
    final onboardingState = ref.watch(onboardingNotifierProvider);
    final contextState = ref.watch(contextNotifierProvider);
    final isLoading = onboardingState.isLoading ||
        contextState.maybeWhen(
          submitting: (_) => true,
          orElse: () => false,
        );
    final canSkip = ref.watch(canSkipCurrentStepProvider);

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
                label: stepConfig?.title ?? '컨텍스트 추가',
                child: Text(
                  stepConfig?.title ?? '컨텍스트 추가',
                  style: AppTypography.headline1,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                stepConfig?.description ?? '당신의 이야기를 들려주세요',
                style: AppTypography.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // Context type tabs
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                  indicator: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tabs: ContextType.values.map((type) {
                    return Tab(
                      height: 48,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(type.icon, style: const TextStyle(fontSize: 16)),
                          const SizedBox(width: 4),
                          Text(
                            type.displayName,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Input mode toggle
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SegmentedButton<InputMethod>(
                            segments: const [
                              ButtonSegment(
                                value: InputMethod.text,
                                icon: Icon(Icons.keyboard, size: 16),
                                label: Text('텍스트', style: TextStyle(fontSize: 12)),
                              ),
                              ButtonSegment(
                                value: InputMethod.voice,
                                icon: Icon(Icons.mic, size: 16),
                                label: Text('음성', style: TextStyle(fontSize: 12)),
                              ),
                            ],
                            selected: {_inputMethod},
                            onSelectionChanged: (Set<InputMethod> selected) {
                              if (selected.first == InputMethod.text) {
                                _switchToTextInput();
                              } else {
                                _switchToVoiceInput();
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // Title field
                      AppTextField(
                        label: '제목 (선택)',
                        hint: '컨텍스트 제목을 입력하세요',
                        semanticLabel: '제목 입력 필드',
                        controller: _titleController,
                        enabled: !isLoading,
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // Content input or voice recorder
                      if (_inputMethod == InputMethod.text) ...[
                        AppTextField(
                          label: '내용',
                          hint: '당신의 이야기를 들려주세요',
                          semanticLabel: '내용 입력 필드',
                          controller: _contentController,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          maxLines: 6,
                          enabled: !isLoading,
                        ),
                      ] else ...[
                        VoiceRecorderWidget(
                          onRecordingComplete: _onRecordingComplete,
                        ),
                        if (_recordedVoiceFilePath != null) ...[
                          const SizedBox(height: AppSpacing.md),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.green),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.check_circle, color: Colors.green),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    '녹음 완료 (${_recordedVoiceDuration?.inSeconds}초)',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    setState(() {
                                      _recordedVoiceFilePath = null;
                                      _recordedVoiceDuration = null;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                      const SizedBox(height: AppSpacing.lg),

                      // Emotion tags selector
                      EmotionTagsSelector(
                        selectedTags: _selectedEmotionTags,
                        onTagsChanged: (tags) {
                          setState(() {
                            _selectedEmotionTags = tags;
                          });
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),

                      // Importance slider
                      ImportanceSlider(
                        level: _importanceLevel,
                        onLevelChanged: (level) {
                          setState(() {
                            _importanceLevel = level;
                          });
                        },
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
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      label: '이전',
                      semanticLabel: '이전 단계로 돌아가기',
                      onPressed: isLoading ? null : _handleBack,
                    ),
                  ),
                  if (canSkip) ...[
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: SecondaryButton(
                        label: '건너뛰기',
                        semanticLabel: '이 단계 건너뛰기',
                        onPressed: isLoading ? null : _handleSkip,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
