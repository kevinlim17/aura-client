import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

/// TTS (Text-to-Speech) Service for accessibility
class TtsService {
  final FlutterTts _tts = FlutterTts();
  bool _isInitialized = false;
  bool _isSpeaking = false;

  // Default settings
  double _speechRate = 0.5; // 0.5 ~ 2.0
  double _pitch = 1.0; // 0.5 ~ 2.0
  String _voice = 'ko-KR'; // Default Korean

  // Progress tracking
  Timer? _progressTimer;
  DateTime? _speechStartTime;
  int? _estimatedDurationSeconds;
  Function(int currentSeconds, int totalSeconds)? _onProgressUpdate;
  Function()? _onComplete;

  /// Initialize TTS with default settings
  Future<void> initialize({
    double? speechRate,
    double? pitch,
    String? voice,
  }) async {
    if (_isInitialized) return;

    try {
      // Set language
      await _tts.setLanguage(voice ?? _voice);

      // Set speech rate
      await _tts.setSpeechRate(speechRate ?? _speechRate);

      // Set pitch
      await _tts.setPitch(pitch ?? _pitch);

      // Set completion handler
      _tts.setCompletionHandler(() {
        _isSpeaking = false;
        _stopProgressTracking();
        _onComplete?.call();
      });

      // Set error handler
      _tts.setErrorHandler((msg) {
        debugPrint('TTS Error: $msg');
        _isSpeaking = false;
        _stopProgressTracking();
      });

      _isInitialized = true;
      debugPrint('TTS Service initialized');
    } catch (e) {
      debugPrint('Failed to initialize TTS: $e');
    }
  }

  /// Speak text with TTS
  Future<void> speak(String text, {bool interrupt = false}) async {
    if (!_isInitialized) {
      await initialize();
    }

    if (text.isEmpty) return;

    try {
      // Stop current speech if interrupt is true
      if (interrupt && _isSpeaking) {
        await stop();
      }

      // Wait if currently speaking and not interrupting
      if (_isSpeaking && !interrupt) {
        return;
      }

      _isSpeaking = true;
      await _tts.speak(text);
    } catch (e) {
      debugPrint('Failed to speak: $e');
      _isSpeaking = false;
    }
  }

  /// Stop current speech
  Future<void> stop() async {
    try {
      await _tts.stop();
      _isSpeaking = false;
    } catch (e) {
      debugPrint('Failed to stop TTS: $e');
    }
  }

  /// Pause current speech
  Future<void> pause() async {
    try {
      await _tts.pause();
    } catch (e) {
      debugPrint('Failed to pause TTS: $e');
    }
  }

  /// Update speech rate (0.5 ~ 2.0)
  Future<void> setSpeechRate(double rate) async {
    _speechRate = rate.clamp(0.5, 2.0);
    await _tts.setSpeechRate(_speechRate);
  }

  /// Update pitch (0.5 ~ 2.0)
  Future<void> setPitch(double pitch) async {
    _pitch = pitch.clamp(0.5, 2.0);
    await _tts.setPitch(_pitch);
  }

  /// Update voice/language
  Future<void> setVoice(String voice) async {
    _voice = voice;
    await _tts.setLanguage(_voice);
  }

  /// Get available voices
  Future<List<dynamic>> getAvailableVoices() async {
    try {
      return await _tts.getVoices ?? [];
    } catch (e) {
      debugPrint('Failed to get voices: $e');
      return [];
    }
  }

  /// Check if TTS is speaking
  bool get isSpeaking => _isSpeaking;

  /// Get current speech rate
  double get speechRate => _speechRate;

  /// Get current pitch
  double get pitch => _pitch;

  /// Get current voice
  String get voice => _voice;

  /// Speak with progress tracking
  Future<void> speakWithProgress(
    String text, {
    required int estimatedDurationSeconds,
    Function(int currentSeconds, int totalSeconds)? onProgressUpdate,
    Function()? onComplete,
  }) async {
    if (!_isInitialized) {
      await initialize();
    }

    if (text.isEmpty) return;

    try {
      // Stop current speech
      if (_isSpeaking) {
        await stop();
      }

      // Set progress callbacks
      _onProgressUpdate = onProgressUpdate;
      _onComplete = onComplete;
      _estimatedDurationSeconds = estimatedDurationSeconds;
      _speechStartTime = DateTime.now();

      // Start progress tracking
      _startProgressTracking();

      // Start TTS
      _isSpeaking = true;
      await _tts.speak(text);
    } catch (e) {
      debugPrint('Failed to speak with progress: $e');
      _isSpeaking = false;
      _stopProgressTracking();
    }
  }

  /// Start progress tracking timer
  void _startProgressTracking() {
    _stopProgressTracking();

    _progressTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_speechStartTime != null && _estimatedDurationSeconds != null) {
        final elapsed = DateTime.now().difference(_speechStartTime!).inSeconds;
        final total = _estimatedDurationSeconds!;

        // Don't exceed total duration
        final current = elapsed.clamp(0, total);

        _onProgressUpdate?.call(current, total);

        // Auto-stop timer if exceeded duration
        if (elapsed >= total) {
          timer.cancel();
        }
      }
    });
  }

  /// Stop progress tracking timer
  void _stopProgressTracking() {
    _progressTimer?.cancel();
    _progressTimer = null;
    _speechStartTime = null;
  }

  /// Get current playback position in seconds (estimated)
  int get currentPositionSeconds {
    if (_speechStartTime == null) return 0;
    return DateTime.now().difference(_speechStartTime!).inSeconds;
  }

  /// Dispose resources
  Future<void> dispose() async {
    _stopProgressTracking();
    await stop();
    _isInitialized = false;
  }
}

/// Authentication-specific TTS messages
class AuthTtsMessages {
  static const String loginStart = '로그인 중입니다. 잠시만 기다려주세요.';
  static const String loginSuccess = '로그인에 성공했습니다.';
  static const String loginFailed = '로그인에 실패했습니다. 다시 시도해주세요.';

  static const String registerStart = '회원가입을 진행합니다.';
  static const String registerSuccess = '회원가입이 완료되었습니다. 환영합니다!';
  static const String registerFailed = '회원가입에 실패했습니다. 다시 시도해주세요.';

  static const String logoutStart = '로그아웃 중입니다.';
  static const String logoutSuccess = '로그아웃되었습니다.';

  static const String sessionExpired = '세션이 만료되었습니다. 다시 로그인해주세요.';
  static const String tokenRefreshed = '세션이 갱신되었습니다.';

  static const String autoLoginStart = '자동 로그인 중입니다.';
  static const String autoLoginFailed = '자동 로그인에 실패했습니다.';

  static String emailError(String reason) => '이메일 입력 오류: $reason';
  static String passwordError(String reason) => '비밀번호 입력 오류: $reason';
  static String serverError(String message) => '서버 오류: $message';
  static String networkError() => '네트워크 연결을 확인해주세요.';
}

/// Singleton instance of TtsService
class TtsServiceSingleton {
  static TtsService? _instance;

  static TtsService get instance {
    _instance ??= TtsService();
    return _instance!;
  }

  /// Reset instance (useful for testing)
  static void reset() {
    _instance?.dispose();
    _instance = null;
  }
}
