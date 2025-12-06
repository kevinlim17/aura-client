import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/accessibility/native_tts_file_service.dart';

/// Provider for native TTS file service
final nativeTtsFileServiceProvider = Provider<NativeTtsFileService>((ref) {
  return NativeTtsFileService();
});