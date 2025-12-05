import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/preferences_state.dart';
import '../entities/preferences_entity.dart';
import '../../data/services/preferences_service.dart';
import 'preferences_notifier.dart';
import 'auth_provider.dart';

/// Preferences service provider
final preferencesServiceProvider = Provider<PreferencesService>((ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  final httpClient = ref.watch(httpClientProvider);

  return PreferencesService(baseUrl: baseUrl, client: httpClient);
});

/// Preferences state notifier provider
/// This provider requires authentication
final preferencesNotifierProvider =
    StateNotifierProvider<PreferencesNotifier, PreferencesState>((ref) {
  final preferencesService = ref.watch(preferencesServiceProvider);
  final ttsService = ref.watch(ttsServiceProvider);
  final user = ref.watch(currentUserProvider);
  final token = ref.watch(currentTokenProvider);

  // User and token must be available
  if (user == null || token == null) {
    throw StateError(
      'PreferencesNotifierProvider accessed without authentication. '
      'Ensure user is logged in before accessing preferences.',
    );
  }

  return PreferencesNotifier(
    preferencesService: preferencesService,
    ttsService: ttsService,
    userId: user.id,
    token: token,
  );
});

/// Convenient provider to check if preferences are loaded
final isPreferencesLoadedProvider = Provider<bool>((ref) {
  final preferencesState = ref.watch(preferencesNotifierProvider);
  return preferencesState.isLoaded;
});

/// Convenient provider to get current preferences
final currentPreferencesProvider = Provider<PreferencesEntity?>((ref) {
  final preferencesState = ref.watch(preferencesNotifierProvider);
  return preferencesState.preferences;
});

/// Convenient provider to check if preferences are loading
final isPreferencesLoadingProvider = Provider<bool>((ref) {
  final preferencesState = ref.watch(preferencesNotifierProvider);
  return preferencesState.isLoading;
});

/// Convenient provider to get preferences error
final preferencesErrorProvider = Provider<String?>((ref) {
  final preferencesState = ref.watch(preferencesNotifierProvider);
  return preferencesState.maybeWhen(
    error: (error) => error.message,
    orElse: () => null,
  );
});