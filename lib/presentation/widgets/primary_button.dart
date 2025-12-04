import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';

/// Primary action button with accessibility features
/// Follows Material Design guidelines with 56px height for easy tapping
class PrimaryButton extends StatelessWidget {
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

  const PrimaryButton({
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
                HapticFeedback.mediumImpact();
                onPressed!();
              }
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: double.infinity,
          height: AppSizes.buttonHeight,
          decoration: BoxDecoration(
            color: isEnabled ? AppColors.primary : AppColors.textDisabled,
            borderRadius: BorderRadius.circular(AppRadius.sm),
            boxShadow: isEnabled
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        color: AppColors.textOnPrimary,
                        size: AppSizes.iconSmall,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                    ],
                    Text(
                      label,
                      style: AppTypography.button,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}