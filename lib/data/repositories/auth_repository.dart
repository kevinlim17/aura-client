import 'package:jwt_decoder/jwt_decoder.dart';
import '../../domain/entities/user_entity.dart';
import '../../core/utils/storage_service.dart';
import '../services/auth_service.dart';

class AuthResult<T> {
  final T? data;
  final AuthException? error;

  AuthResult.success(this.data) : error = null;
  AuthResult.failure(this.error) : data = null;

  bool get isSuccess => data != null;
  bool get isFailure => error != null;
}

class AuthRepository {
  final AuthService _authService;
  final StorageService _storageService;

  AuthRepository({
    required AuthService authService,
    required StorageService storageService,
  })  : _authService = authService,
        _storageService = storageService;

  Future<AuthResult<UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authService.login(email: email, password: password);
      final user = await _storeAuthResponse(response);
      return AuthResult.success(user);
    } on AuthException catch (e) {
      return AuthResult.failure(e);
    }
  }

  Future<AuthResult<UserEntity>> register({
    required String email,
    required String password,
    String userType = 'MAIN_USER',
    bool isVisuallyImpaired = true,
    String impairmentLevel = 'TOTAL_BLINDNESS',
  }) async {
    try {
      final response = await _authService.register(
        email: email,
        password: password,
        userType: userType,
        isVisuallyImpaired: isVisuallyImpaired,
        impairmentLevel: impairmentLevel,
      );
      final user = await _storeAuthResponse(response);
      return AuthResult.success(user);
    } on AuthException catch (e) {
      return AuthResult.failure(e);
    }
  }

  Future<void> logout() async {
    final token = _storageService.getToken();
    if (token != null) {
      await _authService.logout(token); // Fails silently
    }
    await _storageService.clearAuthData();
  }

  Future<UserEntity?> autoLogin() async {
    if (!_storageService.getAutoLogin() || !_storageService.hasValidToken()) {
      return null;
    }
    final userData = _storageService.getUserData();
    return userData != null ? UserEntity.fromJson(userData) : null;
  }

  Future<UserEntity> _storeAuthResponse(AuthResponse response) async {
    final user = response.toUserEntity();
    await _storeAuthData(
      accessToken: response.accessToken,
      user: user,
      expiresAt: response.expiresAt,
    );
    return user;
  }

  Future<void> _storeAuthData({
    required String accessToken,
    required UserEntity user,
    String? expiresAt,
  }) async {
    DateTime? tokenExpiry;

    // Try to get expiry from expiresAt string or JWT
    if (expiresAt != null) {
      try {
        tokenExpiry = DateTime.parse(expiresAt);
      } catch (e) {
        // Fall back to JWT decoding
        tokenExpiry = _getTokenExpiry(accessToken);
      }
    } else {
      tokenExpiry = _getTokenExpiry(accessToken);
    }

    await _storageService.saveToken(accessToken);
    if (tokenExpiry != null) {
      await _storageService.saveTokenExpiry(tokenExpiry);
    }
    await _storageService.saveUserData(user.toJson());
  }

  DateTime? _getTokenExpiry(String token) {
    try {
      if (JwtDecoder.isExpired(token)) return null;
      final decoded = JwtDecoder.decode(token);
      final exp = decoded['exp'] as int?;
      return exp != null ? DateTime.fromMillisecondsSinceEpoch(exp * 1000) : null;
    } catch (e) {
      return null;
    }
  }

  String? getToken() => _storageService.getToken();
}
