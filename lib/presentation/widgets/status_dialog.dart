import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';
import 'primary_button.dart';

/// Status dialog for success or error messages
/// Shows a large icon with message and confirmation button
class StatusDialog extends StatelessWidget {
  /// Success or error state
  final bool isSuccess;

  /// Main message
  final String message;

  /// Optional subtitle
  final String? subtitle;

  /// Confirm button label
  final String confirmLabel;

  /// Confirm callback
  final VoidCallback onConfirm;

  /// Optional cancel button label
  final String? cancelLabel;

  /// Optional cancel callback
  final VoidCallback? onCancel;

  const StatusDialog({
    super.key,
    required this.isSuccess,
    required this.message,
    this.subtitle,
    this.confirmLabel = '확인',
    required this.onConfirm,
    this.cancelLabel,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Status Icon
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                color: isSuccess ? AppColors.success : AppColors.error,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSuccess ? Icons.check : Icons.close,
                size: 48.0,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Message
            Text(
              message,
              style: AppTypography.headline2,
              textAlign: TextAlign.center,
            ),

            // Subtitle
            if (subtitle != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                subtitle!,
                style: AppTypography.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],

            const SizedBox(height: AppSpacing.xl),

            // Confirm Button
            PrimaryButton(
              label: confirmLabel,
              semanticLabel: confirmLabel,
              onPressed: () {
                HapticFeedback.mediumImpact();
                onConfirm();
              },
            ),

            // Cancel Button
            if (cancelLabel != null && onCancel != null) ...[
              const SizedBox(height: AppSpacing.md),
              TextButton(
                onPressed: () {
                  HapticFeedback.lightImpact();
                  onCancel!();
                },
                child: Text(
                  cancelLabel!,
                  style: AppTypography.button.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Show success dialog
  static Future<void> showSuccess({
    required BuildContext context,
    required String message,
    String? subtitle,
    String confirmLabel = '확인',
    VoidCallback? onConfirm,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatusDialog(
        isSuccess: true,
        message: message,
        subtitle: subtitle,
        confirmLabel: confirmLabel,
        onConfirm: onConfirm ?? () => Navigator.of(context).pop(),
      ),
    );
  }

  /// Show error dialog
  static Future<void> showError({
    required BuildContext context,
    required String message,
    String? subtitle,
    String confirmLabel = '확인',
    VoidCallback? onConfirm,
    String? cancelLabel,
    VoidCallback? onCancel,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatusDialog(
        isSuccess: false,
        message: message,
        subtitle: subtitle,
        confirmLabel: confirmLabel,
        onConfirm: onConfirm ?? () => Navigator.of(context).pop(),
        cancelLabel: cancelLabel,
        onCancel: onCancel,
      ),
    );
  }
}

/// Confirmation dialog for destructive actions
class ConfirmDialog extends StatelessWidget {
  /// Dialog title
  final String title;

  /// Dialog message
  final String message;

  /// Confirm button label
  final String confirmLabel;

  /// Cancel button label
  final String cancelLabel;

  /// Is destructive action (uses error color)
  final bool isDestructive;

  /// Confirm callback
  final VoidCallback onConfirm;

  /// Cancel callback
  final VoidCallback? onCancel;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmLabel = '확인',
    this.cancelLabel = '취소',
    this.isDestructive = false,
    required this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              title,
              style: AppTypography.headline2,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSpacing.md),

            // Message
            Text(
              message,
              style: AppTypography.body2,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSpacing.xl),

            // Buttons
            Row(
              children: [
                // Cancel Button
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      if (onCancel != null) {
                        onCancel!();
                      } else {
                        Navigator.of(context).pop(false);
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, AppSizes.buttonHeight),
                    ),
                    child: Text(cancelLabel),
                  ),
                ),

                const SizedBox(width: AppSpacing.md),

                // Confirm Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                      onConfirm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isDestructive ? AppColors.error : AppColors.primary,
                      minimumSize: const Size(0, AppSizes.buttonHeight),
                    ),
                    child: Text(confirmLabel),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Show confirmation dialog
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    String confirmLabel = '확인',
    String cancelLabel = '취소',
    bool isDestructive = false,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => ConfirmDialog(
        title: title,
        message: message,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        isDestructive: isDestructive,
        onConfirm: () => Navigator.of(context).pop(true),
        onCancel: () => Navigator.of(context).pop(false),
      ),
    );
  }
}
