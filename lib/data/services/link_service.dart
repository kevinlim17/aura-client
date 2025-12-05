import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/link_entity.dart';
import '../models/link_response.dart';

/// Link service for API calls
class LinkService {
  final String baseUrl;
  final http.Client client;

  LinkService({required this.baseUrl, http.Client? client})
      : client = client ?? http.Client();

  /// Create a new link
  Future<LinkEntity> createLink({
    required String userId,
    required String token,
    required String url,
    String? title,
    String? description,
    String? linkType,
    int? artworkId,
    int? docentSessionId,
    Map<String, dynamic>? metadata,
    String? thumbnailUrl,
    bool? hasAudioDescription,
    bool? hasSubtitles,
  }) async {
    final endpoint = '$baseUrl/api/users/$userId/links';
    debugPrint('[LinkService] POST $endpoint');

    try {
      final requestBody = {
        'url': url,
        if (title != null) 'title': title,
        if (description != null) 'description': description,
        if (linkType != null) 'linkType': linkType,
        if (artworkId != null) 'artworkId': artworkId,
        if (docentSessionId != null) 'docentSessionId': docentSessionId,
        if (metadata != null) 'metadata': metadata,
        if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
        if (hasAudioDescription != null)
          'hasAudioDescription': hasAudioDescription,
        if (hasSubtitles != null) 'hasSubtitles': hasSubtitles,
      };

      debugPrint('[LinkService] Request body: ${jsonEncode(requestBody)}');

      final response = await client.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );

      debugPrint('[LinkService] Response status: ${response.statusCode}');
      debugPrint('[LinkService] Response body: ${response.body}');

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 201 && responseData['success'] == true) {
        debugPrint('[LinkService] Link created successfully');
        final apiResponse = LinkApiResponse.fromJson(responseData);
        return apiResponse.toEntity();
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        final errorMessage =
            error?['message'] as String? ?? 'Failed to create link';
        debugPrint(
            '[LinkService] Create link failed: $errorMessage ($errorCode)');
        throw LinkException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is LinkException) rethrow;
      debugPrint('[LinkService] Network error: $e');
      throw LinkException('Network error: ${e.toString()}',
          code: 'NETWORK_ERROR');
    }
  }
}