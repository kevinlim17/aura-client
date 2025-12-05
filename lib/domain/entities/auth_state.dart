import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_entity.dart';
import '../../data/services/auth_service.dart'; // For AuthException

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.authenticated({
    required UserEntity user,
    required String accessToken,
  }) = _Authenticated;

  const factory AuthState.unauthenticated() = _Unauthenticated;

  const factory AuthState.error(AuthException error) = _Error;
}

// Extension for state checking and data access
extension AuthStateX on AuthState {
  bool get isAuthenticated => this is _Authenticated;
  bool get isLoading => this is _Loading;
  bool get isError => this is _Error;

  UserEntity? get user => maybeWhen(
        authenticated: (user, _) => user,
        orElse: () => null,
      );

  String? get accessToken => maybeWhen(
        authenticated: (_, accessToken) => accessToken,
        orElse: () => null,
      );

  AuthException? get error => maybeWhen(
        error: (error) => error,
        orElse: () => null,
      );
}
