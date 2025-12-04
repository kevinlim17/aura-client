import 'package:flutter/animation.dart';

/// Application animation constants
/// Consistent animation durations and curves
class AppAnimations {
  /// Fast animation (150ms)
  /// For quick interactions like button taps
  static const Duration fast = Duration(milliseconds: 150);

  /// Normal animation (300ms)
  /// Default animation duration
  static const Duration normal = Duration(milliseconds: 300);

  /// Slow animation (500ms)
  /// For complex transitions
  static const Duration slow = Duration(milliseconds: 500);

  /// Very slow animation (800ms)
  /// For loading states or complex sequences
  static const Duration verySlow = Duration(milliseconds: 800);
}

/// Animation curves
class AppCurves {
  /// Standard easing curve
  /// For most animations
  static const Curve standard = Curves.easeInOut;

  /// Deceleration curve
  /// For entering elements
  static const Curve decelerate = Curves.easeOut;

  /// Acceleration curve
  /// For exiting elements
  static const Curve accelerate = Curves.easeIn;

  /// Bounce curve
  /// For playful interactions (use sparingly)
  static const Curve bounce = Curves.elasticOut;

  /// Sharp curve
  /// For instant feel
  static const Curve sharp = Curves.easeInOutCubic;
}

/// Page transition types
enum PageTransitionType {
  /// Fade transition
  fade,

  /// Slide from right (default)
  slideRight,

  /// Slide from bottom
  slideBottom,

  /// Scale transition
  scale,

  /// Fade with scale
  fadeScale,
}
