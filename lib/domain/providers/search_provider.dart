import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/search_state.dart';
import '../entities/artwork_entity.dart';
import '../../data/services/search_service.dart';
import 'search_notifier.dart';
import 'auth_provider.dart';
import 'tts_provider.dart';

// ============================================================
// Service Providers
// ============================================================

/// Search service provider
final searchServiceProvider = Provider<SearchService>((ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  final httpClient = ref.watch(httpClientProvider);
  return SearchService(baseUrl: baseUrl, client: httpClient);
});

// ============================================================
// Main Search Provider
// ============================================================

/// Search state notifier provider
final searchProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  final searchService = ref.watch(searchServiceProvider);
  final ttsService = ref.watch(ttsServiceProvider);
  final token = ref.watch(currentTokenProvider);

  if (token == null) {
    throw StateError(
      'SearchProvider accessed without authentication.',
    );
  }

  return SearchNotifier(
    searchService: searchService,
    ttsService: ttsService,
    token: token,
  );
});

// ============================================================
// Convenience Providers
// ============================================================

/// Current search mode provider
final currentSearchModeProvider = Provider<SearchMode>((ref) {
  return ref.watch(searchProvider.select((state) => state.searchMode));
});

/// Search results provider
final searchResultsProvider = Provider<List<SearchResultEntity>>((ref) {
  return ref.watch(searchProvider.select((state) => state.results));
});

/// Search loading state provider
final isSearchLoadingProvider = Provider<bool>((ref) {
  return ref.watch(searchProvider.select((state) => state.isLoading));
});

/// Search has results provider
final hasSearchResultsProvider = Provider<bool>((ref) {
  return ref.watch(searchProvider.select((state) => state.hasResults));
});

/// Search has more pages provider
final hasMoreSearchResultsProvider = Provider<bool>((ref) {
  return ref.watch(searchProvider.select((state) => state.hasMorePages));
});

/// Search error message provider
final searchErrorProvider = Provider<String?>((ref) {
  return ref.watch(searchProvider.select((state) => state.errorMessage));
});

/// Current search query provider
final currentSearchQueryProvider = Provider<String>((ref) {
  return ref.watch(searchProvider.select((state) => state.currentQuery));
});

/// OCR status provider
final ocrStatusProvider = Provider<OcrStatus>((ref) {
  return ref.watch(searchProvider.select((state) => state.ocrStatus));
});

/// Is recording voice provider
final isRecordingVoiceProvider = Provider<bool>((ref) {
  return ref.watch(searchProvider.select((state) => state.isRecording));
});

/// Search pagination provider
final searchPaginationProvider = Provider<SearchPagination?>((ref) {
  return ref.watch(searchProvider.select((state) => state.pagination));
});

/// Total search results count provider
final totalSearchResultsCountProvider = Provider<int>((ref) {
  final pagination = ref.watch(searchPaginationProvider);
  return pagination?.totalCount ?? 0;
});

// ============================================================
// Artwork Selection Provider (for navigation to detail)
// ============================================================

/// Selected artwork provider for viewing details
final selectedArtworkProvider = StateProvider<ArtworkEntity?>((ref) => null);

/// Set selected artwork
void selectArtwork(WidgetRef ref, ArtworkEntity artwork) {
  ref.read(selectedArtworkProvider.notifier).state = artwork;
}

/// Clear selected artwork
void clearSelectedArtwork(WidgetRef ref) {
  ref.read(selectedArtworkProvider.notifier).state = null;
}