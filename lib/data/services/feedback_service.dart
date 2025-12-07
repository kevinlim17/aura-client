import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/feedback_entity.dart';
import '../models/feedback_response.dart';

/// Exception for feedback-related errors
class FeedbackException implements Exception {
  final String message;
  final String? code;

  FeedbackException(this.message, {this.code});

  @override
  String toString() =>
      'FeedbackException: $message${code != null ? ' ($code)' : ''}';
}

/// Feedback service for API calls
class FeedbackService {
  final String baseUrl;
  final http.Client client;

  FeedbackService({required this.baseUrl, http.Client? client})
      : client = client ?? http.Client();

  /// Submit feedback for a docent session
  Future<FeedbackEntity> submitFeedback({
    required int sessionId,
    required String token,
    required FeedbackSubmissionRequest feedback,
  }) async {
    final url = '$baseUrl/api/docent/sessions/$sessionId/feedback';
    debugPrint('[FeedbackService] POST $url');
    debugPrint('[FeedbackService] Request: ${feedback.toJson()}');

    try {
      final response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(feedback.toJson()),
      );

      debugPrint('[FeedbackService] Response status: ${response.statusCode}');
      debugPrint('[FeedbackService] Response body: ${response.body}');

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          responseData['success'] == true) {
        debugPrint('[FeedbackService] Feedback submitted successfully');
        final apiResponse = FeedbackApiResponse.fromJson(responseData);
        return apiResponse.toEntity();
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        final errorMessage =
            error?['message'] as String? ?? 'Failed to submit feedback';
        debugPrint(
            '[FeedbackService] Submit feedback failed: $errorMessage ($errorCode)');
        throw FeedbackException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is FeedbackException) rethrow;
      debugPrint('[FeedbackService] Network error: $e');
      throw FeedbackException('Network error: ${e.toString()}',
          code: 'NETWORK_ERROR');
    }
  }
}
