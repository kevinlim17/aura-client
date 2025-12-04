import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_colors.dart';

/// Large circular button for voice input
/// Size: 120x120px for easy tapping
/// Provides visual and haptic feedback during recording
class VoiceInputButton extends StatelessWidget {
  /// Whether recording is active
  final bool isRecording;

  /// Callback when button is tapped
  final VoidCallback onTap;

  /// Semantic label for TTS
  final String semanticLabel;

  /// Optional hint for TTS
  final String? semanticHint;

  const VoiceInputButton({
    super.key,
    required this.isRecording,
    required this.onTap,
    required this.semanticLabel,
    this.semanticHint,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      hint: semanticHint ?? (isRecording ? '녹음 중' : '음성 입력 시작'),
      child: GestureDetector(
        onTap: () {
          HapticFeedback.heavyImpact();
          onTap();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            color: isRecording
                ? AppColors.primary
                : AppColors.primary,
            shape: BoxShape.circle,
            boxShadow: isRecording
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.5),
                      blurRadius: 20.0,
                      spreadRadius: 5.0,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 10.0,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Pulsing animation when recording
              if (isRecording) _PulsingCircle(),

              // Microphone icon
              Icon(
                Icons.mic,
                size: 48.0,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Pulsing animation circle for recording state
class _PulsingCircle extends StatefulWidget {
  @override
  State<_PulsingCircle> createState() => _PulsingCircleState();
}

class _PulsingCircleState extends State<_PulsingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: 120.0 * _animation.value,
          height: 120.0 * _animation.value,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.3),
              width: 2.0,
            ),
          ),
        );
      },
    );
  }
}
