import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/home_state.dart';
import '../../data/services/link_service.dart';
import '../../data/services/memo_service.dart';

/// Home screen notifier for managing link and memo actions
class HomeNotifier extends StateNotifier<HomeState> {
  final LinkService _linkService;
  final MemoService _memoService;
  final String _userId;
  final String _token;

  HomeNotifier({
    required LinkService linkService,
    required MemoService memoService,
    required String userId,
    required String token,
  })  : _linkService = linkService,
        _memoService = memoService,
        _userId = userId,
        _token = token,
        super(const HomeState());

  /// Add a new link
  Future<bool> addLink({
    required String url,
    String? title,
    String? description,
    String? linkType,
    int? artworkId,
    int? docentSessionId,
    Map<String, dynamic>? metadata,
    String? thumbnailUrl,
    bool? hasAudioDescription,
    bool? hasSubtitles,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _linkService.createLink(
        userId: _userId,
        token: _token,
        url: url,
        title: title,
        description: description,
        linkType: linkType,
        artworkId: artworkId,
        docentSessionId: docentSessionId,
        metadata: metadata,
        thumbnailUrl: thumbnailUrl,
        hasAudioDescription: hasAudioDescription,
        hasSubtitles: hasSubtitles,
      );

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  /// Add a new memo
  Future<bool> addMemo({
    required String content,
    required String inputMethod,
    String? voiceUrl,
    int? voiceDurationSeconds,
    String? category,
    List<String>? tags,
    int? artworkId,
    int? docentSessionId,
    bool? isSharedWithCompanion,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _memoService.createMemo(
        userId: _userId,
        token: _token,
        content: content,
        inputMethod: inputMethod,
        voiceUrl: voiceUrl,
        voiceDurationSeconds: voiceDurationSeconds,
        category: category,
        tags: tags,
        artworkId: artworkId,
        docentSessionId: docentSessionId,
        isSharedWithCompanion: isSharedWithCompanion,
      );

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  /// Clear error message
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}