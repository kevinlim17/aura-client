import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';

/// Quick add section for links and memos
class QuickAddSection extends StatelessWidget {
  final VoidCallback onAddLink;
  final VoidCallback onAddMemo;

  const QuickAddSection({
    super.key,
    required this.onAddLink,
    required this.onAddMemo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Semantics(
            header: true,
            child: Text(
              '빠른 추가',
              style: AppTypography.headline2.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _QuickAddButton(
                    icon: Icons.link,
                    label: '링크 추가',
                    semanticLabel: '링크 추가 화면 열기',
                    onPressed: onAddLink,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: _QuickAddButton(
                    icon: Icons.edit_note,
                    label: '메모 추가',
                    semanticLabel: '메모 추가 화면 열기',
                    onPressed: onAddMemo,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Quick add button widget
class _QuickAddButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String semanticLabel;
  final VoidCallback onPressed;

  const _QuickAddButton({
    required this.icon,
    required this.label,
    required this.semanticLabel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      child: GestureDetector(
        onTap: () {
          HapticFeedback.mediumImpact();
          onPressed();
        },
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: AppColors.primary,
              width: 2.0,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48.0,
                color: AppColors.primary,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                label,
                style: AppTypography.body1.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}