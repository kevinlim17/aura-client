import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../entities/search_state.dart';
import '../../data/services/search_service.dart';
import '../../core/accessibility/tts_service.dart';

/// TTS messages for search operations
class SearchTtsMessages {
  static const String searchStart = '검색 중입니다. 잠시만 기다려주세요.';
  static const String searchEmpty = '검색어를 입력해주세요.';
  static const String noResults = '검색 결과가 없습니다. 다른 검색어를 시도해보세요.';
  static const String searchError = '검색 중 오류가 발생했습니다. 다시 시도해주세요.';
  static const String loadingMore = '추가 결과를 불러오는 중입니다.';

  // Voice search messages
  static const String voiceStart = '음성 인식을 시작합니다. 작품명이나 작가명을 말씀해주세요.';
  static const String voiceEnd = '음성 인식이 완료되었습니다.';
  static const String voiceError = '음성 인식에 실패했습니다. 다시 시도해주세요.';

  // Camera/OCR messages
  static const String cameraStart = '카메라를 준비합니다. 작품 설명이나 이름이 보이는 곳을 촬영해주세요.';
  static const String ocrProcessing = '이미지에서 텍스트를 추출하는 중입니다.';
  static const String ocrComplete = '텍스트 추출이 완료되었습니다.';
  static const String ocrEmpty = '이미지에서 텍스트를 찾을 수 없습니다. 다시 촬영해주세요.';
  static const String ocrError = '텍스트 추출에 실패했습니다. 다시 시도해주세요.';

  static String resultsFound(int count) => '검색 결과 $count건을 찾았습니다.';

  static String resultSummary(String title, String artist) =>
      '$title, $artist 작품입니다.';
}

/// Search notifier for managing artwork search
class SearchNotifier extends StateNotifier<SearchState> {
  final SearchService _searchService;
  final TtsService _ttsService;
  final String _token;

  /// Default pagination limit
  static const int _defaultLimit = 10;

  SearchNotifier({
    required SearchService searchService,
    required TtsService ttsService,
    required String token,
  })  : _searchService = searchService,
        _ttsService = ttsService,
        _token = token,
        super(const SearchState());

  // ============================================================
  // Search Mode Management
  // ============================================================

  /// Switch search mode
  void setSearchMode(SearchMode mode) {
    state = state.copyWith(
      searchMode: mode,
      errorMessage: null,
    );

    // Announce mode change via TTS
    switch (mode) {
      case SearchMode.text:
        _ttsService.speak('텍스트 검색 모드입니다.');
        break;
      case SearchMode.voice:
        _ttsService.speak(SearchTtsMessages.voiceStart);
        break;
      case SearchMode.camera:
        _ttsService.speak(SearchTtsMessages.cameraStart);
        break;
    }
  }

  // ============================================================
  // Text Search
  // ============================================================

  /// Update text query
  void updateTextQuery(String query) {
    state = state.copyWith(textQuery: query);
  }

  /// Execute text search
  Future<void> searchByText({String? query}) async {
    final searchQuery = query ?? state.textQuery;

    if (searchQuery.trim().isEmpty) {
      await _ttsService.speak(SearchTtsMessages.searchEmpty);
      return;
    }

    await _executeSearch(searchQuery);
  }

  // ============================================================
  // Voice Search
  // ============================================================

  /// Start voice recording
  void startVoiceRecording() {
    state = state.copyWith(
      isRecording: true,
      voiceTranscription: null,
      errorMessage: null,
    );
    _ttsService.speak(SearchTtsMessages.voiceStart);
  }

  /// Stop voice recording and set transcription
  /// The actual STT processing should be done in the presentation layer
  /// using speech_to_text package, then pass the result here
  Future<void> setVoiceTranscription(String transcription) async {
    state = state.copyWith(
      isRecording: false,
      voiceTranscription: transcription,
    );

    await _ttsService.speak(SearchTtsMessages.voiceEnd);

    if (transcription.trim().isNotEmpty) {
      await _executeSearch(transcription);
    } else {
      await _ttsService.speak(SearchTtsMessages.searchEmpty);
    }
  }

  /// Cancel voice recording
  void cancelVoiceRecording() {
    state = state.copyWith(
      isRecording: false,
      voiceTranscription: null,
    );
  }

  // ============================================================
  // Camera/OCR Search
  // ============================================================

  /// Start camera capture
  void startCameraCapture() {
    state = state.copyWith(
      ocrStatus: OcrStatus.capturing,
      ocrText: null,
      errorMessage: null,
    );
  }

  /// Process captured image with OCR
  /// Uses google_mlkit_text_recognition package
  Future<void> processImageWithOcr(String imagePath) async {
    state = state.copyWith(ocrStatus: OcrStatus.processing);
    await _ttsService.speak(SearchTtsMessages.ocrProcessing);

    TextRecognizer? textRecognizer;

    try {
      // Verify file exists
      final file = File(imagePath);
      if (!await file.exists()) {
        throw SearchException('Image file not found', code: 'FILE_NOT_FOUND');
      }

      // Create input image from file path
      final inputImage = InputImage.fromFilePath(imagePath);

      // Initialize text recognizer for Korean script
      // ML Kit supports Korean text recognition
      textRecognizer = TextRecognizer(script: TextRecognitionScript.korean);

      // Process image and extract text
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
      final extractedText = recognizedText.text;

      debugPrint('[SearchNotifier] OCR extracted text: $extractedText');

      if (extractedText.trim().isEmpty) {
        state = state.copyWith(
          ocrStatus: OcrStatus.failed,
          errorMessage: 'No text found in image',
        );
        await _ttsService.speak(SearchTtsMessages.ocrEmpty);
        return;
      }

      // Clean up extracted text
      final cleanedText = _cleanOcrText(extractedText);

      state = state.copyWith(
        ocrStatus: OcrStatus.completed,
        ocrText: cleanedText,
      );

      await _ttsService.speak(
        '${SearchTtsMessages.ocrComplete} 추출된 텍스트: $cleanedText',
      );

      // Automatically search with extracted text
      await _executeSearch(cleanedText);
    } catch (e) {
      debugPrint('[SearchNotifier] OCR error: $e');
      state = state.copyWith(
        ocrStatus: OcrStatus.failed,
        errorMessage: e.toString(),
      );
      await _ttsService.speak(SearchTtsMessages.ocrError);
    } finally {
      // Clean up resources
      await textRecognizer?.close();
    }
  }

  /// Clean up OCR extracted text
  String _cleanOcrText(String text) {
    // Remove excessive whitespace
    var cleaned = text.replaceAll(RegExp(r'\s+'), ' ').trim();

    // Remove common OCR artifacts
    cleaned = cleaned.replaceAll(RegExp(r'[|_~`]'), '');

    // Take first meaningful portion (artwork names are usually short)
    if (cleaned.length > 100) {
      // Try to find a natural break point
      final breakPoints = ['.', '\n', ',', '-'];
      for (final bp in breakPoints) {
        final index = cleaned.indexOf(bp);
        if (index > 10 && index < 100) {
          cleaned = cleaned.substring(0, index);
          break;
        }
      }
      if (cleaned.length > 100) {
        cleaned = cleaned.substring(0, 100);
      }
    }

    return cleaned.trim();
  }

  /// Cancel OCR process
  void cancelOcrProcess() {
    state = state.copyWith(
      ocrStatus: OcrStatus.idle,
      ocrText: null,
    );
  }

  /// Retry OCR with the same image
  Future<void> retryOcr(String imagePath) async {
    await processImageWithOcr(imagePath);
  }

  // ============================================================
  // Core Search Execution
  // ============================================================

  /// Execute search with given query
  Future<void> _executeSearch(String query, {bool isLoadMore = false}) async {
    if (query.trim().isEmpty) return;

    final page = isLoadMore ? (state.pagination?.page ?? 0) + 1 : 1;

    if (isLoadMore) {
      state = state.copyWith(isLoadingMore: true);
      await _ttsService.speak(SearchTtsMessages.loadingMore);
    } else {
      state = state.copyWith(
        isLoading: true,
        errorMessage: null,
        lastSearchQuery: query,
      );
      await _ttsService.speak(SearchTtsMessages.searchStart);
    }

    try {
      final response = await _searchService.searchArtworks(
        query: query,
        token: _token,
        page: page,
        limit: _defaultLimit,
      );

      final newResults = response.data.toEntities();
      final pagination = response.data.toPagination();

      if (isLoadMore) {
        state = state.copyWith(
          results: [...state.results, ...newResults],
          pagination: pagination,
          isLoadingMore: false,
        );
      } else {
        state = state.copyWith(
          results: newResults,
          pagination: pagination,
          isLoading: false,
        );
      }

      // Announce results via TTS
      await _announceSearchResults(newResults.length, pagination.totalCount);
    } catch (e) {
      debugPrint('[SearchNotifier] Search error: $e');

      final errorMessage =
          e is SearchException ? e.message : 'Search failed: ${e.toString()}';

      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        errorMessage: errorMessage,
      );

      await _ttsService.speak(SearchTtsMessages.searchError);
    }
  }

  /// Load more results (pagination)
  Future<void> loadMoreResults() async {
    if (state.isLoadingMore || !state.hasMorePages) return;

    final query = state.lastSearchQuery;
    if (query == null || query.isEmpty) return;

    await _executeSearch(query, isLoadMore: true);
  }

  /// Announce search results via TTS
  Future<void> _announceSearchResults(int newCount, int totalCount) async {
    if (totalCount == 0) {
      await _ttsService.speak(SearchTtsMessages.noResults);
    } else {
      await _ttsService.speak(SearchTtsMessages.resultsFound(totalCount));

      // Announce first result details
      if (state.results.isNotEmpty) {
        final first = state.results.first;
        await _ttsService.speak(
          SearchTtsMessages.resultSummary(
            first.artwork.displayTitle,
            first.artwork.displayArtist,
          ),
        );
      }
    }
  }

  // ============================================================
  // Result Interaction
  // ============================================================

  /// Announce specific result via TTS
  Future<void> announceResult(int index) async {
    if (index < 0 || index >= state.results.length) return;

    final result = state.results[index];
    await _ttsService.speak(result.artwork.ttsSummary, interrupt: true);
  }

  /// Announce result with full description
  Future<void> announceResultWithDescription(int index) async {
    if (index < 0 || index >= state.results.length) return;

    final result = state.results[index];
    final artwork = result.artwork;

    final description = [
      artwork.ttsSummary,
      if (artwork.description != null && artwork.description!.isNotEmpty)
        artwork.shortDescription,
    ].join('. ');

    await _ttsService.speak(description, interrupt: true);
  }

  // ============================================================
  // State Management
  // ============================================================

  /// Clear search results
  void clearResults() {
    state = state.copyWith(
      results: [],
      pagination: null,
      lastSearchQuery: null,
    );
  }

  /// Clear all search state
  void clearAll() {
    state = const SearchState();
  }

  /// Clear error message
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  /// Stop TTS
  Future<void> stopTts() async {
    await _ttsService.stop();
  }
}