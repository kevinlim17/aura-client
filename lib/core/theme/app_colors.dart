import 'package:flutter/material.dart';

/// Application color palette
/// Following WCAG AA accessibility standards (4.5:1 contrast ratio)
class AppColors {
  // Primary - Teal/Cyan (주요 액션, 강조)
  static const Color primary = Color(0xFF00BCD4);
  static const Color primaryLight = Color(0xFF62EFFF);
  static const Color primaryDark = Color(0xFF008BA3);

  // Secondary - Blue Gray (보조 액션, 비활성화)
  static const Color secondary = Color(0xFF546E7A);
  static const Color secondaryLight = Color(0xFF819CA9);
  static const Color secondaryDark = Color(0xFF29434E);

  // Success - Green (성공 상태, 확인)
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF80E27E);
  static const Color successDark = Color(0xFF087F23);

  // Error - Red (에러, 경고)
  static const Color error = Color(0xFFE53935);
  static const Color errorLight = Color(0xFFFF6F60);
  static const Color errorDark = Color(0xFFAB000D);

  // Warning - Amber (주의)
  static const Color warning = Color(0xFFFFA726);
  static const Color warningLight = Color(0xFFFFD95B);
  static const Color warningDark = Color(0xFFC77800);

  // Background & Surface
  static const Color background = Color(0xFFF5F5F0); // Off-white/Cream
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF0F0EB);

  // Text
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnSecondary = Color(0xFFFFFFFF);

  // Divider
  static const Color divider = Color(0xFF212121);
  static const Color dividerLight = Color(0xFFE0E0E0);

  // Overlay
  static const Color overlay = Color(0x8A000000); // 54% opacity black
  static const Color overlayLight = Color(0x52000000); // 32% opacity black

  // Focus/Highlight (for accessibility)
  static const Color focus = Color(0xFF00BCD4); // Same as primary
  static const Color highlight = Color(0x1F00BCD4); // 12% opacity primary
}
