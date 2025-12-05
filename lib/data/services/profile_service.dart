import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/profile_entity.dart';

/// Exception thrown when profile operations fail
class ProfileException implements Exception {
  final String message;
  final String? code;

  ProfileException(this.message, [this.code]);

  @override
  String toString() => 'ProfileException: $message${code != null ? ' (code: $code)' : ''}';
}

/// Service for profile-related API calls
class ProfileService {
  final String baseUrl;
  final http.Client client;

  ProfileService({required this.baseUrl, http.Client? client})
      : client = client ?? http.Client();

  /// Get user profile
  /// GET /api/users/{userId}/profile
  Future<ProfileEntity> getProfile({
    required int userId,
    required String accessToken,
  }) async {
    try {
      debugPrint('[ProfileService] Getting profile for user $userId');

      final url = '$baseUrl/api/users/$userId/profile';
      final response = await client.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      debugPrint('[ProfileService] Response status: ${response.statusCode}');
      debugPrint('[ProfileService] Response body: ${response.body}');

      final responseData = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        final data = responseData['data'] as Map<String, dynamic>;
        return ProfileEntity.fromJson(data);
      } else {
        final errorData = responseData['error'] as Map<String, dynamic>?;
        throw ProfileException(
          errorData?['message'] ?? 'Failed to get profile',
          errorData?['code'],
        );
      }
    } catch (e) {
      debugPrint('[ProfileService] Get profile error: $e');
      if (e is ProfileException) rethrow;
      throw ProfileException('Failed to get profile: $e');
    }
  }

  /// Create user profile
  /// POST /api/users/{userId}/profile
  Future<ProfileEntity> createProfile({
    required int userId,
    required String accessToken,
    required ProfileRequest request,
  }) async {
    try {
      debugPrint('[ProfileService] Creating profile for user $userId');

      final url = '$baseUrl/api/users/$userId/profile';
      final response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: json.encode(request.toJson()),
      );

      debugPrint('[ProfileService] Response status: ${response.statusCode}');
      debugPrint('[ProfileService] Response body: ${response.body}');

      final responseData = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 201 && responseData['success'] == true) {
        final data = responseData['data'] as Map<String, dynamic>;
        return ProfileEntity.fromJson(data);
      } else {
        final errorData = responseData['error'] as Map<String, dynamic>?;
        throw ProfileException(
          errorData?['message'] ?? 'Failed to create profile',
          errorData?['code'],
        );
      }
    } catch (e) {
      debugPrint('[ProfileService] Create profile error: $e');
      if (e is ProfileException) rethrow;
      throw ProfileException('Failed to create profile: $e');
    }
  }

  /// Update user profile
  /// PUT /api/users/{userId}/profile
  Future<ProfileEntity> updateProfile({
    required int userId,
    required String accessToken,
    required ProfileRequest request,
  }) async {
    try {
      debugPrint('[ProfileService] Updating profile for user $userId');

      final url = '$baseUrl/api/users/$userId/profile';
      final response = await client.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: json.encode(request.toJson()),
      );

      debugPrint('[ProfileService] Response status: ${response.statusCode}');
      debugPrint('[ProfileService] Response body: ${response.body}');

      final responseData = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        final data = responseData['data'] as Map<String, dynamic>;
        return ProfileEntity.fromJson(data);
      } else {
        final errorData = responseData['error'] as Map<String, dynamic>?;
        throw ProfileException(
          errorData?['message'] ?? 'Failed to update profile',
          errorData?['code'],
        );
      }
    } catch (e) {
      debugPrint('[ProfileService] Update profile error: $e');
      if (e is ProfileException) rethrow;
      throw ProfileException('Failed to update profile: $e');
    }
  }
}