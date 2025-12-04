import 'package:jwt_decoder/jwt_decoder.dart';
import '../../domain/entities/user_entity.dart';
import '../../core/utils/storage_service.dart';
import '../services/auth_service.dart';

/// Result class for repository operations
class AuthResult<T> {
  final T? data;
  final String? error;
  final String? errorCode;

  AuthResult.success(this.data)
      : error = null,
        errorCode = null;

  AuthResult.failure(this.error, {this.errorCode}) : data = null;

  bool get isSuccess => data != null;
  bool get isFailure => error != null;
}

/// Authentication repository
/// Coordinates between AuthService (API) and StorageService (local storage)
class AuthRepository {
  final AuthService _authService;
  final StorageService _storageService;

  AuthRepository({
    required AuthService authService,
    required StorageService storageService,
  })  : _authService = authService,
        _storageService = storageService;

  /// Login with email and password
  Future<AuthResult<UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authService.login(
        email: email,
        password: password,
      );

      // Calculate token expiry from JWT or use provided expiry
      final tokenExpiry = response.expiresAt ??
          _getTokenExpiry(response.token) ??
          DateTime.now().add(const Duration(hours: 24));

      // Save to local storage
      await _storageService.saveToken(response.token);
      await _storageService.saveTokenExpiry(tokenExpiry);
      await _storageService.saveUserData(_userToJson(response.user));

      return AuthResult.success(response.user);
    } on AuthException catch (e) {
      return AuthResult.failure(e.message, errorCode: e.code);
    } catch (e) {
      return AuthResult.failure('Unexpected error: ${e.toString()}');
    }
  }

  /// Register new user
  Future<AuthResult<UserEntity>> register({
    required String email,
    required String password,
    required String name,
    required bool isVisuallyImpaired,
    required DisabilitySeverity disabilitySeverity,
  }) async {
    try {
      final response = await _authService.register(
        email: email,
        password: password,
        name: name,
        isVisuallyImpaired: isVisuallyImpaired,
        disabilitySeverity: disabilitySeverity,
      );

      // Calculate token expiry
      final tokenExpiry = response.expiresAt ??
          _getTokenExpiry(response.token) ??
          DateTime.now().add(const Duration(hours: 24));

      // Save to local storage
      await _storageService.saveToken(response.token);
      await _storageService.saveTokenExpiry(tokenExpiry);
      await _storageService.saveUserData(_userToJson(response.user));

      return AuthResult.success(response.user);
    } on AuthException catch (e) {
      return AuthResult.failure(e.message, errorCode: e.code);
    } catch (e) {
      return AuthResult.failure('Unexpected error: ${e.toString()}');
    }
  }

  /// Logout
  Future<AuthResult<void>> logout() async {
    try {
      final token = _storageService.getToken();
      if (token != null) {
        // Call server logout (optional, fails silently)
        await _authService.logout(token);
      }

      // Clear local storage
      await _storageService.clearAuthData();

      return AuthResult.success(null);
    } catch (e) {
      // Even if server logout fails, clear local data
      await _storageService.clearAuthData();
      return AuthResult.success(null);
    }
  }

  /// Auto-login using stored token
  Future<AuthResult<UserEntity>> autoLogin() async {
    try {
      // Check if auto-login is enabled
      if (!_storageService.getAutoLogin()) {
        return AuthResult.failure('Auto-login disabled');
      }

      // Get stored token
      final token = _storageService.getToken();
      if (token == null) {
        return AuthResult.failure('No token found');
      }

      // Check token expiry
      if (!_storageService.hasValidToken()) {
        // Try to refresh token
        return await refreshToken();
      }

      // Get stored user data
      final userData = _storageService.getUserData();
      if (userData == null) {
        return AuthResult.failure('No user data found');
      }

      final user = UserEntity.fromJson(userData);
      return AuthResult.success(user);
    } catch (e) {
      return AuthResult.failure('Auto-login failed: ${e.toString()}');
    }
  }

  /// Refresh authentication token
  Future<AuthResult<UserEntity>> refreshToken() async {
    try {
      final currentToken = _storageService.getToken();
      if (currentToken == null) {
        return AuthResult.failure('No token to refresh');
      }

      final response = await _authService.refreshToken(currentToken);

      // Calculate new token expiry
      final tokenExpiry = response.expiresAt ??
          _getTokenExpiry(response.token) ??
          DateTime.now().add(const Duration(hours: 24));

      // Update local storage
      await _storageService.saveToken(response.token);
      await _storageService.saveTokenExpiry(tokenExpiry);
      await _storageService.saveUserData(_userToJson(response.user));

      return AuthResult.success(response.user);
    } on AuthException catch (e) {
      // Token refresh failed, clear auth data
      await _storageService.clearAuthData();
      return AuthResult.failure(e.message, errorCode: e.code);
    } catch (e) {
      return AuthResult.failure('Token refresh failed: ${e.toString()}');
    }
  }

  /// Get current authentication state
  Future<AuthResult<UserEntity>> getCurrentAuth() async {
    try {
      final token = _storageService.getToken();
      if (token == null) {
        return AuthResult.failure('Not authenticated');
      }

      // Check if token is expired
      if (!_storageService.hasValidToken()) {
        return AuthResult.failure('Token expired');
      }

      final userData = _storageService.getUserData();
      if (userData == null) {
        return AuthResult.failure('No user data found');
      }

      final user = UserEntity.fromJson(userData);
      return AuthResult.success(user);
    } catch (e) {
      return AuthResult.failure('Failed to get auth state: ${e.toString()}');
    }
  }

  /// Get stored token
  String? getToken() => _storageService.getToken();

  /// Get token expiry
  DateTime? getTokenExpiry() => _storageService.getTokenExpiry();

  /// Check if token is valid
  bool hasValidToken() => _storageService.hasValidToken();

  /// Extract expiry date from JWT token
  DateTime? _getTokenExpiry(String token) {
    try {
      if (JwtDecoder.isExpired(token)) {
        return null;
      }
      final decoded = JwtDecoder.decode(token);
      final exp = decoded['exp'] as int?;
      if (exp != null) {
        return DateTime.fromMillisecondsSinceEpoch(exp * 1000);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Convert UserEntity to JSON
  Map<String, dynamic> _userToJson(UserEntity user) {
    return {
      'id': user.id,
      'email': user.email,
      'name': user.name,
      'isVisuallyImpaired': user.isVisuallyImpaired,
      'disabilitySeverity': user.disabilitySeverity.name,
      'createdAt': user.createdAt.toIso8601String(),
      'lastLoginAt': user.lastLoginAt?.toIso8601String(),
      'profileImageUrl': user.profileImageUrl,
      'bio': user.bio,
    };
  }
}
