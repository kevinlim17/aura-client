import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/memo_entity.dart';
import '../models/memo_response.dart';

/// Memo service for API calls
class MemoService {
  final String baseUrl;
  final http.Client client;

  MemoService({required this.baseUrl, http.Client? client})
      : client = client ?? http.Client();

  /// Create a new memo
  Future<MemoEntity> createMemo({
    required String userId,
    required String token,
    required String content,
    required String inputMethod,
    String? voiceUrl,
    int? voiceDurationSeconds,
    String? category,
    List<String>? tags,
    int? artworkId,
    int? docentSessionId,
    bool? isSharedWithCompanion,
  }) async {
    final endpoint = '$baseUrl/api/users/$userId/memos';
    debugPrint('[MemoService] POST $endpoint');

    try {
      final requestBody = {
        'content': content,
        'inputMethod': inputMethod,
        if (voiceUrl != null) 'voiceUrl': voiceUrl,
        if (voiceDurationSeconds != null)
          'voiceDurationSeconds': voiceDurationSeconds,
        if (category != null) 'category': category,
        if (tags != null) 'tags': tags,
        if (artworkId != null) 'artworkId': artworkId,
        if (docentSessionId != null) 'docentSessionId': docentSessionId,
        if (isSharedWithCompanion != null)
          'isSharedWithCompanion': isSharedWithCompanion,
      };

      debugPrint('[MemoService] Request body: ${jsonEncode(requestBody)}');

      final response = await client.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );

      debugPrint('[MemoService] Response status: ${response.statusCode}');
      debugPrint('[MemoService] Response body: ${response.body}');

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 201 && responseData['success'] == true) {
        debugPrint('[MemoService] Memo created successfully');
        final apiResponse = MemoApiResponse.fromJson(responseData);
        return apiResponse.toEntity();
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        final errorMessage =
            error?['message'] as String? ?? 'Failed to create memo';
        debugPrint(
            '[MemoService] Create memo failed: $errorMessage ($errorCode)');
        throw MemoException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is MemoException) rethrow;
      debugPrint('[MemoService] Network error: $e');
      throw MemoException('Network error: ${e.toString()}',
          code: 'NETWORK_ERROR');
    }
  }
}