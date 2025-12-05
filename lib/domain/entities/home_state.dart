import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

/// State for home screen
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _HomeState;
}