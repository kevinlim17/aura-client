import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/auth/login_screen.dart';
import 'presentation/screens/onboarding/profile_setup_screen.dart';
import 'presentation/screens/onboarding/context_setup_screen.dart';
import 'presentation/screens/onboarding/preferences_setup_screen.dart';
import 'presentation/screens/home/home_screen.dart';
import 'domain/providers/auth_provider.dart';
import 'domain/providers/onboarding_provider.dart';
import 'domain/entities/onboarding_data.dart';
import 'domain/entities/user_entity.dart';

void main() {
  runApp(
    const ProviderScope(
      child: AuraApp(),
    ),
  );
}

/// Main application widget with Riverpod integration
class AuraApp extends ConsumerWidget {
  const AuraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Aura',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const AuthWrapper(),
    );
  }
}

/// Authentication wrapper that handles routing based on auth state
class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // First, check if repository is ready
    final repositoryAsync = ref.watch(authRepositoryProvider);

    return repositoryAsync.when(
      loading: () => const _LoadingScreen(),
      error: (error, stack) {
        // Show error message and login screen
        return const _ErrorScreen(
          message: '앱 초기화에 실패했습니다. 앱을 다시 시작해주세요.',
        );
      },
      data: (_) {
        // Repository is ready, now watch auth state
        final authState = ref.watch(authNotifierProvider);

        // Handle different auth states
        return authState.when(
          initial: () => const LoginScreen(),
          loading: () => const _LoadingScreen(),
          authenticated: (user, accessToken) {
            // Check if user needs onboarding
            if (!user.isOnboardingCompleted) {
              return const OnboardingRouter();
            }
            // User has completed onboarding - show home screen
            return const HomeScreen();
          },
          unauthenticated: () => const LoginScreen(),
          error: (error) {
            // Show login screen with error
            // Error is already announced via TTS in AuthNotifier
            return const LoginScreen();
          },
        );
      },
    );
  }
}

/// Loading screen shown during authentication
class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

/// Error screen shown when app initialization fails
class _ErrorScreen extends StatelessWidget {
  final String message;

  const _ErrorScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 80,
                color: Colors.red,
              ),
              const SizedBox(height: 24),
              Text(
                message,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Onboarding router that handles onboarding flow
/// Routes to appropriate screen based on onboarding state
class OnboardingRouter extends ConsumerStatefulWidget {
  const OnboardingRouter({super.key});

  @override
  ConsumerState<OnboardingRouter> createState() => _OnboardingRouterState();
}

class _OnboardingRouterState extends ConsumerState<OnboardingRouter> {
  @override
  void initState() {
    super.initState();

    // Start onboarding if not already started
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final onboardingState = ref.read(onboardingNotifierProvider);
      final authState = ref.read(authNotifierProvider);

      // Check if we need to start onboarding
      final isAuthenticated = authState.maybeWhen(
        authenticated: (_, __) => true,
        orElse: () => false,
      );

      final isOnboardingInitial = onboardingState.maybeWhen(
        initial: () => true,
        orElse: () => false,
      );

      // Start onboarding if user is authenticated and onboarding hasn't started
      if (isAuthenticated && isOnboardingInitial) {
        final user = authState.maybeWhen(
          authenticated: (user, _) => user,
          orElse: () => null,
        );

        final enableTts = user?.requiresTts ?? false;
        ref.read(onboardingNotifierProvider.notifier).startOnboarding(
          enableTts: enableTts,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final onboardingState = ref.watch(onboardingNotifierProvider);
    final authState = ref.watch(authNotifierProvider);

    final user = authState.maybeWhen(
      authenticated: (user, _) => user,
      orElse: () => null,
    );

    return onboardingState.when(
      initial: () => const _LoadingScreen(),
      loading: (_, __) => const _LoadingScreen(),
      inProgress: (data) {
        // Route to appropriate screen based on current step
        return switch (data.currentStep) {
          OnboardingStep.profile => const ProfileSetupScreen(),
          OnboardingStep.context => const ContextSetupScreen(),
          OnboardingStep.preferences => const PreferencesSetupScreen(),
          OnboardingStep.completed => const HomeScreen(),
        };
      },
      stepCompleted: (data, _) {
        // Transition state - show loading
        return const _LoadingScreen();
      },
      completed: (data) {
        // Onboarding completed - show home screen
        return const HomeScreen();
      },
      error: (message, _) {
        // Show error and allow retry
        return _OnboardingErrorScreen(
          message: message,
          onRetry: () {
            final enableTts = user?.requiresTts ?? false;
            ref.read(onboardingNotifierProvider.notifier).startOnboarding(
              enableTts: enableTts,
            );
          },
        );
      },
    );
  }
}

/// Error screen for onboarding failures
class _OnboardingErrorScreen extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _OnboardingErrorScreen({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 80,
                color: Colors.red,
              ),
              const SizedBox(height: 24),
              Text(
                message,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('다시 시도'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

