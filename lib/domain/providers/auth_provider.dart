import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../entities/auth_state.dart';
import '../entities/user_entity.dart';
import '../../data/services/auth_service.dart';
import '../../data/repositories/auth_repository.dart';
import '../../core/utils/storage_service.dart';
import '../../core/accessibility/tts_service.dart';
import 'auth_notifier.dart';

/// Configuration provider for base URL
/// TODO: Replace with actual backend URL
final baseUrlProvider = Provider<String>((ref) {
  // Development/Production URL should be managed via environment variables
  return 'http://localhost:8080'; // Default development URL
});

/// HTTP client provider
final httpClientProvider = Provider<http.Client>((ref) {
  return http.Client();
});

/// Storage service provider
final storageServiceProvider = FutureProvider<StorageService>((ref) async {
  return await StorageServiceFactory.getInstance();
});

/// TTS service provider
final ttsServiceProvider = Provider<TtsService>((ref) {
  return TtsServiceSingleton.instance;
});

/// Auth service provider
final authServiceProvider = Provider<AuthService>((ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  final httpClient = ref.watch(httpClientProvider);

  return AuthService(
    baseUrl: baseUrl,
    client: httpClient,
  );
});

/// Auth repository provider
final authRepositoryProvider = FutureProvider<AuthRepository>((ref) async {
  final authService = ref.watch(authServiceProvider);
  final storageService = await ref.watch(storageServiceProvider.future);

  return AuthRepository(
    authService: authService,
    storageService: storageService,
  );
});

/// Auth state notifier provider
/// This is the main provider that UI widgets should watch
final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  // Watch the repository (this will wait for it to be ready)
  final repositoryAsync = ref.watch(authRepositoryProvider);
  final ttsService = ref.watch(ttsServiceProvider);

  // Return a notifier with loading state while repository is loading
  return repositoryAsync.when(
    data: (repository) {
      final notifier = AuthNotifier(
        authRepository: repository,
        ttsService: ttsService,
      );

      // Attempt auto-login on app start
      Future.microtask(() async {
        await notifier.autoLogin(enableTts: false);
      });

      return notifier;
    },
    loading: () {
      // Return a dummy notifier while loading
      // This should rarely happen as SharedPreferences is fast
      throw UnimplementedError('Auth repository is loading');
    },
    error: (error, stack) {
      // Return a dummy notifier with error
      throw Exception('Failed to initialize auth: $error');
    },
  );
});

/// Convenient provider to check if user is authenticated
final isAuthenticatedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.isAuthenticated;
});

/// Convenient provider to get current user
final currentUserProvider = Provider((ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.user;
});

/// Convenient provider to get current token
final currentTokenProvider = Provider<String?>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.token;
});

/// Convenient provider to check if user requires TTS
final requiresTtsProvider = Provider<bool>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.requiresTts ?? false;
});

/// Auth loading provider
final isAuthLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.isLoading;
});

/// Auth error provider
final authErrorProvider = Provider<String?>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.maybeWhen(
    error: (message, _) => message,
    orElse: () => null,
  );
});
