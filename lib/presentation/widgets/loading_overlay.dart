import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';

/// Loading overlay with optional progress indicator
/// Displays over content with semi-transparent background
class LoadingOverlay extends StatelessWidget {
  /// Loading message
  final String message;

  /// Progress value (0.0 to 1.0)
  /// If null, shows indeterminate progress
  final double? progress;

  /// Show cancel button
  final bool showCancelButton;

  /// Cancel callback
  final VoidCallback? onCancel;

  const LoadingOverlay({
    super.key,
    required this.message,
    this.progress,
    this.showCancelButton = false,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: message,
      liveRegion: true,
      child: Container(
        color: AppColors.overlay,
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(AppSpacing.xl),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Progress Indicator
                  if (progress == null)
                    const SizedBox(
                      width: 48,
                      height: 48,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                      ),
                    )
                  else
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 4,
                      ),
                    ),

                  const SizedBox(height: AppSpacing.lg),

                  // Message
                  Text(
                    message,
                    style: AppTypography.body1,
                    textAlign: TextAlign.center,
                  ),

                  // Progress percentage
                  if (progress != null) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      '${(progress! * 100).toInt()}%',
                      style: AppTypography.caption,
                    ),
                  ],

                  // Cancel button
                  if (showCancelButton && onCancel != null) ...[
                    const SizedBox(height: AppSpacing.lg),
                    TextButton(
                      onPressed: onCancel,
                      child: Text(
                        '취소',
                        style: AppTypography.button.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Simple loading indicator without overlay
class LoadingIndicator extends StatelessWidget {
  /// Loading message
  final String? message;

  /// Size of the indicator
  final double size;

  const LoadingIndicator({
    super.key,
    this.message,
    this.size = 48.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: const CircularProgressIndicator(
              strokeWidth: 4,
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              message!,
              style: AppTypography.body2,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
