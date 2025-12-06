import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'tts_provider.dart';
import '../entities/auth_state.dart';
import '../entities/user_entity.dart';
import '../../data/services/auth_service.dart';
import '../../data/repositories/auth_repository.dart';
import '../../core/utils/storage_service.dart';
import 'auth_notifier.dart';

/// Configuration provider for base URL
/// Automatically selects appropriate URL based on platform
final baseUrlProvider = Provider<String>((ref) {
  // Production URL (replace with actual server URL for production)
  const productionUrl = 'https://api.aura-guide.com';

  // Development URLs for different platforms
  if (kDebugMode) {
    if (kIsWeb) {
      // Web browser - use localhost
      return 'http://localhost:8080';
    } else if (Platform.isAndroid) {
      // Android emulator - 10.0.2.2 maps to host machine's localhost
      return 'http://10.0.2.2:8080';
    } else if (Platform.isIOS) {
      // iOS simulator - use localhost directly
      return 'http://localhost:8080';
    } else {
      // Desktop or other platforms
      return 'http://localhost:8080';
    }
  }

  return productionUrl;
});

/// HTTP client provider
final httpClientProvider = Provider<http.Client>((ref) {
  return http.Client();
});

/// Storage service provider
final storageServiceProvider = FutureProvider<StorageService>((ref) async {
  return await StorageServiceFactory.getInstance();
});

/// Auth service provider
final authServiceProvider = Provider<AuthService>((ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  final httpClient = ref.watch(httpClientProvider);

  return AuthService(baseUrl: baseUrl, client: httpClient);
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
/// IMPORTANT: Only access this provider when authRepositoryProvider is ready
/// Use AuthWrapper in main.dart to ensure proper initialization order
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((
  ref,
) {
  // Watch the repository (this will wait for it to be ready)
  final repositoryAsync = ref.watch(authRepositoryProvider);
  final ttsService = ref.watch(ttsServiceProvider);

  // Return a notifier with loading state while repository is loading
  return repositoryAsync.when(
    data: (repository) {
      debugPrint('[AuthProvider] Repository ready, creating AuthNotifier');
      final notifier = AuthNotifier(
        authRepository: repository,
        ttsService: ttsService,
      );

      // Attempt auto-login on app start
      Future.microtask(() async {
        debugPrint('[AuthProvider] Attempting auto-login');
        await notifier.autoLogin();
        debugPrint('[AuthProvider] Auto-login completed');
      });

      return notifier;
    },
    loading: () {
      // This should not happen if AuthWrapper properly guards the access
      // However, we return a placeholder to prevent crashes
      debugPrint('[AuthProvider] WARNING: Repository still loading');
      throw StateError(
        'AuthNotifierProvider accessed before AuthRepository was ready. '
        'Ensure you use AuthWrapper to guard access to this provider.',
      );
    },
    error: (error, stack) {
      debugPrint('[AuthProvider] ERROR: Repository initialization failed: $error');
      throw StateError(
        'Failed to initialize AuthRepository: $error\n$stack',
      );
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

/// Convenient provider to get current access token
final currentTokenProvider = Provider<String?>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.accessToken;
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
    error: (error) => error.message,
    orElse: () => null,
  );
});
