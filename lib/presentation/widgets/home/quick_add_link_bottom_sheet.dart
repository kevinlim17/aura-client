import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../domain/providers/tts_provider.dart';
import '../../../domain/providers/home_provider.dart';
import '../primary_button.dart';

/// Bottom sheet for quickly adding a link
class QuickAddLinkBottomSheet extends ConsumerStatefulWidget {
  const QuickAddLinkBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const QuickAddLinkBottomSheet(),
    );
  }

  @override
  ConsumerState<QuickAddLinkBottomSheet> createState() =>
      _QuickAddLinkBottomSheetState();
}

class _QuickAddLinkBottomSheetState
    extends ConsumerState<QuickAddLinkBottomSheet> {
  final _urlController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _announceSheet();
    });
  }

  @override
  void dispose() {
    _urlController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _announceSheet() {
    final ttsService = ref.read(ttsServiceProvider);
    ttsService.speak(
      '링크 추가 화면입니다. URL을 입력하고 저장 버튼을 탭하세요.',
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeProvider);
    final isLoading = homeState.isLoading;

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Semantics(
                    header: true,
                    child: Text(
                      '링크 추가',
                      style: AppTypography.headline2.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Semantics(
                    button: true,
                    label: '닫기',
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        HapticFeedback.mediumImpact();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),

              // URL Field (Required)
              Semantics(
                textField: true,
                label: 'URL 입력 필수',
                child: TextField(
                  controller: _urlController,
                  decoration: InputDecoration(
                    labelText: 'URL *',
                    labelStyle: AppTypography.body2,
                    hintText: 'https://example.com',
                    hintStyle: AppTypography.body2.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: AppColors.dividerLight,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 2.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  enabled: !isLoading,
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // Title Field (Optional)
              Semantics(
                textField: true,
                label: '제목 입력 선택사항',
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: '제목',
                    labelStyle: AppTypography.body2,
                    hintText: '링크 제목 (선택사항)',
                    hintStyle: AppTypography.body2.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: AppColors.dividerLight,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 2.0,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  enabled: !isLoading,
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // Description Field (Optional)
              Semantics(
                textField: true,
                label: '설명 입력 선택사항',
                child: TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: '설명',
                    labelStyle: AppTypography.body2,
                    hintText: '링크 설명 (선택사항)',
                    hintStyle: AppTypography.body2.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: AppColors.dividerLight,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 2.0,
                      ),
                    ),
                  ),
                  maxLines: 3,
                  textInputAction: TextInputAction.done,
                  enabled: !isLoading,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Save Button
              PrimaryButton(
                label: '저장',
                semanticLabel: '링크 저장',
                onPressed: isLoading ? null : _handleSave,
                isLoading: isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSave() async {
    final url = _urlController.text.trim();

    if (url.isEmpty) {
      final ttsService = ref.read(ttsServiceProvider);
      ttsService.speak('URL을 입력해주세요.');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('URL을 입력해주세요')),
      );
      return;
    }

    final notifier = ref.read(homeProvider.notifier);
    final success = await notifier.addLink(
      url: url,
      title: _titleController.text.trim().isNotEmpty
          ? _titleController.text.trim()
          : null,
      description: _descriptionController.text.trim().isNotEmpty
          ? _descriptionController.text.trim()
          : null,
    );

    if (!mounted) return;

    if (success) {
      final ttsService = ref.read(ttsServiceProvider);
      ttsService.speak('링크가 저장되었습니다.');

      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('링크가 저장되었습니다')),
      );
    } else {
      final ttsService = ref.read(ttsServiceProvider);
      final errorMessage = ref.read(homeProvider).errorMessage ??
          '링크 저장에 실패했습니다';
      ttsService.speak(errorMessage);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }
}