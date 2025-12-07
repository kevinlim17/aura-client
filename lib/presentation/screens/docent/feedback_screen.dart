import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../domain/entities/feedback_entity.dart';
import '../../../domain/entities/docent_entity.dart';
import '../../../data/services/feedback_service.dart';
import '../../../domain/providers/auth_provider.dart';
import '../../../domain/providers/tts_provider.dart';
import '../../navigation/app_routes.dart';

/// Feedback screen for docent session
class FeedbackScreen extends ConsumerStatefulWidget {
  final DocentSessionEntity session;

  const FeedbackScreen({
    super.key,
    required this.session,
  });

  @override
  ConsumerState<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends ConsumerState<FeedbackScreen> {
  // Rating values (1-5)
  int? _emotionalResonance; // Required
  int? _imaginativeEngagement; // Optional
  int? _emotionalImpact; // Optional

  // Comment
  final TextEditingController _commentController = TextEditingController();

  // Improvement suggestions
  final TextEditingController _lengthSuggestionController =
      TextEditingController();
  final TextEditingController _styleSuggestionController =
      TextEditingController();

  // Loading state
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();

    // TTS announcement
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ttsService = ref.read(ttsServiceProvider);
      ttsService.speak('피드백 화면입니다. 도슨트 해설에 대한 평가를 해주세요.');
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    _lengthSuggestionController.dispose();
    _styleSuggestionController.dispose();
    super.dispose();
  }

  /// Handle submit
  Future<void> _handleSubmit() async {
    HapticFeedback.mediumImpact();

    if (_emotionalResonance == null) {
      final ttsService = ref.read(ttsServiceProvider);
      await ttsService.speak('개인적 공감도는 필수 항목입니다.');
      _showSnackBar('개인적 공감도는 필수 항목입니다.');
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final ttsService = ref.read(ttsServiceProvider);
      final token = ref.read(currentTokenProvider);

      if (token == null) {
        throw Exception('인증 토큰이 없습니다.');
      }

      // Build improvement suggestions
      ImprovementSuggestions? improvements;
      if (_lengthSuggestionController.text.isNotEmpty ||
          _styleSuggestionController.text.isNotEmpty) {
        improvements = ImprovementSuggestions(
          length: _lengthSuggestionController.text.isEmpty
              ? null
              : _lengthSuggestionController.text,
          style: _styleSuggestionController.text.isEmpty
              ? null
              : _styleSuggestionController.text,
        );
      }

      // Build feedback request
      final feedbackRequest = FeedbackSubmissionRequest(
        emotionalResonance: _emotionalResonance!,
        imaginativeEngagement: _imaginativeEngagement,
        emotionalImpact: _emotionalImpact,
        comment: _commentController.text.isEmpty ? null : _commentController.text,
        improvementSuggestions: improvements,
      );

      // Submit feedback
      final feedbackService = FeedbackService(
        baseUrl: ref.read(baseUrlProvider),
        client: ref.read(httpClientProvider),
      );

      final feedback = await feedbackService.submitFeedback(
        sessionId: widget.session.id,
        token: token,
        feedback: feedbackRequest,
      );

      debugPrint('[FeedbackScreen] Feedback submitted: ${feedback.id}');
      debugPrint(
          '[FeedbackScreen] Overall satisfaction: ${feedback.overallSatisfaction}');
      debugPrint(
          '[FeedbackScreen] Few-shot candidate: ${feedback.isFewShotCandidate}');

      // TTS feedback
      await ttsService.speak('소중한 피드백 감사합니다.');

      if (feedback.isFewShotCandidate) {
        await Future.delayed(const Duration(milliseconds: 500));
        await ttsService
            .speak('높은 평가를 주셔서 감사합니다. 더 나은 서비스를 위해 활용됩니다.');
      }

      // Navigate to home screen
      if (mounted) {
        await AppNavigation.toHome(context);
      }
    } catch (e) {
      debugPrint('[FeedbackScreen] Error submitting feedback: $e');
      _showSnackBar('피드백 제출에 실패했습니다. 다시 시도해주세요.');
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: Semantics(
          button: true,
          label: '뒤로 가기',
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.textPrimary,
            ),
            onPressed: () {
              HapticFeedback.lightImpact();
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          '피드백',
          style: AppTypography.headline2.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Text(
                      '도슨트 해설에 대한 평가',
                      style: AppTypography.headline1.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      '여러분의 소중한 의견이 서비스 개선에 큰 도움이 됩니다.',
                      style: AppTypography.body1.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxl),

                    // 1. Emotional Resonance (개인적 공감도) - Required
                    _RatingCard(
                      title: '개인적 공감도',
                      description: '도슨트의 해설이 당신의 개인적 경험과 얼마나 공감되었나요?',
                      isRequired: true,
                      value: _emotionalResonance,
                      onChanged: (value) async {
                        HapticFeedback.selectionClick();
                        setState(() {
                          _emotionalResonance = value;
                        });

                        final ttsService = ref.read(ttsServiceProvider);
                        await ttsService.speak('개인적 공감도 $value점을 선택하셨습니다.');
                      },
                    ),
                    const SizedBox(height: AppSpacing.xl),

                    // 2. Imaginative Engagement (상상적 몰입도) - Optional
                    _RatingCard(
                      title: '상상적 몰입도',
                      description: '해설을 들으며 작품 속 세계에 얼마나 몰입할 수 있었나요?',
                      isRequired: false,
                      value: _imaginativeEngagement,
                      onChanged: (value) async {
                        HapticFeedback.selectionClick();
                        setState(() {
                          _imaginativeEngagement = value;
                        });

                        final ttsService = ref.read(ttsServiceProvider);
                        await ttsService.speak('상상적 몰입도 $value점을 선택하셨습니다.');
                      },
                    ),
                    const SizedBox(height: AppSpacing.xl),

                    // 3. Emotional Impact (정서적 영향) - Optional
                    _RatingCard(
                      title: '정서적 영향',
                      description: '해설이 당신의 정서에 얼마나 깊은 영향을 미쳤나요?',
                      isRequired: false,
                      value: _emotionalImpact,
                      onChanged: (value) async {
                        HapticFeedback.selectionClick();
                        setState(() {
                          _emotionalImpact = value;
                        });

                        final ttsService = ref.read(ttsServiceProvider);
                        await ttsService.speak('정서적 영향 $value점을 선택하셨습니다.');
                      },
                    ),
                    const SizedBox(height: AppSpacing.xxl),

                    // Divider
                    Divider(
                      color: AppColors.dividerLight,
                      thickness: 2,
                    ),
                    const SizedBox(height: AppSpacing.xxl),

                    // 4. Comment (추가 코멘트) - Optional
                    _TextInputSection(
                      title: '추가 코멘트',
                      description: '도슨트 해설에 대한 자유로운 의견을 남겨주세요.',
                      isRequired: false,
                      controller: _commentController,
                      hintText: '예: 정말 감동적이고 개인적으로 공감되는 해설이었습니다.',
                      maxLines: 5,
                    ),
                    const SizedBox(height: AppSpacing.xl),

                    // 5. Improvement Suggestions (개선 제안) - Optional
                    Text(
                      '개선 제안 (선택)',
                      style: AppTypography.headline2.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      '더 나은 서비스를 위한 제안을 남겨주세요.',
                      style: AppTypography.body1.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),

                    // Length suggestion
                    _TextInputSection(
                      title: '길이에 대한 의견',
                      description: null,
                      isRequired: false,
                      controller: _lengthSuggestionController,
                      hintText: '예: 적절했습니다 / 조금 짧았습니다 / 조금 길었습니다',
                      maxLines: 3,
                    ),
                    const SizedBox(height: AppSpacing.lg),

                    // Style suggestion
                    _TextInputSection(
                      title: '스타일에 대한 의견',
                      description: null,
                      isRequired: false,
                      controller: _styleSuggestionController,
                      hintText: '예: 완벽했습니다 / 좀 더 쉬운 표현이 좋겠습니다',
                      maxLines: 3,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                ),
              ),
            ),

            // Submit button (fixed at bottom)
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Semantics(
                button: true,
                label: '제출',
                child: GestureDetector(
                  onTap: _isSubmitting ? null : _handleSubmit,
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: _isSubmitting
                          ? AppColors.textDisabled
                          : AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: _isSubmitting
                        ? const CircularProgressIndicator(
                            color: AppColors.surface,
                          )
                        : Text(
                            '제출',
                            style: AppTypography.button.copyWith(
                              color: AppColors.surface,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Rating card widget for each rating category
class _RatingCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isRequired;
  final int? value;
  final Function(int) onChanged;

  const _RatingCard({
    required this.title,
    required this.description,
    required this.isRequired,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.dividerLight,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTypography.headline2.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              if (isRequired)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.error,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '필수',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.surface,
                    ),
                  ),
                )
              else
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.textDisabled,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '선택',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.surface,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: AppTypography.body2.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Rating selector (1-5)
          Wrap(
            alignment: WrapAlignment.center,
            spacing: AppSpacing.lg,
            runSpacing: AppSpacing.lg,
            children: List.generate(5, (index) {
              final rating = index + 1;
              final isSelected = value == rating;

              return Semantics(
                button: true,
                label: '$title $rating점',
                selected: isSelected,
                child: GestureDetector(
                  onTap: () => onChanged(rating),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.background,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.dividerLight,
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$rating',
                      style: AppTypography.headline1.copyWith(
                        color: isSelected
                            ? AppColors.surface
                            : AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

/// Text input section widget
class _TextInputSection extends StatelessWidget {
  final String title;
  final String? description;
  final bool isRequired;
  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  const _TextInputSection({
    required this.title,
    required this.description,
    required this.isRequired,
    required this.controller,
    required this.hintText,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTypography.headline2.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            if (isRequired)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.error,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '필수',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.surface,
                  ),
                ),
              )
            else
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.textDisabled,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '선택',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.surface,
                  ),
                ),
              ),
          ],
        ),
        if (description != null) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(
            description!,
            style: AppTypography.body1.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.dividerLight,
              width: 2,
            ),
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            style: AppTypography.body1,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTypography.body1.copyWith(
                color: AppColors.textDisabled,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}