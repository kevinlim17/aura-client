import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../domain/entities/docent_entity.dart';
import '../../../domain/entities/artwork_entity.dart';
import '../../../domain/providers/docent_provider.dart';
import '../../../domain/providers/auth_provider.dart';
import '../../../domain/providers/tts_provider.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';
import '../../widgets/app_text_field.dart';
import '../../navigation/app_routes.dart';

/// Docent generation screen with options
class DocentGenerationScreen extends ConsumerStatefulWidget {
  final ArtworkEntity artwork;

  const DocentGenerationScreen({
    super.key,
    required this.artwork,
  });

  @override
  ConsumerState<DocentGenerationScreen> createState() =>
      _DocentGenerationScreenState();
}

class _DocentGenerationScreenState
    extends ConsumerState<DocentGenerationScreen> {
  // Form controllers
  final _companionInputController = TextEditingController();
  final _customPromptController = TextEditingController();

  // Option states
  bool _includeCompanionContext = false;
  NarrativeStyle? _selectedNarrativeStyle;

  @override
  void initState() {
    super.initState();

    // TTS announcement
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ttsService = ref.read(ttsServiceProvider);
      ttsService.speak(
        '도슨트 생성 화면입니다. 옵션을 선택하고 생성 버튼을 눌러주세요.',
      );
    });
  }

  @override
  void dispose() {
    _companionInputController.dispose();
    _customPromptController.dispose();
    super.dispose();
  }

  /// Handle generate docent button
  Future<void> _handleGenerateDocent() async {
    HapticFeedback.mediumImpact();

    final currentUser = ref.read(currentUserProvider);
    if (currentUser == null) return;

    final ttsService = ref.read(ttsServiceProvider);

    // Build custom prompt from companion input if provided
    String? customPrompt = _customPromptController.text.trim();
    if (_includeCompanionContext &&
        _companionInputController.text.trim().isNotEmpty) {
      final companionInput = _companionInputController.text.trim();
      if (customPrompt.isEmpty) {
        customPrompt = '동행자의 관찰: $companionInput';
      } else {
        customPrompt = '$customPrompt\n\n동행자의 관찰: $companionInput';
      }
    }

    // Announce generation start
    final estimatedTime = _selectedNarrativeStyle == null ? 120 : 120;
    await ttsService.speak(
      '도슨트를 준비하고 있습니다. 약 ${_formatSeconds(estimatedTime)} 소요됩니다.',
    );

    // Generate docent
    await generateDocent(
      ref,
      userId: int.parse(currentUser.id),
      artworkId: widget.artwork.id,
      narrativeStyle: _selectedNarrativeStyle,
      includeCompanionContext: _includeCompanionContext,
      customPrompt: customPrompt.isEmpty ? null : customPrompt,
    );
  }

  /// Format seconds to readable string
  String _formatSeconds(int seconds) {
    if (seconds < 60) {
      return '$seconds초';
    }
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    if (remainingSeconds == 0) {
      return '$minutes분';
    }
    return '$minutes분 $remainingSeconds초';
  }

  /// Handle back button
  void _handleBack() {
    HapticFeedback.lightImpact();

    // Cancel generation if in progress
    final isGenerating = ref.read(isDocentGeneratingProvider);
    if (isGenerating) {
      cancelDocentGeneration(ref);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final docentState = ref.watch(docentProvider);

    // Auto-navigate to player screen when generation completes
    ref.listen<bool>(isDocentCompletedProvider, (previous, next) {
      if (next && mounted) {
        final session = ref.read(currentDocentSessionProvider);
        if (session != null) {
          AppNavigation.replaceWithDocentPlayer(
            context,
            session: session,
          );
        }
      }
    });

    final isGenerating = docentState.isGenerating;
    final isFailed = docentState.isFailed;

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
              // Header
              Semantics(
                header: true,
                child: Text(
                  '도슨트 생성',
                  style: AppTypography.headline1.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // Divider
              Container(
                height: 2,
                color: AppColors.divider,
              ),
              const SizedBox(height: AppSpacing.xl),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: isGenerating
                      ? _buildGeneratingState(docentState)
                      : isFailed
                          ? _buildErrorState(docentState)
                          : _buildOptionsForm(),
                ),
              ),

              // Bottom buttons
              const SizedBox(height: AppSpacing.lg),
              if (!isGenerating && !isFailed)
                Column(
                  children: [
                    PrimaryButton(
                      label: '도슨트 생성',
                      semanticLabel: '도슨트 생성 시작',
                      onPressed: _handleGenerateDocent,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    SecondaryButton(
                      label: '취소',
                      semanticLabel: '이전 화면으로 돌아가기',
                      onPressed: _handleBack,
                    ),
                  ],
                )
              else if (isGenerating)
                SecondaryButton(
                  label: '생성 취소',
                  semanticLabel: '도슨트 생성 취소',
                  onPressed: _handleBack,
                )
              else if (isFailed)
                Column(
                  children: [
                    PrimaryButton(
                      label: '다시 시도',
                      semanticLabel: '도슨트 생성 다시 시도',
                      onPressed: _handleGenerateDocent,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    SecondaryButton(
                      label: '취소',
                      semanticLabel: '이전 화면으로 돌아가기',
                      onPressed: _handleBack,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build options form
  Widget _buildOptionsForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Artwork info
        _buildArtworkInfo(),
        const SizedBox(height: AppSpacing.xxl),

        // Companion context option
        _buildCompanionContextOption(),
        const SizedBox(height: AppSpacing.xl),

        // Narrative style option
        _buildNarrativeStyleOption(),
        const SizedBox(height: AppSpacing.xl),

        // Custom prompt
        _buildCustomPromptOption(),
      ],
    );
  }

  /// Build artwork info section
  Widget _buildArtworkInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: AppColors.dividerLight,
          width: 2.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '선택한 작품',
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            widget.artwork.displayTitle,
            style: AppTypography.headline2.copyWith(
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            widget.artwork.displayArtist,
            style: AppTypography.body1.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          if (widget.artwork.creationYear != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              widget.artwork.creationYear!,
              style: AppTypography.body2.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Build companion context option
  Widget _buildCompanionContextOption() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Toggle
        Semantics(
          label: '동행자 관찰 포함 ${_includeCompanionContext ? "활성화됨" : "비활성화됨"}',
          toggled: _includeCompanionContext,
          child: InkWell(
            onTap: () {
              HapticFeedback.selectionClick();
              setState(() {
                _includeCompanionContext = !_includeCompanionContext;
              });

              final ttsService = ref.read(ttsServiceProvider);
              ttsService.speak(
                _includeCompanionContext
                    ? '동행자 관찰을 포함합니다'
                    : '동행자 관찰을 포함하지 않습니다',
              );
            },
            child: Row(
              children: [
                Icon(
                  _includeCompanionContext
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: _includeCompanionContext
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  size: 32,
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '동행자 관찰 포함',
                        style: AppTypography.body1.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        '동행자가 있다면 그들의 관찰 내용을 포함시킬 수 있습니다',
                        style: AppTypography.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Companion input field (shown when enabled)
        if (_includeCompanionContext) ...[
          const SizedBox(height: AppSpacing.md),
          AppTextField(
            label: '동행자 관찰 내용',
            hint: '예: 동행자가 작품의 색감에 매료되었다고 합니다',
            semanticLabel: '동행자 관찰 내용 입력 필드',
            controller: _companionInputController,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            maxLines: 3,
          ),
        ],
      ],
    );
  }

  /// Build narrative style option
  Widget _buildNarrativeStyleOption() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '서사 스타일 (선택)',
          style: AppTypography.body1.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          '기본 설정을 사용하거나 다른 스타일을 선택할 수 있습니다',
          style: AppTypography.caption,
        ),
        const SizedBox(height: AppSpacing.md),

        // Style options
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            _buildStyleChip('기본', null),
            _buildStyleChip('문학적', NarrativeStyle.literary),
            _buildStyleChip('단순', NarrativeStyle.simple),
            _buildStyleChip('전문적', NarrativeStyle.professional),
          ],
        ),
      ],
    );
  }

  /// Build style chip
  Widget _buildStyleChip(String label, NarrativeStyle? style) {
    final isSelected = _selectedNarrativeStyle == style;

    return Semantics(
      label: '$label 스타일, ${isSelected ? "선택됨" : "선택 안됨"}',
      button: true,
      selected: isSelected,
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          HapticFeedback.selectionClick();
          setState(() {
            _selectedNarrativeStyle = selected ? style : null;
          });

          final ttsService = ref.read(ttsServiceProvider);
          ttsService.speak(
            selected ? '$label 스타일 선택됨' : '$label 스타일 선택 해제됨',
          );
        },
        selectedColor: AppColors.primary,
        checkmarkColor: AppColors.textOnPrimary,
        backgroundColor: AppColors.surface,
        labelStyle: AppTypography.body2.copyWith(
          color: isSelected ? AppColors.textOnPrimary : AppColors.textPrimary,
        ),
        side: BorderSide(
          color: isSelected ? AppColors.primary : AppColors.dividerLight,
          width: 1.5,
        ),
      ),
    );
  }

  /// Build custom prompt option
  Widget _buildCustomPromptOption() {
    return AppTextField(
      label: '추가 요청사항 (선택)',
      hint: '예: 작품의 역사적 맥락을 강조해주세요',
      semanticLabel: '추가 요청사항 입력 필드',
      controller: _customPromptController,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      maxLines: 3,
    );
  }

  /// Build generating state
  Widget _buildGeneratingState(dynamic docentState) {
    final progress = docentState.maybeWhen(
      generating: (_, __, progress, ___) => progress,
      orElse: () => 0,
    );

    final estimatedTime = docentState.maybeWhen(
      generating: (_, estimatedTime, __, ___) => estimatedTime,
      orElse: () => 120,
    );

    final elapsedTime = docentState.maybeWhen(
      generating: (_, __, ___, startTime) {
        if (startTime == null) return null;
        return DateTime.now().difference(startTime);
      },
      orElse: () => null,
    );

    final remainingSeconds = estimatedTime -
        (elapsedTime?.inSeconds ?? 0).clamp(0, estimatedTime);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Artwork info
          Text(
            widget.artwork.displayTitle,
            style: AppTypography.headline2.copyWith(
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            widget.artwork.displayArtist,
            style: AppTypography.body1.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xxl),

          // Progress indicator
          SizedBox(
            width: 200,
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Circular progress
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: progress / 100,
                    strokeWidth: 12,
                    backgroundColor: AppColors.dividerLight,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
                // Progress text
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$progress%',
                      style: AppTypography.display.copyWith(
                        color: AppColors.primary,
                        fontSize: 48,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      '생성 중...',
                      style: AppTypography.body2.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),

          // Time remaining
          if (remainingSeconds > 0)
            Text(
              '예상 남은 시간: ${_formatSeconds(remainingSeconds)}',
              style: AppTypography.body2.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          const SizedBox(height: AppSpacing.md),

          // Generating message
          Text(
            'AI가 작품에 대한 도슨트를 생성하고 있습니다.\n잠시만 기다려주세요.',
            style: AppTypography.body2.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Build error state
  Widget _buildErrorState(dynamic docentState) {
    final errorMessage = docentState.maybeWhen(
      failed: (message, _) => message,
      orElse: () => '알 수 없는 오류가 발생했습니다',
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 80,
              color: AppColors.error,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              '도슨트 생성 실패',
              style: AppTypography.headline2.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              errorMessage,
              style: AppTypography.body2.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}