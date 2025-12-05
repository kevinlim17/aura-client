import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/auth_state.dart';
import '../entities/user_entity.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/services/auth_service.dart';
import '../../core/accessibility/tts_service.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final TtsService _ttsService;

  AuthNotifier({
    required AuthRepository authRepository,
    required TtsService ttsService,
  })  : _authRepository = authRepository,
        _ttsService = ttsService,
        super(const AuthState.initial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();

    final result = await _authRepository.login(email: email, password: password);

    if (result.isSuccess) {
      _setAuthenticated(result.data!);
      await _ttsService.speak('로그인 성공했습니다.');
    } else {
      _setError(result.error!);
      await _ttsService.speak('로그인 실패: ${result.error!.message}');
    }
  }

  Future<void> register({
    required String email,
    required String password,
    String userType = 'MAIN_USER',
    bool isVisuallyImpaired = true,
    String impairmentLevel = 'TOTAL_BLINDNESS',
  }) async {
    state = const AuthState.loading();

    final result = await _authRepository.register(
      email: email,
      password: password,
      userType: userType,
      isVisuallyImpaired: isVisuallyImpaired,
      impairmentLevel: impairmentLevel,
    );

    if (result.isSuccess) {
      _setAuthenticated(result.data!);
      if (isVisuallyImpaired) {
        await _ttsService.speak('회원가입 성공했습니다. 온보딩을 시작합니다.');
      }
    } else {
      _setError(result.error!);
      if (isVisuallyImpaired) {
        await _ttsService.speak('회원가입 실패: ${result.error!.message}');
      }
    }
  }

  Future<void> autoLogin() async {
    state = const AuthState.loading();
    final user = await _authRepository.autoLogin();
    if (user != null) {
      _setAuthenticated(user);
    } else {
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> logout() async {
    await _authRepository.logout();
    state = const AuthState.unauthenticated();
  }

  void _setAuthenticated(UserEntity user) {
    final accessToken = _authRepository.getToken();
    if (accessToken == null) {
      state = AuthState.error(AuthException('Failed to get token after login'));
      return;
    }
    state = AuthState.authenticated(user: user, accessToken: accessToken);
  }

  void _setError(AuthException error) {
    state = AuthState.error(error);
  }
}
