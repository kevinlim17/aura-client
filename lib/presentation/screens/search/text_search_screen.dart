import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../domain/providers/search_provider.dart';
import '../../../domain/providers/tts_provider.dart';
import 'search_result_screen.dart';

/// Text search screen for artwork search
class TextSearchScreen extends ConsumerStatefulWidget {
  const TextSearchScreen({super.key});

  @override
  ConsumerState<TextSearchScreen> createState() => _TextSearchScreenState();
}

class _TextSearchScreenState extends ConsumerState<TextSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _announceScreen();
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _announceScreen() {
    final ttsService = ref.read(ttsServiceProvider);
    ttsService.speak(
      '작품 검색 화면입니다. 검색어를 입력하고 검색 버튼을 눌러주세요.',
    );
  }

  Future<void> _performSearch() async {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      final ttsService = ref.read(ttsServiceProvider);
      await ttsService.speak('검색어를 입력해주세요.');
      return;
    }

    HapticFeedback.mediumImpact();

    // Update search query and execute search
    ref.read(searchProvider.notifier).updateTextQuery(query);
    await ref.read(searchProvider.notifier).searchByText();

    if (!mounted) return;

    // Navigate to result screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SearchResultScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(isSearchLoadingProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: Semantics(
          button: true,
          label: '뒤로 가기',
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.textPrimary,
            ),
            onPressed: () {
              HapticFeedback.lightImpact();
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          '작품 검색',
          style: AppTypography.headline2.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Divider
              Container(
                height: 2,
                color: AppColors.divider,
              ),
              const SizedBox(height: AppSpacing.xl),

              // Section title
              Semantics(
                header: true,
                child: Text(
                  '검색어 입력',
                  style: AppTypography.headline3.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),

              // Description
              Text(
                '작품명, 작가명 또는 키워드를 입력하세요',
                style: AppTypography.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Search input field
              Semantics(
                textField: true,
                label: '검색어 입력 필드',
                hint: '작품명이나 작가명을 입력하세요',
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: AppColors.dividerLight,
                      width: 2.0,
                    ),
                  ),
                  child: TextField(
                    controller: _searchController,
                    focusNode: _focusNode,
                    style: AppTypography.body1,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (_) => _performSearch(),
                    decoration: InputDecoration(
                      hintText: '예: 별이 빛나는 밤, 고흐',
                      hintStyle: AppTypography.body2.copyWith(
                        color: AppColors.textDisabled,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.textSecondary,
                        size: 24,
                      ),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(
                                Icons.clear,
                                color: AppColors.textSecondary,
                              ),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {});
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(AppSpacing.md),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Search button
              Semantics(
                button: true,
                label: '검색 버튼',
                enabled: !isLoading,
                child: GestureDetector(
                  onTap: isLoading ? null : _performSearch,
                  child: Container(
                    width: double.infinity,
                    height: 56.0,
                    decoration: BoxDecoration(
                      color: isLoading
                          ? AppColors.textDisabled
                          : AppColors.primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: Alignment.center,
                    child: isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: AppColors.textOnPrimary,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            '검색',
                            style: AppTypography.button.copyWith(
                              color: AppColors.textOnPrimary,
                            ),
                          ),
                  ),
                ),
              ),

              const Spacer(),

              // Tip section
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.lightbulb_outline,
                      color: AppColors.primary,
                      size: 24,
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Text(
                        '음성 검색이나 카메라 촬영으로도 검색할 수 있습니다.',
                        style: AppTypography.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
