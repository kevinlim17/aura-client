import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/context_state.dart';
import '../entities/context_entity.dart';
import '../usecases/context_management_usecase.dart';
import '../../data/services/context_service.dart';
import '../../data/services/voice_service.dart';
import 'context_notifier.dart';
import 'auth_provider.dart';

/// Context service provider
final contextServiceProvider = Provider<ContextService>((ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  final httpClient = ref.watch(httpClientProvider);

  return ContextService(baseUrl: baseUrl, client: httpClient);
});

/// Voice service provider
final voiceServiceProvider = Provider<VoiceService>((ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  final httpClient = ref.watch(httpClientProvider);

  return VoiceService(baseUrl: baseUrl, client: httpClient);
});

/// Context management use case provider
final contextManagementUseCaseProvider = Provider<ContextManagementUseCase>((ref) {
  final contextService = ref.watch(contextServiceProvider);
  final voiceService = ref.watch(voiceServiceProvider);

  return ContextManagementUseCase(
    contextService: contextService,
    voiceService: voiceService,
  );
});

/// Context notifier provider
/// Requires authentication
final contextNotifierProvider = StateNotifierProvider<ContextNotifier, ContextState>((ref) {
  final useCase = ref.watch(contextManagementUseCaseProvider);
  final token = ref.watch(currentTokenProvider);
  final user = ref.watch(currentUserProvider);

  if (token == null || user == null) {
    throw StateError(
      'ContextNotifierProvider requires authentication. '
      'Ensure user is logged in before accessing this provider.',
    );
  }

  return ContextNotifier(
    useCase: useCase,
    token: token,
    userId: int.parse(user.id),
  );
});

/// Context list notifier provider
/// Requires authentication
final contextListNotifierProvider =
    StateNotifierProvider<ContextListNotifier, ContextListState>((ref) {
  final useCase = ref.watch(contextManagementUseCaseProvider);
  final token = ref.watch(currentTokenProvider);
  final user = ref.watch(currentUserProvider);

  if (token == null || user == null) {
    throw StateError(
      'ContextListNotifierProvider requires authentication. '
      'Ensure user is logged in before accessing this provider.',
    );
  }

  final notifier = ContextListNotifier(
    useCase: useCase,
    token: token,
    userId: int.parse(user.id),
  );

  // Auto-load contexts on initialization
  Future.microtask(() {
    debugPrint('[ContextProvider] Auto-loading contexts');
    notifier.loadContexts();
  });

  return notifier;
});

/// Emotion tags notifier provider
/// Requires authentication
final emotionTagsNotifierProvider =
    StateNotifierProvider<EmotionTagsNotifier, EmotionTagsState>((ref) {
  final useCase = ref.watch(contextManagementUseCaseProvider);
  final token = ref.watch(currentTokenProvider);

  if (token == null) {
    throw StateError(
      'EmotionTagsNotifierProvider requires authentication. '
      'Ensure user is logged in before accessing this provider.',
    );
  }

  return EmotionTagsNotifier(
    useCase: useCase,
    token: token,
  );
});

/// Convenient provider for context submission state
final isSubmittingContextProvider = Provider<bool>((ref) {
  final contextState = ref.watch(contextNotifierProvider);
  return contextState.maybeWhen(
    submitting: (_) => true,
    orElse: () => false,
  );
});

/// Convenient provider for context error
final contextErrorProvider = Provider<String?>((ref) {
  final contextState = ref.watch(contextNotifierProvider);
  return contextState.maybeWhen(
    error: (message, _) => message,
    orElse: () => null,
  );
});

/// Convenient provider for context success
final contextSuccessProvider = Provider<ContextEntity?>((ref) {
  final contextState = ref.watch(contextNotifierProvider);
  return contextState.maybeWhen(
    success: (context, _) => context,
    orElse: () => null,
  );
});

/// Convenient provider for recording state
final isRecordingProvider = Provider<bool>((ref) {
  final contextState = ref.watch(contextNotifierProvider);
  return contextState.maybeWhen(
    recording: (_, __) => true,
    orElse: () => false,
  );
});

/// Convenient provider for context list loading state
final isLoadingContextsProvider = Provider<bool>((ref) {
  final listState = ref.watch(contextListNotifierProvider);
  return listState.maybeWhen(
    loading: () => true,
    orElse: () => false,
  );
});

/// Convenient provider for context list
final contextsProvider = Provider<List<ContextEntity>>((ref) {
  final listState = ref.watch(contextListNotifierProvider);
  return listState.maybeWhen(
    loaded: (contexts, _, __) => contexts,
    orElse: () => [],
  );
});

/// Convenient provider for recommended emotion tags
final recommendedEmotionTagsProvider = Provider<List<String>>((ref) {
  final tagsState = ref.watch(emotionTagsNotifierProvider);
  return tagsState.maybeWhen(
    loaded: (tags) => tags,
    orElse: () => [],
  );
});

/// Convenient provider for emotion tags loading state
final isLoadingEmotionTagsProvider = Provider<bool>((ref) {
  final tagsState = ref.watch(emotionTagsNotifierProvider);
  return tagsState.maybeWhen(
    loading: () => true,
    orElse: () => false,
  );
});
