import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../domain/providers/tts_provider.dart';
import '../../widgets/home/search_hub_section.dart';
import '../../widgets/home/quick_add_section.dart';
import '../../widgets/home/quick_add_link_bottom_sheet.dart';
import '../../widgets/home/quick_add_memo_bottom_sheet.dart';

/// Home screen after onboarding/login
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _announceScreen();
    });
  }

  void _announceScreen() {
    final ttsService = ref.read(ttsServiceProvider);
    ttsService.speak(
      '홈 화면입니다. 작품을 검색하려면 화면 상단의 검색 버튼을 탭하세요. '
      '링크나 메모를 추가하려면 화면 하단의 버튼을 탭하세요.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: Semantics(
          button: true,
          label: '프로필 화면으로 이동',
          child: IconButton(
            icon: const Icon(
              Icons.person_outline,
              color: AppColors.textPrimary,
            ),
            onPressed: () {
              HapticFeedback.mediumImpact();
              // TODO: Navigate to profile screen
            },
          ),
        ),
        title: Text(
          'Aura',
          style: AppTypography.headline2.copyWith(
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
        actions: [
          Semantics(
            button: true,
            label: '설정 화면으로 이동',
            child: IconButton(
              icon: const Icon(
                Icons.settings_outlined,
                color: AppColors.textPrimary,
              ),
              onPressed: () {
                HapticFeedback.mediumImpact();
                // TODO: Navigate to settings screen
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              // 검색 허브 섹션
              const Expanded(
                flex: 3,
                child: SearchHubSection(),
              ),

              const SizedBox(height: AppSpacing.xl),

              // 빠른 추가 섹션
              Expanded(
                flex: 2,
                child: QuickAddSection(
                  onAddLink: () => _showAddLinkSheet(context),
                  onAddMemo: () => _showAddMemoSheet(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddLinkSheet(BuildContext context) {
    HapticFeedback.mediumImpact();
    QuickAddLinkBottomSheet.show(context);
  }

  void _showAddMemoSheet(BuildContext context) {
    HapticFeedback.mediumImpact();
    QuickAddMemoBottomSheet.show(context);
  }
}