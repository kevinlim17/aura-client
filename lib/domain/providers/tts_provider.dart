import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/accessibility/tts_service.dart';

/// TTS (Text-to-Speech) service provider
///
/// This provider offers a singleton instance of TtsService for the entire app.
/// It ensures that only one instance of TtsService is created and shared across the app.
final ttsServiceProvider = Provider<TtsService>((ref) {
  return TtsServiceSingleton.instance;
});
