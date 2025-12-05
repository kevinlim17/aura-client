import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/preferences_entity.dart';
import '../entities/preferences_state.dart';
import '../../data/services/preferences_service.dart';
import '../../core/accessibility/tts_service.dart';

class PreferencesNotifier extends StateNotifier<PreferencesState> {
  final PreferencesService _preferencesService;
  final TtsService _ttsService;
  final String _userId;
  final String _token;

  PreferencesNotifier({
    required PreferencesService preferencesService,
    required TtsService ttsService,
    required String userId,
    required String token,
  })  : _preferencesService = preferencesService,
        _ttsService = ttsService,
        _userId = userId,
        _token = token,
        super(const PreferencesState.initial());

  /// Load preferences from API
  Future<void> loadPreferences() async {
    state = const PreferencesState.loading();

    try {
      final preferences = await _preferencesService.getPreferences(
        userId: _userId,
        token: _token,
      );
      state = PreferencesState.loaded(preferences: preferences);

      // Apply TTS settings
      await _applyTtsSettings(preferences);
    } catch (e) {
      if (e is PreferencesException) {
        state = PreferencesState.error(e);
      } else {
        state = PreferencesState.error(
          PreferencesException('Failed to load preferences: ${e.toString()}'),
        );
      }
    }
  }

  /// Save preferences (create or update)
  Future<void> savePreferences(PreferencesEntity preferences) async {
    state = const PreferencesState.loading();

    try {
      // Try to update first, if fails, create new
      PreferencesEntity savedPreferences;
      try {
        savedPreferences = await _preferencesService.updatePreferences(
          userId: _userId,
          token: _token,
          preferences: preferences,
        );
      } catch (e) {
        // If update fails, try create
        savedPreferences = await _preferencesService.createPreferences(
          userId: _userId,
          token: _token,
          preferences: preferences,
        );
      }

      state = PreferencesState.loaded(preferences: savedPreferences);

      // Apply TTS settings
      await _applyTtsSettings(savedPreferences);

      await _ttsService.speak('설정이 저장되었습니다.');
    } catch (e) {
      if (e is PreferencesException) {
        state = PreferencesState.error(e);
        await _ttsService.speak('설정 저장에 실패했습니다.');
      } else {
        state = PreferencesState.error(
          PreferencesException('Failed to save preferences: ${e.toString()}'),
        );
        await _ttsService.speak('설정 저장 중 오류가 발생했습니다.');
      }
    }
  }

  /// Update narrative style
  Future<void> updateNarrativeStyle(NarrativeStyle style) async {
    final currentPrefs = state.preferences ?? PreferencesEntity.defaults();
    final updatedPrefs = currentPrefs.copyWith(narrativeStyle: style);

    // Announce the change
    await _ttsService.speak('서사 스타일을 ${updatedPrefs.narrativeStyleDescription}로 변경했습니다.');

    // Update local state immediately for responsiveness
    state = PreferencesState.loaded(preferences: updatedPrefs);
  }

  /// Update preferred length
  Future<void> updatePreferredLength(PreferredLength length) async {
    final currentPrefs = state.preferences ?? PreferencesEntity.defaults();
    final updatedPrefs = currentPrefs.copyWith(preferredLength: length);

    await _ttsService.speak('길이 선호도를 ${updatedPrefs.preferredLengthDescription}로 변경했습니다.');
    state = PreferencesState.loaded(preferences: updatedPrefs);
  }

  /// Update TTS speed
  Future<void> updateTtsSpeed(double speed) async {
    final currentPrefs = state.preferences ?? PreferencesEntity.defaults();
    final updatedPrefs = currentPrefs.copyWith(ttsSpeed: speed);

    // Apply immediately to TTS service
    await _ttsService.setSpeechRate(speed);

    await _ttsService.speak('속도를 ${updatedPrefs.ttsSpeedDescription}로 변경했습니다.');
    state = PreferencesState.loaded(preferences: updatedPrefs);
  }

  /// Update TTS pitch
  Future<void> updateTtsPitch(double pitch) async {
    final currentPrefs = state.preferences ?? PreferencesEntity.defaults();
    final updatedPrefs = currentPrefs.copyWith(ttsPitch: pitch);

    // Apply immediately to TTS service
    await _ttsService.setPitch(pitch);

    await _ttsService.speak('음높이를 ${updatedPrefs.ttsPitchDescription}로 변경했습니다.');
    state = PreferencesState.loaded(preferences: updatedPrefs);
  }

  /// Update TTS voice
  Future<void> updateTtsVoice(TtsVoice voice) async {
    final currentPrefs = state.preferences ?? PreferencesEntity.defaults();
    final updatedPrefs = currentPrefs.copyWith(ttsVoice: voice);

    // Apply immediately to TTS service using preferred language
    await _ttsService.setVoice(currentPrefs.preferredLanguage);

    await _ttsService.speak('음성을 ${updatedPrefs.ttsVoiceDescription}로 변경했습니다.');
    state = PreferencesState.loaded(preferences: updatedPrefs);
  }

  /// Toggle haptic feedback
  Future<void> toggleHapticFeedback() async {
    final currentPrefs = state.preferences ?? PreferencesEntity.defaults();
    final updatedPrefs = currentPrefs.copyWith(
      enableHapticFeedback: !currentPrefs.enableHapticFeedback,
    );

    if (updatedPrefs.enableHapticFeedback) {
      HapticFeedback.mediumImpact();
      await _ttsService.speak('햅틱 피드백을 활성화했습니다.');
    } else {
      await _ttsService.speak('햅틱 피드백을 비활성화했습니다.');
    }

    state = PreferencesState.loaded(preferences: updatedPrefs);
  }

  /// Toggle audio descriptions
  Future<void> toggleAudioDescriptions() async {
    final currentPrefs = state.preferences ?? PreferencesEntity.defaults();
    final updatedPrefs = currentPrefs.copyWith(
      enableAudioDescriptions: !currentPrefs.enableAudioDescriptions,
    );

    await _ttsService.speak(
      updatedPrefs.enableAudioDescriptions
          ? '오디오 설명을 활성화했습니다.'
          : '오디오 설명을 비활성화했습니다.',
    );

    state = PreferencesState.loaded(preferences: updatedPrefs);
  }

  /// Toggle high contrast mode
  Future<void> toggleHighContrastMode() async {
    final currentPrefs = state.preferences ?? PreferencesEntity.defaults();
    final updatedPrefs = currentPrefs.copyWith(
      highContrastMode: !currentPrefs.highContrastMode,
    );

    await _ttsService.speak(
      updatedPrefs.highContrastMode
          ? '고대비 모드를 활성화했습니다.'
          : '고대비 모드를 비활성화했습니다.',
    );

    state = PreferencesState.loaded(preferences: updatedPrefs);
  }

  /// Toggle push notifications
  Future<void> togglePushNotifications() async {
    final currentPrefs = state.preferences ?? PreferencesEntity.defaults();
    final updatedPrefs = currentPrefs.copyWith(
      enablePushNotifications: !currentPrefs.enablePushNotifications,
    );

    await _ttsService.speak(
      updatedPrefs.enablePushNotifications
          ? '푸시 알림을 활성화했습니다.'
          : '푸시 알림을 비활성화했습니다.',
    );

    state = PreferencesState.loaded(preferences: updatedPrefs);
  }

  /// Play sample TTS
  Future<void> playSample() async {
    final currentPrefs = state.preferences ?? PreferencesEntity.defaults();

    // Apply current settings
    await _applyTtsSettings(currentPrefs);

    // Play sample text
    await _ttsService.speak(
      '현재 설정된 음성으로 샘플 텍스트를 재생합니다. 속도는 ${currentPrefs.ttsSpeedDescription}, 음높이는 ${currentPrefs.ttsPitchDescription}입니다.',
      interrupt: true,
    );
  }

  /// Apply TTS settings to the service
  Future<void> _applyTtsSettings(PreferencesEntity preferences) async {
    await _ttsService.setSpeechRate(preferences.ttsSpeed);
    await _ttsService.setPitch(preferences.ttsPitch);
    await _ttsService.setVoice(preferences.preferredLanguage);
  }

  /// Initialize with default preferences
  void initializeWithDefaults() {
    state = PreferencesState.loaded(preferences: PreferencesEntity.defaults());
  }
}