import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/auth_state.dart';
import '../entities/user_entity.dart';
import '../../data/repositories/auth_repository.dart';
import '../../core/accessibility/tts_service.dart';

/// AuthNotifier manages authentication state and transitions
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final TtsService _ttsService;
  Timer? _tokenRefreshTimer;
  Timer? _sessionCheckTimer;

  AuthNotifier({
    required AuthRepository authRepository,
    required TtsService ttsService,
  })  : _authRepository = authRepository,
        _ttsService = ttsService,
        super(const AuthState.initial()) {
    // Initialize TTS
    _ttsService.initialize();
    // Start automatic session check
    _startSessionCheck();
  }

  /// Login with email and password
  Future<void> login({
    required String email,
    required String password,
    bool enableTts = true,
  }) async {
    // Set loading state
    state = const AuthState.loading();

    // TTS feedback for visually impaired users
    if (enableTts) {
      await _ttsService.speak(AuthTtsMessages.loginStart);
    }

    // Perform login
    final result = await _authRepository.login(
      email: email,
      password: password,
    );

    if (result.isSuccess && result.data != null) {
      final user = result.data!;
      final token = _authRepository.getToken()!;
      final tokenExpiry = _authRepository.getTokenExpiry()!;

      // Set authenticated state
      state = AuthState.authenticated(
        user: user,
        token: token,
        tokenExpiry: tokenExpiry,
      );

      // TTS feedback
      if (enableTts && user.requiresTts) {
        await _ttsService.speak(AuthTtsMessages.loginSuccess);
      }

      // Schedule token refresh
      _scheduleTokenRefresh(tokenExpiry);
    } else {
      // Set error state
      state = AuthState.error(
        message: result.error ?? 'Login failed',
        errorCode: result.errorCode,
      );

      // TTS feedback
      if (enableTts) {
        await _ttsService.speak(
          result.errorCode == 'NETWORK_ERROR'
              ? AuthTtsMessages.networkError()
              : AuthTtsMessages.loginFailed,
        );
      }
    }
  }

  /// Register new user
  Future<void> register({
    required String email,
    required String password,
    required String name,
    required bool isVisuallyImpaired,
    required DisabilitySeverity disabilitySeverity,
    bool enableTts = true,
  }) async {
    // Set loading state
    state = const AuthState.loading();

    // TTS feedback
    if (enableTts) {
      await _ttsService.speak(AuthTtsMessages.registerStart);
    }

    // Perform registration
    final result = await _authRepository.register(
      email: email,
      password: password,
      name: name,
      isVisuallyImpaired: isVisuallyImpaired,
      disabilitySeverity: disabilitySeverity,
    );

    if (result.isSuccess && result.data != null) {
      final user = result.data!;
      final token = _authRepository.getToken()!;
      final tokenExpiry = _authRepository.getTokenExpiry()!;

      // Set authenticated state
      state = AuthState.authenticated(
        user: user,
        token: token,
        tokenExpiry: tokenExpiry,
      );

      // TTS feedback
      if (enableTts && user.requiresTts) {
        await _ttsService.speak(AuthTtsMessages.registerSuccess);
      }

      // Schedule token refresh
      _scheduleTokenRefresh(tokenExpiry);
    } else {
      // Set error state
      state = AuthState.error(
        message: result.error ?? 'Registration failed',
        errorCode: result.errorCode,
      );

      // TTS feedback
      if (enableTts) {
        await _ttsService.speak(
          result.errorCode == 'NETWORK_ERROR'
              ? AuthTtsMessages.networkError()
              : AuthTtsMessages.registerFailed,
        );
      }
    }
  }

  /// Auto-login on app start
  Future<void> autoLogin({bool enableTts = true}) async {
    // Set loading state
    state = const AuthState.loading();

    // TTS feedback
    if (enableTts) {
      await _ttsService.speak(AuthTtsMessages.autoLoginStart);
    }

    // Attempt auto-login
    final result = await _authRepository.autoLogin();

    if (result.isSuccess && result.data != null) {
      final user = result.data!;
      final token = _authRepository.getToken()!;
      final tokenExpiry = _authRepository.getTokenExpiry()!;

      // Set authenticated state
      state = AuthState.authenticated(
        user: user,
        token: token,
        tokenExpiry: tokenExpiry,
      );

      // TTS feedback
      if (enableTts && user.requiresTts) {
        await _ttsService.speak(AuthTtsMessages.loginSuccess);
      }

      // Schedule token refresh
      _scheduleTokenRefresh(tokenExpiry);
    } else {
      // Set unauthenticated state (not an error, just not logged in)
      state = const AuthState.unauthenticated();

      // TTS feedback (only if specifically requested)
      if (enableTts && debugMode) {
        await _ttsService.speak(AuthTtsMessages.autoLoginFailed);
      }
    }
  }

  /// Logout
  Future<void> logout({bool enableTts = true}) async {
    // Get current user for TTS check
    final currentUser = state.user;

    // Set loading state
    state = const AuthState.loading();

    // TTS feedback
    if (enableTts && currentUser?.requiresTts == true) {
      await _ttsService.speak(AuthTtsMessages.logoutStart);
    }

    // Perform logout
    await _authRepository.logout();

    // Cancel timers
    _cancelTokenRefresh();
    _cancelSessionCheck();

    // Set unauthenticated state
    state = const AuthState.unauthenticated();

    // TTS feedback
    if (enableTts && currentUser?.requiresTts == true) {
      await _ttsService.speak(AuthTtsMessages.logoutSuccess);
    }
  }

  /// Refresh authentication token
  Future<void> refreshToken({bool enableTts = false}) async {
    final result = await _authRepository.refreshToken();

    if (result.isSuccess && result.data != null) {
      final user = result.data!;
      final token = _authRepository.getToken()!;
      final tokenExpiry = _authRepository.getTokenExpiry()!;

      // Update state
      state = AuthState.authenticated(
        user: user,
        token: token,
        tokenExpiry: tokenExpiry,
      );

      // TTS feedback (usually silent)
      if (enableTts && user.requiresTts) {
        await _ttsService.speak(AuthTtsMessages.tokenRefreshed);
      }

      // Reschedule refresh
      _scheduleTokenRefresh(tokenExpiry);
    } else {
      // Token refresh failed, log out
      state = AuthState.error(
        message: result.error ?? 'Session expired',
        errorCode: 'SESSION_EXPIRED',
      );

      // TTS feedback
      if (enableTts) {
        await _ttsService.speak(AuthTtsMessages.sessionExpired);
      }

      // Clear auth data
      await _authRepository.logout();

      // Set unauthenticated
      state = const AuthState.unauthenticated();
    }
  }

  /// Schedule automatic token refresh
  void _scheduleTokenRefresh(DateTime tokenExpiry) {
    _cancelTokenRefresh();

    // Refresh 5 minutes before expiry
    final refreshTime = tokenExpiry.subtract(const Duration(minutes: 5));
    final now = DateTime.now();

    if (refreshTime.isAfter(now)) {
      final delay = refreshTime.difference(now);
      _tokenRefreshTimer = Timer(delay, () {
        refreshToken(enableTts: false);
      });
      debugPrint('Token refresh scheduled for $refreshTime');
    } else {
      // Token expires soon, refresh immediately
      debugPrint('Token expires soon, refreshing immediately');
      refreshToken(enableTts: false);
    }
  }

  /// Cancel token refresh timer
  void _cancelTokenRefresh() {
    _tokenRefreshTimer?.cancel();
    _tokenRefreshTimer = null;
  }

  /// Start periodic session check
  void _startSessionCheck() {
    _sessionCheckTimer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => _checkSession(),
    );
  }

  /// Check session validity
  void _checkSession() {
    if (state.isAuthenticated && state.isTokenExpired) {
      debugPrint('Session expired, attempting refresh');
      refreshToken(enableTts: true);
    }
  }

  /// Cancel session check timer
  void _cancelSessionCheck() {
    _sessionCheckTimer?.cancel();
    _sessionCheckTimer = null;
  }

  /// Debug mode flag
  bool get debugMode => kDebugMode;

  @override
  void dispose() {
    _cancelTokenRefresh();
    _cancelSessionCheck();
    _ttsService.dispose();
    super.dispose();
  }
}
