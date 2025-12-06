import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/search_state.dart';
import '../models/search_response.dart';

/// Search service for artwork API calls
class SearchService {
  final String baseUrl;
  final http.Client client;

  SearchService({required this.baseUrl, http.Client? client})
      : client = client ?? http.Client();

  /// Search artworks by query
  /// POST /api/artworks/search
  Future<SearchApiResponse> searchArtworks({
    required String query,
    required String token,
    int page = 1,
    int limit = 10,
  }) async {
    final url = '$baseUrl/api/artworks/search';
    debugPrint('[SearchService] POST $url');
    debugPrint('[SearchService] Query: $query, Page: $page, Limit: $limit');

    try {
      final response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'query': query,
          'page': page,
          'limit': limit,
        }),
      );

      debugPrint('[SearchService] Response status: ${response.statusCode}');
      debugPrint('[SearchService] Response body: ${response.body}');

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        debugPrint('[SearchService] Search successful');
        return SearchApiResponse.fromJson(responseData);
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        final errorMessage =
            error?['message'] as String? ?? 'Failed to search artworks';
        debugPrint(
            '[SearchService] Search failed: $errorMessage ($errorCode)');
        throw SearchException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is SearchException) rethrow;
      debugPrint('[SearchService] Network error: $e');
      throw SearchException('Network error: ${e.toString()}',
          code: 'NETWORK_ERROR');
    }
  }
}