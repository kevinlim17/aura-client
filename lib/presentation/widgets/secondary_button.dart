import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';

/// Secondary action button with accessibility features
/// Used for less prominent actions (e.g., "Skip", "Back", "Cancel")
class SecondaryButton extends StatelessWidget {
  /// Button label text
  final String label;

  /// Semantic label for TTS
  final String semanticLabel;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Loading state
  final bool isLoading;

  /// Optional icon to display before label
  final IconData? icon;

  const SecondaryButton({
    super.key,
    required this.label,
    required this.semanticLabel,
    this.onPressed,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null && !isLoading;

    return Semantics(
      button: true,
      label: semanticLabel,
      enabled: isEnabled,
      child: GestureDetector(
        onTap: isEnabled
            ? () {
                HapticFeedback.lightImpact();
                onPressed!();
              }
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: double.infinity,
          height: AppSizes.buttonHeight,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.sm),
            border: Border.all(
              color: isEnabled ? AppColors.secondary : AppColors.textDisabled,
              width: AppBorders.medium,
            ),
          ),
          alignment: Alignment.center,
          child: isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: AppColors.secondary,
                    strokeWidth: 2.5,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        color: isEnabled
                            ? AppColors.secondary
                            : AppColors.textDisabled,
                        size: AppSizes.iconSmall,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                    ],
                    Text(
                      label,
                      style: AppTypography.button.copyWith(
                        color: isEnabled
                            ? AppColors.secondary
                            : AppColors.textDisabled,
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
