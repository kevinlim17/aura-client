import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/preferences_entity.dart';
import '../../domain/entities/preferences_state.dart';
import '../models/preferences_response.dart';

/// Preferences service for API calls
class PreferencesService {
  final String baseUrl;
  final http.Client client;

  PreferencesService({required this.baseUrl, http.Client? client})
      : client = client ?? http.Client();

  /// Get user preferences
  Future<PreferencesEntity> getPreferences({
    required String userId,
    required String token,
  }) async {
    final url = '$baseUrl/api/users/$userId/preferences';
    debugPrint('[PreferencesService] GET $url');

    try {
      final response = await client.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      debugPrint('[PreferencesService] Response status: ${response.statusCode}');
      debugPrint('[PreferencesService] Response body: ${response.body}');

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        debugPrint('[PreferencesService] Get preferences successful');
        final apiResponse = PreferencesApiResponse.fromJson(responseData);
        return apiResponse.toEntity();
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        final errorMessage =
            error?['message'] as String? ?? 'Failed to get preferences';
        debugPrint('[PreferencesService] Get preferences failed: $errorMessage ($errorCode)');
        throw PreferencesException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is PreferencesException) rethrow;
      debugPrint('[PreferencesService] Network error: $e');
      throw PreferencesException('Network error: ${e.toString()}',
          code: 'NETWORK_ERROR');
    }
  }

  /// Create user preferences
  Future<PreferencesEntity> createPreferences({
    required String userId,
    required String token,
    required PreferencesEntity preferences,
  }) async {
    final url = '$baseUrl/api/users/$userId/preferences';
    debugPrint('[PreferencesService] POST $url');

    try {
      final requestBody = preferences.toJson();

      final response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );

      debugPrint('[PreferencesService] Response status: ${response.statusCode}');
      debugPrint('[PreferencesService] Response body: ${response.body}');

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 201 && responseData['success'] == true) {
        debugPrint('[PreferencesService] Create preferences successful');
        final apiResponse = PreferencesApiResponse.fromJson(responseData);
        return apiResponse.toEntity();
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        final errorMessage =
            error?['message'] as String? ?? 'Failed to create preferences';
        debugPrint('[PreferencesService] Create preferences failed: $errorMessage ($errorCode)');
        throw PreferencesException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is PreferencesException) rethrow;
      debugPrint('[PreferencesService] Network error: $e');
      throw PreferencesException('Network error: ${e.toString()}',
          code: 'NETWORK_ERROR');
    }
  }

  /// Update user preferences
  Future<PreferencesEntity> updatePreferences({
    required String userId,
    required String token,
    required PreferencesEntity preferences,
  }) async {
    final url = '$baseUrl/api/users/$userId/preferences';
    debugPrint('[PreferencesService] PUT $url');

    try {
      final requestBody = preferences.toJson();

      final response = await client.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );

      debugPrint('[PreferencesService] Response status: ${response.statusCode}');
      debugPrint('[PreferencesService] Response body: ${response.body}');

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        debugPrint('[PreferencesService] Update preferences successful');
        final apiResponse = PreferencesApiResponse.fromJson(responseData);
        return apiResponse.toEntity();
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        final errorMessage =
            error?['message'] as String? ?? 'Failed to update preferences';
        debugPrint('[PreferencesService] Update preferences failed: $errorMessage ($errorCode)');
        throw PreferencesException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is PreferencesException) rethrow;
      debugPrint('[PreferencesService] Network error: $e');
      throw PreferencesException('Network error: ${e.toString()}',
          code: 'NETWORK_ERROR');
    }
  }
}