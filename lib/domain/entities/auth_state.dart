import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_entity.dart';

part 'auth_state.freezed.dart';

/// Authentication state representation using freezed sealed class
@freezed
class AuthState with _$AuthState {
  /// Initial state when app starts
  const factory AuthState.initial() = _Initial;

  /// Loading state during authentication operations
  const factory AuthState.loading() = _Loading;

  /// Authenticated state with user data and token
  const factory AuthState.authenticated({
    required UserEntity user,
    required String token,
    required DateTime tokenExpiry,
  }) = _Authenticated;

  /// Error state with error message
  const factory AuthState.error({
    required String message,
    String? errorCode,
  }) = _Error;

  /// Unauthenticated state (logged out)
  const factory AuthState.unauthenticated() = _Unauthenticated;
}

/// Extension for state checking
extension AuthStateX on AuthState {
  bool get isAuthenticated => this is _Authenticated;
  bool get isLoading => this is _Loading;
  bool get isError => this is _Error;
  bool get isInitial => this is _Initial;
  bool get isUnauthenticated => this is _Unauthenticated;

  UserEntity? get user => maybeWhen(
        authenticated: (user, _, __) => user,
        orElse: () => null,
      );

  String? get token => maybeWhen(
        authenticated: (_, token, __) => token,
        orElse: () => null,
      );

  DateTime? get tokenExpiry => maybeWhen(
        authenticated: (_, __, expiry) => expiry,
        orElse: () => null,
      );

  bool get isTokenExpired {
    final expiry = tokenExpiry;
    if (expiry == null) return true;
    return DateTime.now().isAfter(expiry);
  }
}
