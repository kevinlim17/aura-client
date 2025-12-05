import 'package:freezed_annotation/freezed_annotation.dart';
import 'preferences_entity.dart';

part 'preferences_state.freezed.dart';

/// Exception for preferences-related errors
class PreferencesException implements Exception {
  final String message;
  final String? code;

  PreferencesException(this.message, {this.code});

  @override
  String toString() =>
      'PreferencesException: $message${code != null ? ' ($code)' : ''}';
}

/// State for preferences management
@freezed
class PreferencesState with _$PreferencesState {
  const factory PreferencesState.initial() = PreferencesStateInitial;

  const factory PreferencesState.loading() = PreferencesStateLoading;

  const factory PreferencesState.loaded({
    required PreferencesEntity preferences,
  }) = PreferencesStateLoaded;

  const factory PreferencesState.error(PreferencesException error) =
      PreferencesStateError;
}

/// Extension for convenience methods
extension PreferencesStateX on PreferencesState {
  bool get isLoading => this is PreferencesStateLoading;
  bool get isLoaded => this is PreferencesStateLoaded;
  bool get hasError => this is PreferencesStateError;

  PreferencesEntity? get preferences => maybeWhen(
        loaded: (prefs) => prefs,
        orElse: () => null,
      );

  PreferencesException? get error => maybeWhen(
        error: (err) => err,
        orElse: () => null,
      );
}