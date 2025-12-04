import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/user_entity.dart';

/// Response model for authentication
class AuthResponse {
  final String token;
  final UserEntity user;
  final DateTime? expiresAt;

  AuthResponse({
    required this.token,
    required this.user,
    this.expiresAt,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'] as String,
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      expiresAt: json['expiresAt'] != null
          ? DateTime.parse(json['expiresAt'] as String)
          : null,
    );
  }
}

/// Authentication service for API calls
class AuthService {
  final String baseUrl;
  final http.Client client;

  AuthService({
    required this.baseUrl,
    http.Client? client,
  }) : client = client ?? http.Client();

  /// Login with email and password
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return AuthResponse.fromJson(data);
      } else if (response.statusCode == 401) {
        throw AuthException(
          'Invalid email or password',
          code: 'INVALID_CREDENTIALS',
        );
      } else if (response.statusCode == 404) {
        throw AuthException(
          'User not found',
          code: 'USER_NOT_FOUND',
        );
      } else {
        final errorData = jsonDecode(response.body) as Map<String, dynamic>;
        throw AuthException(
          errorData['message'] as String? ?? 'Login failed',
          code: errorData['code'] as String?,
        );
      }
    } catch (e) {
      if (e is AuthException) rethrow;
      throw AuthException('Network error: ${e.toString()}', code: 'NETWORK_ERROR');
    }
  }

  /// Register new user
  Future<AuthResponse> register({
    required String email,
    required String password,
    required String name,
    required bool isVisuallyImpaired,
    required DisabilitySeverity disabilitySeverity,
  }) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/api/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'name': name,
          'isVisuallyImpaired': isVisuallyImpaired,
          'disabilitySeverity': disabilitySeverity.name.toUpperCase(),
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return AuthResponse.fromJson(data);
      } else if (response.statusCode == 409) {
        throw AuthException(
          'Email already exists',
          code: 'EMAIL_EXISTS',
        );
      } else if (response.statusCode == 400) {
        final errorData = jsonDecode(response.body) as Map<String, dynamic>;
        throw AuthException(
          errorData['message'] as String? ?? 'Invalid registration data',
          code: 'INVALID_DATA',
        );
      } else {
        final errorData = jsonDecode(response.body) as Map<String, dynamic>;
        throw AuthException(
          errorData['message'] as String? ?? 'Registration failed',
          code: errorData['code'] as String?,
        );
      }
    } catch (e) {
      if (e is AuthException) rethrow;
      throw AuthException('Network error: ${e.toString()}', code: 'NETWORK_ERROR');
    }
  }

  /// Verify token validity
  Future<bool> verifyToken(String token) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/api/auth/verify'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Refresh token
  Future<AuthResponse> refreshToken(String token) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/api/auth/refresh'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return AuthResponse.fromJson(data);
      } else {
        throw AuthException('Token refresh failed', code: 'REFRESH_FAILED');
      }
    } catch (e) {
      if (e is AuthException) rethrow;
      throw AuthException('Network error: ${e.toString()}', code: 'NETWORK_ERROR');
    }
  }

  /// Logout (optional server-side logout)
  Future<void> logout(String token) async {
    try {
      await client.post(
        Uri.parse('$baseUrl/api/auth/logout'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
    } catch (e) {
      // Logout can fail silently
      // Local logout should still proceed
    }
  }

  /// Get current user from token
  Future<UserEntity> getCurrentUser(String token) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/api/auth/me'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return UserEntity.fromJson(data['user'] as Map<String, dynamic>);
      } else {
        throw AuthException('Failed to get user', code: 'GET_USER_FAILED');
      }
    } catch (e) {
      if (e is AuthException) rethrow;
      throw AuthException('Network error: ${e.toString()}', code: 'NETWORK_ERROR');
    }
  }
}

/// Custom exception for authentication errors
class AuthException implements Exception {
  final String message;
  final String? code;

  AuthException(this.message, {this.code});

  @override
  String toString() => 'AuthException: $message${code != null ? ' ($code)' : ''}';

  bool get isNetworkError => code == 'NETWORK_ERROR';
  bool get isInvalidCredentials => code == 'INVALID_CREDENTIALS';
  bool get isUserNotFound => code == 'USER_NOT_FOUND';
  bool get isEmailExists => code == 'EMAIL_EXISTS';
}
