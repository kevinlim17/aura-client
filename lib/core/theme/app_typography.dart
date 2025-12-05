import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Application typography settings
/// Minimum font size: 16px for accessibility
class AppTypography {
  static const String fontFamilyPrimary = 'MaruBuri';

  // Display - 브랜딩, 온보딩 타이틀
  static const TextStyle display = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 48.0,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: -0.5,
    color: AppColors.textPrimary,
  );

  // Headline 1 - 화면 제목
  static const TextStyle headline1 = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  // Headline 2 - 섹션 제목
  static const TextStyle headline2 = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  // Headline 3 - 서브 섹션 제목
  static const TextStyle headline3 = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  // Body 1 - 본문 텍스트 (강조)
  static const TextStyle body1 = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    height: 1.6,
    color: AppColors.textPrimary,
  );

  // Body 2 - 본문 텍스트 (일반)
  static const TextStyle body2 = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.textPrimary,
  );

  // Caption - 부가 정보, 레이블
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textSecondary,
  );

  // Button - 버튼 텍스트
  static const TextStyle button = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: 0.5,
    color: AppColors.textOnPrimary,
  );

  // Overline - 작은 레이블, 오버라인
  static const TextStyle overline = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 1.0,
    color: AppColors.textSecondary,
  );
}

/// Text style extensions for convenience
extension TextStyleExtensions on TextStyle {
  /// Copy with primary color
  TextStyle get primary => copyWith(color: AppColors.primary);

  /// Copy with secondary color
  TextStyle get secondary => copyWith(color: AppColors.secondary);

  /// Copy with success color
  TextStyle get success => copyWith(color: AppColors.success);

  /// Copy with error color
  TextStyle get error => copyWith(color: AppColors.error);

  /// Copy with white color
  TextStyle get white => copyWith(color: AppColors.textOnPrimary);

  /// Copy with disabled color
  TextStyle get disabled => copyWith(color: AppColors.textDisabled);

  /// Copy with bold weight
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// Copy with semibold weight
  TextStyle get semibold => copyWith(fontWeight: FontWeight.w600);

  /// Copy with medium weight
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Copy with regular weight
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
}
