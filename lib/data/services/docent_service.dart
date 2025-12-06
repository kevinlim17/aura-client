import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/docent_entity.dart';
import '../models/docent_response.dart';

/// Exception thrown when docent operations fail
class DocentException implements Exception {
  final String message;
  final String? code;

  DocentException(this.message, [this.code]);

  @override
  String toString() =>
      'DocentException: $message${code != null ? ' (code: $code)' : ''}';
}

/// Service for docent-related API calls
class DocentService {
  final String baseUrl;
  final http.Client client;

  DocentService({required this.baseUrl, http.Client? client})
      : client = client ?? http.Client();

  /// Generate docent for an artwork
  /// POST /api/docent/generate
  ///
  /// Returns:
  /// - 200 OK: Docent generated immediately (synchronous)
  /// - 202 Accepted: Docent generation started (asynchronous)
  ///
  /// For asynchronous generation:
  /// - Use pollDocentStatus() to check generation progress
  /// - Poll every 2 seconds until status is COMPLETED or FAILED
  /// - Maximum polling time: 3 minutes
  Future<DocentGenerationResult> generateDocent({
    required String accessToken,
    required DocentGenerationRequest request,
  }) async {
    try {
      debugPrint('[DocentService] Generating docent for artwork ${request.artworkId}');

      final url = '$baseUrl/api/docent/generate';
      final response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: json.encode(request.toJson()),
      );

      debugPrint('[DocentService] Response status: ${response.statusCode}');
      debugPrint('[DocentService] Response body: ${response.body}');

      final responseData = json.decode(response.body) as Map<String, dynamic>;

      // Handle both 202 (async) and 200 (sync) responses
      if (response.statusCode == 202 || response.statusCode == 200) {
        // Handle wrapped response format: {"success": true, "data": {...}}
        if (responseData['success'] == true) {
          final data = responseData['data'] as Map<String, dynamic>?;
          if (data != null) {
            final resultResponse =
                DocentGenerationResultResponse.fromJson(data);
            return resultResponse.toEntity();
          }
        }

        // Handle direct response format: {"sessionId": 91, "status": "GENERATING", ...}
        if (responseData.containsKey('sessionId') && responseData.containsKey('status')) {
          debugPrint('[DocentService] Parsing direct response format');
          final resultResponse = DocentGenerationResultResponse.fromJson(responseData);
          return resultResponse.toEntity();
        }
      }

      final errorData = responseData['error'] as Map<String, dynamic>?;
      throw DocentException(
        errorData?['message'] ?? 'Failed to generate docent',
        errorData?['code'],
      );
    } catch (e) {
      debugPrint('[DocentService] Generate docent error: $e');
      if (e is DocentException) rethrow;
      throw DocentException('Failed to generate docent: $e');
    }
  }

  /// Poll docent generation status
  /// GET /api/docent/sessions/{sessionId}
  ///
  /// This method should be called periodically (every 2 seconds) until the status
  /// is either COMPLETED or FAILED. Maximum polling time is 3 minutes.
  ///
  /// Returns:
  /// - DocentGenerationResult with status GENERATING and progress percentage
  /// - DocentGenerationResult with status COMPLETED and result data
  /// - DocentGenerationResult with status FAILED and error message
  Future<DocentGenerationResult> pollDocentStatus({
    required String accessToken,
    required int sessionId,
  }) async {
    try {
      debugPrint('[DocentService] Polling docent status for session $sessionId');

      final url = '$baseUrl/api/docent/sessions/$sessionId';
      final response = await client.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      debugPrint('[DocentService] Response status: ${response.statusCode}');
      debugPrint('[DocentService] Response body: ${response.body}');

      final responseData = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200) {
        // Handle wrapped response format: {"success": true, "data": {...}}
        if (responseData['success'] == true) {
          final data = responseData['data'] as Map<String, dynamic>?;
          if (data != null) {
            final resultResponse =
                DocentGenerationResultResponse.fromJson(data);
            return resultResponse.toEntity();
          }
        }
        
        // Handle direct response format: {"sessionId": 89, "status": "GENERATING", ...}
        if (responseData.containsKey('sessionId') && responseData.containsKey('status')) {
          final resultResponse = DocentGenerationResultResponse.fromJson(responseData);
          return resultResponse.toEntity();
        }
      }

      final errorData = responseData['error'] as Map<String, dynamic>?;
      throw DocentException(
        errorData?['message'] ?? 'Failed to get docent status',
        errorData?['code'],
      );
    } catch (e) {
      debugPrint('[DocentService] Poll status error: $e');
      if (e is DocentException) rethrow;
      throw DocentException('Failed to poll docent status: $e');
    }
  }

  /// Update playback statistics for a docent session
  /// PUT /api/docent/sessions/{sessionId}/play-stats
  Future<DocentSessionEntity> updatePlaybackStats({
    required String accessToken,
    required int sessionId,
    required PlaybackStatsRequest stats,
  }) async {
    try {
      debugPrint('[DocentService] Updating playback stats for session $sessionId');

      final url = '$baseUrl/api/docent/sessions/$sessionId/play-stats';
      final response = await client.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: json.encode(stats.toJson()),
      );

      debugPrint('[DocentService] Response status: ${response.statusCode}');
      debugPrint('[DocentService] Response body: ${response.body}');

      final responseData = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        final data = responseData['data'] as Map<String, dynamic>;
        final sessionResponse = DocentSessionResponse.fromJson(data);
        return sessionResponse.toEntity();
      } else {
        final errorData = responseData['error'] as Map<String, dynamic>?;
        throw DocentException(
          errorData?['message'] ?? 'Failed to update playback stats',
          errorData?['code'],
        );
      }
    } catch (e) {
      debugPrint('[DocentService] Update playback stats error: $e');
      if (e is DocentException) rethrow;
      throw DocentException('Failed to update playback stats: $e');
    }
  }

  /// Get docent session by ID
  /// GET /api/docent/sessions/{sessionId}
  Future<DocentSessionEntity> getDocentSession({
    required String accessToken,
    required int sessionId,
  }) async {
    try {
      debugPrint('[DocentService] Getting docent session $sessionId');

      final url = '$baseUrl/api/docent/sessions/$sessionId';
      final response = await client.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      debugPrint('[DocentService] Response status: ${response.statusCode}');
      debugPrint('[DocentService] Response body: ${response.body}');

      final responseData = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        final data = responseData['data'] as Map<String, dynamic>;

        // The API might return a DocentGenerationResult object that contains the final session.
        // We can identify this structure by checking for the 'status' key.
        if (data.containsKey('status')) {
          final generationResult = DocentGenerationResultResponse.fromJson(data);
          if (generationResult.status == 'COMPLETED' && generationResult.result != null) {
            return generationResult.result!.toEntity();
          } else {
            // This is an unexpected response type for this method, which should
            // only be called to retrieve a completed session.
            throw DocentException(
              'Failed to get a completed docent session. Current status: ${generationResult.status}',
            );
          }
        }
        // Otherwise, we assume it's a direct DocentSessionResponse object.
        else {
          final sessionResponse = DocentSessionResponse.fromJson(data);
          return sessionResponse.toEntity();
        }
      } else {
        final errorData = responseData['error'] as Map<String, dynamic>?;
        throw DocentException(
          errorData?['message'] ?? 'Failed to get docent session',
          errorData?['code'],
        );
      }
    } catch (e) {
      debugPrint('[DocentService] Get docent session error: $e');
      if (e is DocentException) rethrow;
      throw DocentException('Failed to get docent session: $e');
    }
  }
}
