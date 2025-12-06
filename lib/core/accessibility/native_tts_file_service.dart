import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Native TTS file service using platform-specific TTS engines
///
/// This service uses Method Channels to communicate with native platform code
/// to generate audio files from text using the device's built-in TTS engine.
class NativeTtsFileService {
  static const MethodChannel _channel = MethodChannel('com.aura.tts/file');

  /// Synthesize text to audio file using native TTS
  ///
  /// Parameters:
  /// - [text]: The text to synthesize
  /// - [filename]: Output filename (without extension)
  /// - [language]: Language code (e.g., 'ko-KR', 'en-US')
  /// - [pitch]: Voice pitch (0.5 to 2.0, default 1.0)
  /// - [rate]: Speech rate (0.5 to 2.0, default 1.0)
  ///
  /// Returns:
  /// - The absolute file path to the generated audio file
  /// - null if synthesis failed or platform not supported
  Future<String?> synthesizeToFile({
    required String text,
    required String filename,
    String language = 'ko-KR',
    double pitch = 1.0,
    double rate = 1.0,
  }) async {
    try {
      // Only Android is supported for now
      if (!Platform.isAndroid) {
        debugPrint('[NativeTtsFileService] Only Android is supported');
        return null;
      }

      debugPrint('[NativeTtsFileService] Synthesizing text to file: $filename');
      debugPrint('[NativeTtsFileService] Text length: ${text.length} chars');
      debugPrint('[NativeTtsFileService] Language: $language, Pitch: $pitch, Rate: $rate');

      final Map<String, dynamic> arguments = {
        'text': text,
        'filename': filename,
        'language': language,
        'pitch': pitch,
        'rate': rate,
      };

      final String? filePath = await _channel.invokeMethod<String>(
        'synthesizeToFile',
        arguments,
      );

      if (filePath != null) {
        debugPrint('[NativeTtsFileService] File generated successfully: $filePath');

        // Verify file exists
        final file = File(filePath);
        if (await file.exists()) {
          final fileSize = await file.length();
          debugPrint('[NativeTtsFileService] File size: ${fileSize / 1024} KB');
          return filePath;
        } else {
          debugPrint('[NativeTtsFileService] File does not exist: $filePath');
          return null;
        }
      } else {
        debugPrint('[NativeTtsFileService] Synthesis returned null');
        return null;
      }
    } on PlatformException catch (e) {
      debugPrint('[NativeTtsFileService] Platform error: ${e.code} - ${e.message}');
      return null;
    } catch (e) {
      debugPrint('[NativeTtsFileService] Error: $e');
      return null;
    }
  }

  /// Check if TTS is available on the device
  Future<bool> isTtsAvailable() async {
    try {
      if (!Platform.isAndroid) return false;

      final bool? available = await _channel.invokeMethod<bool>('isTtsAvailable');
      return available ?? false;
    } catch (e) {
      debugPrint('[NativeTtsFileService] Error checking TTS availability: $e');
      return false;
    }
  }

  /// Get list of available voices for a language
  Future<List<String>> getAvailableVoices(String language) async {
    try {
      if (!Platform.isAndroid) return [];

      final List<dynamic>? voices = await _channel.invokeMethod<List<dynamic>>(
        'getAvailableVoices',
        {'language': language},
      );

      return voices?.cast<String>() ?? [];
    } catch (e) {
      debugPrint('[NativeTtsFileService] Error getting voices: $e');
      return [];
    }
  }

  /// Estimate duration in seconds based on text length
  /// Korean: ~300 characters per minute
  /// English: ~150 words per minute (~750 characters)
  int estimateDuration(String text, {String language = 'ko-KR'}) {
    final charCount = text.length;

    if (language.startsWith('ko')) {
      // Korean: 300 chars/min
      return (charCount / 300 * 60).ceil();
    } else {
      // English and others: 750 chars/min
      return (charCount / 750 * 60).ceil();
    }
  }
}