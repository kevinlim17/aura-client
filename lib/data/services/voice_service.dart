import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

/// Recording state
enum RecordingState {
  idle,
  recording,
  paused,
  stopped,
}

/// Voice upload response
class VoiceUploadResponse {
  final String voiceUrl;
  final int durationSeconds;
  final int fileSizeBytes;

  VoiceUploadResponse({
    required this.voiceUrl,
    required this.durationSeconds,
    required this.fileSizeBytes,
  });

  factory VoiceUploadResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;

    return VoiceUploadResponse(
      voiceUrl: data['voiceUrl'] as String,
      durationSeconds: data['durationSeconds'] as int? ?? 0,
      fileSizeBytes: data['fileSizeBytes'] as int? ?? 0,
    );
  }
}

/// Voice recording and upload service
class VoiceService {
  final String baseUrl;
  final http.Client client;
  final AudioRecorder _recorder = AudioRecorder();

  RecordingState _state = RecordingState.idle;
  String? _currentRecordingPath;
  DateTime? _recordingStartTime;

  VoiceService({required this.baseUrl, http.Client? client})
      : client = client ?? http.Client();

  /// Get current recording state
  RecordingState get state => _state;

  /// Get current recording duration
  Duration get currentDuration {
    if (_recordingStartTime == null) return Duration.zero;
    return DateTime.now().difference(_recordingStartTime!);
  }

  /// Check if microphone permission is granted
  Future<bool> hasPermission() async {
    return await _recorder.hasPermission();
  }

  /// Request microphone permission
  Future<bool> requestPermission() async {
    return await _recorder.hasPermission();
  }

  /// Start recording
  Future<void> startRecording() async {
    if (_state == RecordingState.recording) {
      debugPrint('[VoiceService] Already recording');
      return;
    }

    final hasPermission = await this.hasPermission();
    if (!hasPermission) {
      throw VoiceException(
        'Microphone permission not granted',
        code: 'PERMISSION_DENIED',
      );
    }

    try {
      // Get temporary directory for recording
      final tempDir = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      _currentRecordingPath = '${tempDir.path}/recording_$timestamp.m4a';

      debugPrint('[VoiceService] Starting recording to: $_currentRecordingPath');

      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: _currentRecordingPath!,
      );

      _state = RecordingState.recording;
      _recordingStartTime = DateTime.now();

      debugPrint('[VoiceService] Recording started');
    } catch (e) {
      debugPrint('[VoiceService] Failed to start recording: $e');
      throw VoiceException(
        'Failed to start recording: ${e.toString()}',
        code: 'RECORDING_FAILED',
      );
    }
  }

  /// Pause recording
  Future<void> pauseRecording() async {
    if (_state != RecordingState.recording) {
      debugPrint('[VoiceService] Not recording, cannot pause');
      return;
    }

    try {
      await _recorder.pause();
      _state = RecordingState.paused;
      debugPrint('[VoiceService] Recording paused');
    } catch (e) {
      debugPrint('[VoiceService] Failed to pause recording: $e');
      throw VoiceException(
        'Failed to pause recording: ${e.toString()}',
        code: 'PAUSE_FAILED',
      );
    }
  }

  /// Resume recording
  Future<void> resumeRecording() async {
    if (_state != RecordingState.paused) {
      debugPrint('[VoiceService] Not paused, cannot resume');
      return;
    }

    try {
      await _recorder.resume();
      _state = RecordingState.recording;
      debugPrint('[VoiceService] Recording resumed');
    } catch (e) {
      debugPrint('[VoiceService] Failed to resume recording: $e');
      throw VoiceException(
        'Failed to resume recording: ${e.toString()}',
        code: 'RESUME_FAILED',
      );
    }
  }

  /// Stop recording and return the file path
  Future<String> stopRecording() async {
    if (_state == RecordingState.idle) {
      debugPrint('[VoiceService] Not recording, cannot stop');
      throw VoiceException(
        'No active recording to stop',
        code: 'NO_RECORDING',
      );
    }

    try {
      final path = await _recorder.stop();
      _state = RecordingState.stopped;

      if (path == null || path.isEmpty) {
        throw VoiceException(
          'Recording path is empty',
          code: 'INVALID_PATH',
        );
      }

      debugPrint('[VoiceService] Recording stopped: $path');

      final recordingPath = _currentRecordingPath ?? path;
      _currentRecordingPath = null;
      _recordingStartTime = null;

      return recordingPath;
    } catch (e) {
      debugPrint('[VoiceService] Failed to stop recording: $e');
      _currentRecordingPath = null;
      _recordingStartTime = null;
      if (e is VoiceException) rethrow;
      throw VoiceException(
        'Failed to stop recording: ${e.toString()}',
        code: 'STOP_FAILED',
      );
    }
  }

  /// Cancel recording and delete the file
  Future<void> cancelRecording() async {
    if (_state == RecordingState.idle) {
      debugPrint('[VoiceService] Not recording, cannot cancel');
      return;
    }

    try {
      await _recorder.stop();
      _state = RecordingState.idle;

      // Delete the recording file
      if (_currentRecordingPath != null) {
        final file = File(_currentRecordingPath!);
        if (await file.exists()) {
          await file.delete();
          debugPrint('[VoiceService] Recording file deleted');
        }
      }

      _currentRecordingPath = null;
      _recordingStartTime = null;

      debugPrint('[VoiceService] Recording cancelled');
    } catch (e) {
      debugPrint('[VoiceService] Failed to cancel recording: $e');
      _currentRecordingPath = null;
      _recordingStartTime = null;
    }
  }

  /// Upload voice file to server
  Future<VoiceUploadResponse> uploadVoiceFile({
    required String token,
    required String filePath,
  }) async {
    final url = '$baseUrl/api/voice/upload';
    debugPrint('[VoiceService] POST $url');

    try {
      final file = File(filePath);
      if (!await file.exists()) {
        throw VoiceException(
          'Voice file does not exist: $filePath',
          code: 'FILE_NOT_FOUND',
        );
      }

      final fileBytes = await file.readAsBytes();
      final fileName = filePath.split('/').last;

      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['Authorization'] = 'Bearer $token';
      request.files.add(
        http.MultipartFile.fromBytes(
          'voice',
          fileBytes,
          filename: fileName,
        ),
      );

      debugPrint('[VoiceService] Uploading file: $fileName (${fileBytes.length} bytes)');

      final streamedResponse = await client.send(request);
      final response = await http.Response.fromStream(streamedResponse);

      debugPrint('[VoiceService] Upload response status: ${response.statusCode}');
      debugPrint('[VoiceService] Upload response body: ${response.body}');

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        debugPrint('[VoiceService] Voice file uploaded successfully');
        return VoiceUploadResponse.fromJson(responseData);
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        final errorMessage =
            error?['message'] as String? ?? 'Failed to upload voice file';

        debugPrint('[VoiceService] Upload failed: $errorMessage ($errorCode)');
        throw VoiceException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is VoiceException) rethrow;
      debugPrint('[VoiceService] Network error: $e');
      throw VoiceException(
        'Network error: ${e.toString()}',
        code: 'NETWORK_ERROR',
      );
    }
  }

  /// Dispose resources
  Future<void> dispose() async {
    if (_state != RecordingState.idle) {
      await cancelRecording();
    }
    _recorder.dispose();
  }
}

/// Custom exception for voice errors
class VoiceException implements Exception {
  final String message;
  final String? code;

  VoiceException(this.message, {this.code});

  @override
  String toString() =>
      'VoiceException: $message${code != null ? ' ($code)' : ''}';
}
