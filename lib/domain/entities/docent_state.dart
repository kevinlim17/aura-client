import 'package:freezed_annotation/freezed_annotation.dart';
import 'docent_entity.dart';

part 'docent_state.freezed.dart';

/// Docent generation state
@freezed
class DocentState with _$DocentState {
  const factory DocentState.initial() = _Initial;

  const factory DocentState.generating({
    required int sessionId,
    required int estimatedTimeSeconds,
    @Default(0) int progress,
    DateTime? startTime,
  }) = _Generating;

  const factory DocentState.completed({
    required DocentSessionEntity session,
  }) = _Completed;

  const factory DocentState.failed({
    required String errorMessage,
    int? sessionId,
  }) = _Failed;

  const DocentState._();

  /// Check if state is generating
  bool get isGenerating => this is _Generating;

  /// Check if state is completed
  bool get isCompleted => this is _Completed;

  /// Check if state is failed
  bool get isFailed => this is _Failed;

  /// Get session ID if available
  int? get sessionId => maybeWhen(
        generating: (id, _, __, ___) => id,
        completed: (session) => session.id,
        failed: (_, id) => id,
        orElse: () => null,
      );

  /// Get result session if completed
  DocentSessionEntity? get session => maybeWhen(
        completed: (session) => session,
        orElse: () => null,
      );

  /// Get elapsed time since generation started
  Duration? get elapsedTime => maybeWhen(
        generating: (_, __, ___, startTime) {
          if (startTime == null) return null;
          return DateTime.now().difference(startTime);
        },
        orElse: () => null,
      );
}
