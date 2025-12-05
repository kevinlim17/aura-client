import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';

/// Search hub section with text, voice, and camera search options
class SearchHubSection extends StatelessWidget {
  const SearchHubSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.textSecondary.withValues(alpha: 0.1),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Semantics(
            header: true,
            child: Text(
              '어떤 작품을 찾으시나요?',
              style: AppTypography.headline2.copyWith(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _SearchButton(
                icon: Icons.text_fields,
                label: '텍스트',
                semanticLabel: '텍스트로 작품 검색',
                onPressed: () => _handleTextSearch(context),
              ),
              _SearchButton(
                icon: Icons.mic_outlined,
                label: '음성',
                semanticLabel: '음성으로 작품 검색',
                onPressed: () => _handleVoiceSearch(context),
              ),
              _SearchButton(
                icon: Icons.camera_alt_outlined,
                label: '카메라',
                semanticLabel: '카메라로 작품 검색',
                onPressed: () => _handleCameraSearch(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleTextSearch(BuildContext context) {
    HapticFeedback.mediumImpact();
    // TODO: Navigate to text search screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('텍스트 검색 화면으로 이동')),
    );
  }

  void _handleVoiceSearch(BuildContext context) {
    HapticFeedback.mediumImpact();
    // TODO: Navigate to voice search screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('음성 검색 화면으로 이동')),
    );
  }

  void _handleCameraSearch(BuildContext context) {
    HapticFeedback.mediumImpact();
    // TODO: Navigate to camera search screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('카메라 검색 화면으로 이동')),
    );
  }
}

/// Search button widget
class _SearchButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String semanticLabel;
  final VoidCallback onPressed;

  const _SearchButton({
    required this.icon,
    required this.label,
    required this.semanticLabel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 250.0,
          height: 60.0,
          margin: EdgeInsets.symmetric(vertical: AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: AppColors.primary,
              width: 2.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                icon,
                size: 36.0,
                color: AppColors.primary,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                label,
                style: AppTypography.button.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
