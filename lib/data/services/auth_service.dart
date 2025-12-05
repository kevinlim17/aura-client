import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/user_entity.dart';

/// Response model for both login and register API calls
/// Unified to match the API specification
class AuthResponse {
  final Map<String, dynamic> user;
  final String token;
  final String? expiresAt;

  AuthResponse({
    required this.user,
    required this.token,
    this.expiresAt,
  });

  /// Create AuthResponse from login API response
  factory AuthResponse.fromLoginJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;

    return AuthResponse(
      user: data['user'] as Map<String, dynamic>,
      token: data['token'] as String,
      expiresAt: data['expiresAt'] as String?,
    );
  }

  /// Create AuthResponse from register API response
  factory AuthResponse.fromRegisterJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;

    return AuthResponse(
      user: data['user'] as Map<String, dynamic>,
      token: data['token'] as String,
      // Register doesn't return expiresAt
    );
  }

  /// Convert to UserEntity
  UserEntity toUserEntity() {
    return UserEntity(
      id: (user['id'] as int).toString(),
      email: user['email'] as String,
      name: null, // Name is not returned from auth endpoints
      userType: _parseUserType(user['userType'] as String),
      isVisuallyImpaired: user['isVisuallyImpaired'] as bool,
      impairmentLevel: _parseImpairmentLevel(user['impairmentLevel'] as String?),
      isOnboardingCompleted: user['isOnboardingCompleted'] as bool,
      createdAt: DateTime.parse(user['createdAt'] as String),
      lastLoginAt: user['lastLoginAt'] != null
          ? DateTime.parse(user['lastLoginAt'] as String)
          : null,
    );
  }

  static UserType _parseUserType(String type) {
    switch (type) {
      case 'MAIN_USER':
        return UserType.mainUser;
      case 'COMPANION':
        return UserType.companion;
      default:
        return UserType.mainUser;
    }
  }

  static ImpairmentLevel _parseImpairmentLevel(String? level) {
    if (level == null) return ImpairmentLevel.none;
    switch (level) {
      case 'TOTAL_BLINDNESS':
        return ImpairmentLevel.totalBlindness;
      case 'LOW_VISION':
        return ImpairmentLevel.lowVision;
      case 'NONE':
        return ImpairmentLevel.none;
      default:
        return ImpairmentLevel.none;
    }
  }

  /// Get access token
  String get accessToken => token;
}

/// Response model for token refresh
class TokenRefreshResponse {
  final String accessToken;
  final String? refreshToken;

  TokenRefreshResponse({required this.accessToken, this.refreshToken});

  factory TokenRefreshResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? json;

    return TokenRefreshResponse(
      accessToken: data['accessToken'] as String,
      refreshToken: data['refreshToken'] as String?,
    );
  }
}

/// Authentication service for API calls
class AuthService {
  final String baseUrl;
  final http.Client client;

  AuthService({required this.baseUrl, http.Client? client})
      : client = client ?? http.Client();

  /// Login with email and password
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final url = '$baseUrl/api/auth/login';
    debugPrint('[AuthService] POST $url');

    try {
      final response = await client.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        debugPrint('[AuthService] Login successful');
        return AuthResponse.fromLoginJson(responseData);
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        final errorMessage = error?['message'] as String? ?? 'Login failed';
        debugPrint('[AuthService] Login failed: $errorMessage ($errorCode)');
        throw AuthException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is AuthException) rethrow;
      debugPrint('[AuthService] Network error: $e');
      throw AuthException('Network error', code: 'NETWORK_ERROR');
    }
  }

  /// Register new user
  Future<AuthResponse> register({
    required String email,
    required String password,
    String userType = 'MAIN_USER',
    bool isVisuallyImpaired = true,
    String impairmentLevel = 'TOTAL_BLINDNESS',
  }) async {
    final url = '$baseUrl/api/auth/register';
    debugPrint('[AuthService] POST $url');

    try {
      final requestBody = {
        'email': email,
        'password': password,
        'userType': userType,
        'isVisuallyImpaired': isVisuallyImpaired,
        'impairmentLevel': impairmentLevel,
      };

      final response = await client.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      debugPrint('[AuthService] Response status: ${response.statusCode}');
      debugPrint('[AuthService] Response body: ${response.body}');

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 201 && responseData['success'] == true) {
        debugPrint('[AuthService] Registration successful');
        return AuthResponse.fromRegisterJson(responseData);
      } else {
        final error = responseData['error'] as Map<String, dynamic>;
        final errorCode = error['code'] as String?;
        var errorMessage = error['message'] as String? ?? 'Registration failed';

        if (response.statusCode == 422) {
          final details = error['details'] as Map<String, dynamic>?;
          if (details != null) {
            errorMessage = details.entries.map((e) => '${e.key}: ${e.value}').join('\n');
          }
        }
        
        debugPrint('[AuthService] Registration failed: $errorMessage ($errorCode)');
        throw AuthException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is AuthException) rethrow;
      debugPrint('[AuthService] Network error: $e');
      throw AuthException('Network error: ${e.toString()}', code: 'NETWORK_ERROR');
    }
  }
  
  /// Verify token validity
  Future<bool> verifyToken(String token) async {
    // ... (rest of the file remains the same for now)
    return true; // Placeholder
  }

  /// Refresh token
  Future<TokenRefreshResponse> refreshToken(String refreshToken) async {
    // ...
    throw UnimplementedError();
  }

  /// Logout
  Future<void> logout(String token) async {
    // ...
  }

  /// Get current user profile
  Future<Map<String, dynamic>> getCurrentUser(String token) async {
    // ...
    throw UnimplementedError();
  }
}

/// Custom exception for authentication errors
class AuthException implements Exception {
  final String message;
  final String? code;

  AuthException(this.message, {this.code});

  @override
  String toString() => 'AuthException: $message${code != null ? ' ($code)' : ''}';
}
