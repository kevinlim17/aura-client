import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../domain/providers/tts_provider.dart';
import '../../../domain/providers/home_provider.dart';
import '../primary_button.dart';

/// Bottom sheet for quickly adding a memo
class QuickAddMemoBottomSheet extends ConsumerStatefulWidget {
  const QuickAddMemoBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const QuickAddMemoBottomSheet(),
    );
  }

  @override
  ConsumerState<QuickAddMemoBottomSheet> createState() =>
      _QuickAddMemoBottomSheetState();
}

class _QuickAddMemoBottomSheetState
    extends ConsumerState<QuickAddMemoBottomSheet> {
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _announceSheet();
    });
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  void _announceSheet() {
    final ttsService = ref.read(ttsServiceProvider);
    ttsService.speak(
      '메모 추가 화면입니다. 메모 내용을 입력하고 저장 버튼을 탭하세요.',
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
                      '메모 추가',
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

              // Content Field (Required)
              Semantics(
                textField: true,
                label: '메모 내용 입력 필수',
                child: TextField(
                  controller: _contentController,
                  decoration: InputDecoration(
                    labelText: '메모 내용 *',
                    labelStyle: AppTypography.body2,
                    hintText: '메모를 입력하세요',
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
                  maxLines: 5,
                  textInputAction: TextInputAction.done,
                  enabled: !isLoading,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Save Button
              PrimaryButton(
                label: '저장',
                semanticLabel: '메모 저장',
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
    final content = _contentController.text.trim();

    if (content.isEmpty) {
      final ttsService = ref.read(ttsServiceProvider);
      ttsService.speak('메모 내용을 입력해주세요.');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('메모 내용을 입력해주세요')),
      );
      return;
    }

    final notifier = ref.read(homeProvider.notifier);
    final success = await notifier.addMemo(
      content: content,
      inputMethod: 'TEXT',
    );

    if (!mounted) return;

    if (success) {
      final ttsService = ref.read(ttsServiceProvider);
      ttsService.speak('메모가 저장되었습니다.');

      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('메모가 저장되었습니다')),
      );
    } else {
      final ttsService = ref.read(ttsServiceProvider);
      final errorMessage = ref.read(homeProvider).errorMessage ??
          '메모 저장에 실패했습니다';
      ttsService.speak(errorMessage);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }
}