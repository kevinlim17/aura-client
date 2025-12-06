import 'package:freezed_annotation/freezed_annotation.dart';
import 'artwork_entity.dart';

part 'search_state.freezed.dart';

/// Search mode types
enum SearchMode {
  /// Text-based search
  text,

  /// Voice-based search (using STT)
  voice,

  /// Camera-based search (using OCR)
  camera,
}

/// OCR processing state for camera search
enum OcrStatus {
  /// Initial state - no image captured
  idle,

  /// Camera is capturing image
  capturing,

  /// Processing OCR on captured image
  processing,

  /// OCR completed successfully
  completed,

  /// OCR failed
  failed,
}

/// Exception for search-related errors
class SearchException implements Exception {
  final String message;
  final String? code;

  SearchException(this.message, {this.code});

  @override
  String toString() =>
      'SearchException: $message${code != null ? ' ($code)' : ''}';
}

/// Pagination information for search results
@freezed
class SearchPagination with _$SearchPagination {
  const factory SearchPagination({
    required int page,
    required int limit,
    required int totalCount,
    required int totalPages,
    required bool hasNext,
    required bool hasPrevious,
  }) = _SearchPagination;
}

/// State for search management
@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    /// Current search mode
    @Default(SearchMode.text) SearchMode searchMode,

    /// Text search query
    @Default('') String textQuery,

    /// Voice search transcribed text
    String? voiceTranscription,

    /// OCR extracted text from camera
    String? ocrText,

    /// OCR processing status
    @Default(OcrStatus.idle) OcrStatus ocrStatus,

    /// Whether voice is currently recording
    @Default(false) bool isRecording,

    /// Search results
    @Default([]) List<SearchResultEntity> results,

    /// Whether search is loading
    @Default(false) bool isLoading,

    /// Whether more results are being loaded (pagination)
    @Default(false) bool isLoadingMore,

    /// Pagination information
    SearchPagination? pagination,

    /// Error message if any
    String? errorMessage,

    /// Last search query that was executed
    String? lastSearchQuery,
  }) = _SearchState;

  const SearchState._();

  /// Check if there are search results
  bool get hasResults => results.isNotEmpty;

  /// Check if there are more pages to load
  bool get hasMorePages => pagination?.hasNext ?? false;

  /// Get the current query based on search mode
  String get currentQuery {
    switch (searchMode) {
      case SearchMode.text:
        return textQuery;
      case SearchMode.voice:
        return voiceTranscription ?? '';
      case SearchMode.camera:
        return ocrText ?? '';
    }
  }

  /// Check if OCR is in progress
  bool get isOcrProcessing =>
      ocrStatus == OcrStatus.capturing || ocrStatus == OcrStatus.processing;
}

/// Search result entity with relevance score
@freezed
class SearchResultEntity with _$SearchResultEntity {
  const factory SearchResultEntity({
    required ArtworkEntity artwork,
    required double relevanceScore,
  }) = _SearchResultEntity;
}