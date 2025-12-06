import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/docent_state.dart';
import '../entities/docent_entity.dart';
import '../../data/services/docent_service.dart';
import 'docent_notifier.dart';
import 'auth_provider.dart';
import 'tts_provider.dart';

// ============================================================
// Service Providers
// ============================================================

/// Docent service provider
final docentServiceProvider = Provider<DocentService>((ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  final httpClient = ref.watch(httpClientProvider);
  return DocentService(baseUrl: baseUrl, client: httpClient);
});

// ============================================================
// Main Docent Provider
// ============================================================

/// Docent state notifier provider
final docentProvider = StateNotifierProvider<DocentNotifier, DocentState>((ref) {
  final docentService = ref.watch(docentServiceProvider);
  final ttsService = ref.watch(ttsServiceProvider);
  final token = ref.watch(currentTokenProvider);

  if (token == null) {
    throw StateError('DocentProvider accessed without authentication.');
  }

  return DocentNotifier(
    docentService: docentService,
    ttsService: ttsService,
    accessToken: token,
  );
});

// ============================================================
// Convenience Providers
// ============================================================

/// Current docent state provider
final currentDocentStateProvider = Provider<DocentState>((ref) {
  return ref.watch(docentProvider);
});

/// Is docent generating provider
final isDocentGeneratingProvider = Provider<bool>((ref) {
  return ref.watch(docentProvider.select((state) => state.isGenerating));
});

/// Is docent completed provider
final isDocentCompletedProvider = Provider<bool>((ref) {
  return ref.watch(docentProvider.select((state) => state.isCompleted));
});

/// Is docent failed provider
final isDocentFailedProvider = Provider<bool>((ref) {
  return ref.watch(docentProvider.select((state) => state.isFailed));
});

/// Current docent session provider
final currentDocentSessionProvider = Provider<DocentSessionEntity?>((ref) {
  return ref.watch(docentProvider.select((state) => state.session));
});

/// Current docent session ID provider
final currentDocentSessionIdProvider = Provider<int?>((ref) {
  return ref.watch(docentProvider.select((state) => state.sessionId));
});

/// Docent generation progress provider
final docentGenerationProgressProvider = Provider<int>((ref) {
  return ref.watch(docentProvider).maybeWhen(
        generating: (_, __, progress, ___) => progress,
        orElse: () => 0,
      );
});

/// Docent generation elapsed time provider
final docentGenerationElapsedTimeProvider = Provider<Duration?>((ref) {
  return ref.watch(docentProvider.select((state) => state.elapsedTime));
});

/// Docent error message provider
final docentErrorMessageProvider = Provider<String?>((ref) {
  return ref.watch(docentProvider).maybeWhen(
        failed: (errorMessage, _) => errorMessage,
        orElse: () => null,
      );
});

// ============================================================
// Docent Actions
// ============================================================

/// Generate docent for an artwork
Future<void> generateDocent(
  WidgetRef ref, {
  required int userId,
  required int artworkId,
  NarrativeStyle? narrativeStyle,
  PreferredLength? preferredLength,
  bool includeCompanionContext = false,
  bool useFewShotExamples = true,
  String? customPrompt,
}) async {
  await ref.read(docentProvider.notifier).generateDocent(
        userId: userId,
        artworkId: artworkId,
        narrativeStyle: narrativeStyle,
        preferredLength: preferredLength,
        includeCompanionContext: includeCompanionContext,
        useFewShotExamples: useFewShotExamples,
        customPrompt: customPrompt,
      );
}

/// Cancel docent generation
void cancelDocentGeneration(WidgetRef ref) {
  ref.read(docentProvider.notifier).cancelGeneration();
}

/// Update playback statistics
Future<void> updateDocentPlaybackStats(
  WidgetRef ref, {
  required int sessionId,
  required int playCount,
  required int totalListeningSeconds,
  required double completionRate,
}) async {
  await ref.read(docentProvider.notifier).updatePlaybackStats(
        sessionId: sessionId,
        playCount: playCount,
        totalListeningSeconds: totalListeningSeconds,
        completionRate: completionRate,
      );
}

/// Speak docent via TTS
Future<void> speakDocent(WidgetRef ref, DocentSessionEntity session) async {
  await ref.read(docentProvider.notifier).speakDocent(session);
}

/// Pause docent TTS
Future<void> pauseDocentTts(WidgetRef ref) async {
  await ref.read(docentProvider.notifier).pauseTts();
}

/// Resume docent TTS
Future<void> resumeDocentTts(WidgetRef ref, String text) async {
  await ref.read(docentProvider.notifier).resumeTts(text);
}

/// Stop docent TTS
Future<void> stopDocentTts(WidgetRef ref) async {
  await ref.read(docentProvider.notifier).stopTts();
}

/// Reset docent state
void resetDocent(WidgetRef ref) {
  ref.read(docentProvider.notifier).reset();
}