import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';

/// Custom text input field with accessibility features
/// Minimum height: 56px for easy tapping
class AppTextField extends StatelessWidget {
  /// Field label (displayed above the input)
  final String label;

  /// Placeholder text
  final String? hint;

  /// Semantic label for TTS
  final String? semanticLabel;

  /// Text editing controller
  final TextEditingController? controller;

  /// Obscure text (for passwords)
  final bool obscureText;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Text input action
  final TextInputAction? textInputAction;

  /// Max lines
  final int maxLines;

  /// Enabled state
  final bool enabled;

  /// Error text
  final String? errorText;

  /// Prefix icon
  final IconData? prefixIcon;

  /// Suffix icon
  final IconData? suffixIcon;

  /// Suffix icon tap callback
  final VoidCallback? onSuffixIconTap;

  /// On changed callback
  final ValueChanged<String>? onChanged;

  /// On submitted callback
  final ValueChanged<String>? onSubmitted;

  /// Autofocus
  final bool autofocus;

  const AppTextField({
    super.key,
    required this.label,
    this.hint,
    this.semanticLabel,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.enabled = true,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel ?? label,
      textField: true,
      enabled: enabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            label,
            style: AppTypography.body1.copyWith(
              color: enabled ? AppColors.textPrimary : AppColors.textDisabled,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),

          // Input Field
          Container(
            decoration: BoxDecoration(
              color: enabled ? AppColors.surface : AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(AppRadius.sm),
              border: Border.all(
                color: errorText != null
                    ? AppColors.error
                    : AppColors.dividerLight,
                width: AppBorders.medium,
              ),
            ),
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              maxLines: maxLines,
              enabled: enabled,
              autofocus: autofocus,
              style: AppTypography.body2,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: AppTypography.body2.copyWith(
                  color: AppColors.textDisabled,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(AppSpacing.md),
                prefixIcon: prefixIcon != null
                    ? Icon(
                        prefixIcon,
                        color: enabled
                            ? AppColors.textSecondary
                            : AppColors.textDisabled,
                      )
                    : null,
                suffixIcon: suffixIcon != null
                    ? IconButton(
                        icon: Icon(
                          suffixIcon,
                          color: enabled
                              ? AppColors.textSecondary
                              : AppColors.textDisabled,
                        ),
                        onPressed: enabled ? onSuffixIconTap : null,
                      )
                    : null,
              ),
            ),
          ),

          // Error Text
          if (errorText != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              errorText!,
              style: AppTypography.caption.copyWith(
                color: AppColors.error,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
