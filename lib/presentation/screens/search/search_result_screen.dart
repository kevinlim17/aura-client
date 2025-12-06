import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../domain/entities/search_state.dart';
import '../../../domain/providers/search_provider.dart';
import '../../../domain/providers/tts_provider.dart';
import '../docent/docent_generation_screen.dart';

/// Search result screen with swipeable artwork cards
class SearchResultScreen extends ConsumerStatefulWidget {
  const SearchResultScreen({super.key});

  @override
  ConsumerState<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends ConsumerState<SearchResultScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.85,
      initialPage: 0,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _announceScreen();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _announceScreen() {
    final results = ref.read(searchResultsProvider);
    final ttsService = ref.read(ttsServiceProvider);

    if (results.isEmpty) {
      ttsService.speak('검색 결과가 없습니다. 다른 검색어를 시도해보세요.');
    } else {
      ttsService.speak(
        '검색 결과 ${results.length}건을 찾았습니다. 좌우로 스와이프하여 작품을 탐색할 수 있습니다.',
      );
      // Announce first result
      _announceCurrentArtwork(0);
    }
  }

  void _announceCurrentArtwork(int index) {
    final results = ref.read(searchResultsProvider);
    if (index >= 0 && index < results.length) {
      final artwork = results[index].artwork;
      final ttsService = ref.read(ttsServiceProvider);
      ttsService.speak(
        '${artwork.displayTitle}, ${artwork.displayArtist}${artwork.creationYear != null ? ', ${artwork.creationYear}년 작' : ''}',
        interrupt: true,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      HapticFeedback.lightImpact();
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNextPage() {
    final results = ref.read(searchResultsProvider);
    if (_currentPage < results.length - 1) {
      HapticFeedback.lightImpact();
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _selectArtwork(SearchResultEntity result) {
    HapticFeedback.mediumImpact();
    final ttsService = ref.read(ttsServiceProvider);
    ttsService.speak('${result.artwork.displayTitle} 작품을 선택했습니다. 도슨트 생성 화면으로 이동합니다.');

    // Set selected artwork
    ref.read(selectedArtworkProvider.notifier).state = result.artwork;

    // Navigate to docent generation screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DocentGenerationScreen(
          artwork: result.artwork,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final results = ref.watch(searchResultsProvider);
    final isLoading = ref.watch(isSearchLoadingProvider);
    final searchQuery = ref.watch(currentSearchQueryProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header title
              Semantics(
                header: true,
                child: Text(
                  '검색 결과',
                  style: AppTypography.headline1.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // Divider
              Container(
                height: 2,
                color: AppColors.divider,
              ),
              const SizedBox(height: AppSpacing.lg),

              // Section title with pagination info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Semantics(
                    header: true,
                    child: Text(
                      '검색된 작품',
                      style: AppTypography.headline3.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  if (results.isNotEmpty)
                    Semantics(
                      label: '${results.length}개 중 ${_currentPage + 1}번째',
                      child: Text(
                        '${_currentPage + 1} / ${results.length}',
                        style: AppTypography.body1.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),

              // Swipe hint
              if (results.isNotEmpty)
                Semantics(
                  hint: '좌우로 스와이프하여 다른 작품을 볼 수 있습니다',
                  child: Text(
                    '좌우로 넘겨보세요',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              const SizedBox(height: AppSpacing.lg),

              // Main content area
              Expanded(
                child: isLoading
                    ? _buildLoadingState()
                    : results.isEmpty
                        ? _buildEmptyState(searchQuery)
                        : _buildResultCards(results),
              ),

              // Page indicator dots
              if (results.isNotEmpty && results.length > 1)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                  child: _buildPageIndicator(results.length),
                ),

              // Bottom button
              Semantics(
                button: true,
                label: '검색 화면으로 돌아가기',
                child: GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 56.0,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '검색 화면으로 돌아가기',
                      style: AppTypography.button.copyWith(
                        color: AppColors.textOnSecondary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: AppColors.primary,
          ),
          SizedBox(height: AppSpacing.lg),
          Text(
            '검색 중입니다...',
            style: AppTypography.body1,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String query) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_off,
              size: 80,
              color: AppColors.textDisabled,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              '검색 결과 없음',
              style: AppTypography.headline2.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              '"$query"에 대한 검색 결과가 없습니다.\n다른 키워드로 검색해보세요.',
              style: AppTypography.body2.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCards(List<SearchResultEntity> results) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // PageView for swipeable cards
        PageView.builder(
          controller: _pageController,
          itemCount: results.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
            _announceCurrentArtwork(index);
          },
          itemBuilder: (context, index) {
            return _buildArtworkCard(results[index], index);
          },
        ),

        // Navigation arrows
        Positioned(
          left: 0,
          child: _buildNavigationButton(
            icon: Icons.chevron_left,
            onTap: _goToPreviousPage,
            enabled: _currentPage > 0,
            semanticLabel: '이전 작품',
          ),
        ),
        Positioned(
          right: 0,
          child: _buildNavigationButton(
            icon: Icons.chevron_right,
            onTap: _goToNextPage,
            enabled: _currentPage < results.length - 1,
            semanticLabel: '다음 작품',
          ),
        ),
      ],
    );
  }

  Widget _buildArtworkCard(SearchResultEntity result, int index) {
    final artwork = result.artwork;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: Semantics(
        label:
            '${artwork.displayTitle}, ${artwork.displayArtist}, ${index + 1}번째 검색 결과',
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: AppColors.dividerLight,
              width: 2.0,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Artwork title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                child: Text(
                  artwork.displayTitle,
                  style: AppTypography.headline2.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // Artist name
              Text(
                artwork.displayArtist,
                style: AppTypography.body1.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),

              // Creation year
              if (artwork.creationYear != null)
                Text(
                  artwork.creationYear!,
                  style: AppTypography.body2.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: AppSpacing.xl),

              // Select artwork button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                child: Semantics(
                  button: true,
                  label: '${artwork.displayTitle} 작품 선택',
                  child: GestureDetector(
                    onTap: () => _selectArtwork(result),
                    child: Container(
                      width: double.infinity,
                      height: 56.0,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '이 작품 선택',
                        style: AppTypography.button.copyWith(
                          color: AppColors.textOnPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    required VoidCallback onTap,
    required bool enabled,
    required String semanticLabel,
  }) {
    return Semantics(
      button: true,
      label: semanticLabel,
      enabled: enabled,
      child: GestureDetector(
        onTap: enabled ? onTap : null,
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: enabled ? AppColors.secondary : AppColors.dividerLight,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: enabled ? AppColors.textOnSecondary : AppColors.textDisabled,
            size: 32,
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator(int totalPages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) {
          final isActive = index == _currentPage;
          return Semantics(
            label: '${index + 1}번째 페이지${isActive ? ', 현재 페이지' : ''}',
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              width: isActive ? 24.0 : 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.dividerLight,
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
