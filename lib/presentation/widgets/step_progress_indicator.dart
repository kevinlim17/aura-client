import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// Step progress indicator for multi-step flows
/// Shows horizontal bars indicating current step
class StepProgressIndicator extends StatelessWidget {
  /// Current step (1-indexed)
  final int currentStep;

  /// Total number of steps
  final int totalSteps;

  /// Height of the indicator bars
  final double height;

  /// Spacing between bars
  final double spacing;

  const StepProgressIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.height = 4.0,
    this.spacing = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$totalSteps단계 중 $currentStep단계',
      readOnly: true,
      child: Row(
        children: List.generate(totalSteps, (index) {
          final isActive = index < currentStep;

          return Expanded(
            child: Container(
              height: height,
              margin: EdgeInsets.symmetric(horizontal: spacing / 2),
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.dividerLight,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),
          );
        }),
      ),
    );
  }
}

/// Circular progress indicator with percentage
class PercentageProgressIndicator extends StatelessWidget {
  /// Progress value (0.0 to 1.0)
  final double progress;

  /// Size of the indicator
  final double size;

  /// Stroke width
  final double strokeWidth;

  /// Show percentage text
  final bool showPercentage;

  const PercentageProgressIndicator({
    super.key,
    required this.progress,
    this.size = 80.0,
    this.strokeWidth = 8.0,
    this.showPercentage = true,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (progress * 100).toInt();

    return Semantics(
      label: '$percentage 퍼센트 진행',
      readOnly: true,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background circle
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: 1.0,
                strokeWidth: strokeWidth,
                color: AppColors.dividerLight,
              ),
            ),

            // Progress circle
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: strokeWidth,
                color: AppColors.primary,
              ),
            ),

            // Percentage text
            if (showPercentage)
              Text(
                '$percentage%',
                style: TextStyle(
                  fontSize: size * 0.25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Linear progress bar with label
class LabeledProgressBar extends StatelessWidget {
  /// Progress value (0.0 to 1.0)
  final double progress;

  /// Label text
  final String label;

  /// Height of the progress bar
  final double height;

  const LabeledProgressBar({
    super.key,
    required this.progress,
    required this.label,
    this.height = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (progress * 100).toInt();

    return Semantics(
      label: '$label $percentage 퍼센트',
      readOnly: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label and percentage
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '$percentage%',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8.0),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(height / 2),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: height,
              backgroundColor: AppColors.dividerLight,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
