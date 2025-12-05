import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/context_entity.dart';

/// Response model for context creation
class CreateContextResponse {
  final ContextEntity context;
  final String message;

  CreateContextResponse({
    required this.context,
    required this.message,
  });

  factory CreateContextResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;

    return CreateContextResponse(
      context: ContextEntity.fromJson(data['context'] as Map<String, dynamic>),
      message: json['message'] as String? ?? 'Context created successfully',
    );
  }
}

/// Response model for emotion tags recommendation
class EmotionTagsResponse {
  final List<String> recommendedTags;
  final double confidence;

  EmotionTagsResponse({
    required this.recommendedTags,
    required this.confidence,
  });

  factory EmotionTagsResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;

    return EmotionTagsResponse(
      recommendedTags: (data['recommendedTags'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      confidence: (data['confidence'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

/// Response model for voice transcription
class TranscriptionResponse {
  final String text;
  final double confidence;
  final int durationSeconds;

  TranscriptionResponse({
    required this.text,
    required this.confidence,
    required this.durationSeconds,
  });

  factory TranscriptionResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;

    return TranscriptionResponse(
      text: data['text'] as String,
      confidence: (data['confidence'] as num?)?.toDouble() ?? 0.0,
      durationSeconds: data['durationSeconds'] as int? ?? 0,
    );
  }
}

/// Context service for API calls
class ContextService {
  final String baseUrl;
  final http.Client client;

  ContextService({required this.baseUrl, http.Client? client})
      : client = client ?? http.Client();

  /// Create a new context
  Future<CreateContextResponse> createContext({
    required String token,
    required int userId,
    required CreateContextRequest request,
  }) async {
    final url = '$baseUrl/api/users/$userId/contexts';
    debugPrint('[ContextService] POST $url');

    try {
      final response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(request.toJson()),
      );

      debugPrint('[ContextService] Response status: ${response.statusCode}');
      debugPrint('[ContextService] Response body: ${response.body}');

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 201 && responseData['success'] == true) {
        debugPrint('[ContextService] Context created successfully');
        return CreateContextResponse.fromJson(responseData);
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        var errorMessage =
            error?['message'] as String? ?? 'Failed to create context';

        if (response.statusCode == 422) {
          final details = error?['details'] as Map<String, dynamic>?;
          if (details != null) {
            errorMessage =
                details.entries.map((e) => '${e.key}: ${e.value}').join('\n');
          }
        }

        debugPrint(
            '[ContextService] Create context failed: $errorMessage ($errorCode)');
        throw ContextException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is ContextException) rethrow;
      debugPrint('[ContextService] Network error: $e');
      throw ContextException('Network error: ${e.toString()}',
          code: 'NETWORK_ERROR');
    }
  }

  /// Get recommended emotion tags based on content
  Future<EmotionTagsResponse> getRecommendedEmotionTags({
    required String token,
    required String content,
  }) async {
    final url = '$baseUrl/api/contexts/emotion-tags/recommend';
    debugPrint('[ContextService] POST $url');

    try {
      final response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'content': content}),
      );

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        debugPrint('[ContextService] Emotion tags recommended successfully');
        return EmotionTagsResponse.fromJson(responseData);
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        final errorMessage = error?['message'] as String? ??
            'Failed to get emotion tags recommendation';

        debugPrint(
            '[ContextService] Emotion tags recommendation failed: $errorMessage ($errorCode)');
        throw ContextException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is ContextException) rethrow;
      debugPrint('[ContextService] Network error: $e');
      throw ContextException('Network error: ${e.toString()}',
          code: 'NETWORK_ERROR');
    }
  }

  /// Transcribe voice to text
  Future<TranscriptionResponse> transcribeVoice({
    required String token,
    required String voiceUrl,
  }) async {
    final url = '$baseUrl/api/voice/transcribe';
    debugPrint('[ContextService] POST $url');

    try {
      final response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'voiceUrl': voiceUrl}),
      );

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        debugPrint('[ContextService] Voice transcribed successfully');
        return TranscriptionResponse.fromJson(responseData);
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        final errorMessage =
            error?['message'] as String? ?? 'Failed to transcribe voice';

        debugPrint(
            '[ContextService] Voice transcription failed: $errorMessage ($errorCode)');
        throw ContextException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is ContextException) rethrow;
      debugPrint('[ContextService] Network error: $e');
      throw ContextException('Network error: ${e.toString()}',
          code: 'NETWORK_ERROR');
    }
  }

  /// Get user contexts with pagination
  Future<List<ContextEntity>> getUserContexts({
    required String token,
    required int userId,
    int page = 1,
    int limit = 20,
    ContextType? contextType,
  }) async {
    final queryParams = {
      'page': page.toString(),
      'limit': limit.toString(),
      if (contextType != null) 'contextType': contextType.name.toUpperCase(),
    };

    final uri = Uri.parse('$baseUrl/api/users/$userId/contexts')
        .replace(queryParameters: queryParams);
    debugPrint('[ContextService] GET $uri');

    try {
      final response = await client.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        final data = responseData['data'] as Map<String, dynamic>;
        final contexts = (data['contexts'] as List<dynamic>)
            .map((e) => ContextEntity.fromJson(e as Map<String, dynamic>))
            .toList();

        debugPrint('[ContextService] Fetched ${contexts.length} contexts');
        return contexts;
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        final errorMessage =
            error?['message'] as String? ?? 'Failed to fetch contexts';

        debugPrint(
            '[ContextService] Fetch contexts failed: $errorMessage ($errorCode)');
        throw ContextException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is ContextException) rethrow;
      debugPrint('[ContextService] Network error: $e');
      throw ContextException('Network error: ${e.toString()}',
          code: 'NETWORK_ERROR');
    }
  }

  /// Get a single context by ID
  Future<ContextEntity> getContextById({
    required String token,
    required int userId,
    required int contextId,
  }) async {
    final url = '$baseUrl/api/users/$userId/contexts/$contextId';
    debugPrint('[ContextService] GET $url');

    try {
      final response = await client.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        final data = responseData['data'] as Map<String, dynamic>;
        final context = ContextEntity.fromJson(data['context'] as Map<String, dynamic>);

        debugPrint('[ContextService] Fetched context: $contextId');
        return context;
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        final errorMessage =
            error?['message'] as String? ?? 'Failed to fetch context';

        debugPrint(
            '[ContextService] Fetch context failed: $errorMessage ($errorCode)');
        throw ContextException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is ContextException) rethrow;
      debugPrint('[ContextService] Network error: $e');
      throw ContextException('Network error: ${e.toString()}',
          code: 'NETWORK_ERROR');
    }
  }

  /// Update a context
  Future<ContextEntity> updateContext({
    required String token,
    required int userId,
    required int contextId,
    required CreateContextRequest request,
  }) async {
    final url = '$baseUrl/api/users/$userId/contexts/$contextId';
    debugPrint('[ContextService] PUT $url');

    try {
      final response = await client.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(request.toJson()),
      );

      debugPrint('[ContextService] Response status: ${response.statusCode}');
      debugPrint('[ContextService] Response body: ${response.body}');

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        final data = responseData['data'] as Map<String, dynamic>;
        final context = ContextEntity.fromJson(data['context'] as Map<String, dynamic>);

        debugPrint('[ContextService] Context updated successfully');
        return context;
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        var errorMessage =
            error?['message'] as String? ?? 'Failed to update context';

        if (response.statusCode == 422) {
          final details = error?['details'] as Map<String, dynamic>?;
          if (details != null) {
            errorMessage =
                details.entries.map((e) => '${e.key}: ${e.value}').join('\n');
          }
        }

        debugPrint(
            '[ContextService] Update context failed: $errorMessage ($errorCode)');
        throw ContextException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is ContextException) rethrow;
      debugPrint('[ContextService] Network error: $e');
      throw ContextException('Network error: ${e.toString()}',
          code: 'NETWORK_ERROR');
    }
  }

  /// Delete a context
  Future<void> deleteContext({
    required String token,
    required int userId,
    required int contextId,
  }) async {
    final url = '$baseUrl/api/users/$userId/contexts/$contextId';
    debugPrint('[ContextService] DELETE $url');

    try {
      final response = await client.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        debugPrint('[ContextService] Context deleted successfully');
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        final errorMessage =
            error?['message'] as String? ?? 'Failed to delete context';

        debugPrint(
            '[ContextService] Delete context failed: $errorMessage ($errorCode)');
        throw ContextException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is ContextException) rethrow;
      debugPrint('[ContextService] Network error: $e');
      throw ContextException('Network error: ${e.toString()}',
          code: 'NETWORK_ERROR');
    }
  }
}

/// Custom exception for context errors
class ContextException implements Exception {
  final String message;
  final String? code;

  ContextException(this.message, {this.code});

  @override
  String toString() =>
      'ContextException: $message${code != null ? ' ($code)' : ''}';
}
