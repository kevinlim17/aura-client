import 'package:freezed_annotation/freezed_annotation.dart';
import 'context_entity.dart';
import '../../data/services/voice_service.dart';

part 'context_state.freezed.dart';

/// State for context management
@freezed
class ContextState with _$ContextState {
  const factory ContextState.idle() = _Idle;

  const factory ContextState.loading() = _Loading;

  const factory ContextState.submitting({
    required String message,
  }) = _Submitting;

  const factory ContextState.success({
    required ContextEntity context,
    required String message,
  }) = _Success;

  const factory ContextState.error({
    required String message,
    String? code,
  }) = _Error;

  const factory ContextState.recording({
    required RecordingState recordingState,
    required Duration duration,
  }) = _Recording;
}

/// State for context list
@freezed
class ContextListState with _$ContextListState {
  const factory ContextListState.initial() = _Initial;

  const factory ContextListState.loading() = _ContextListLoading;

  const factory ContextListState.loaded({
    required List<ContextEntity> contexts,
    required int currentPage,
    required bool hasMore,
  }) = _Loaded;

  const factory ContextListState.error({
    required String message,
    String? code,
  }) = _ContextListError;
}

/// State for emotion tags recommendation
@freezed
class EmotionTagsState with _$EmotionTagsState {
  const factory EmotionTagsState.initial() = _EmotionTagsInitial;

  const factory EmotionTagsState.loading() = _EmotionTagsLoading;

  const factory EmotionTagsState.loaded({
    required List<String> recommendedTags,
  }) = _EmotionTagsLoaded;

  const factory EmotionTagsState.error({
    required String message,
  }) = _EmotionTagsError;
}
