import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/auth/login_screen.dart';
import 'domain/providers/auth_provider.dart';

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
          authenticated: (user, token, expiry) {
            // TODO: Navigate to home screen when implemented
            // For now, show a placeholder
            return _AuthenticatedPlaceholder(userName: user.name);
          },
          unauthenticated: () => const LoginScreen(),
          error: (message, errorCode) {
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

/// Placeholder for authenticated state
/// TODO: Replace with actual home screen
class _AuthenticatedPlaceholder extends ConsumerWidget {
  final String userName;

  const _AuthenticatedPlaceholder({required this.userName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aura'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authNotifierProvider.notifier).logout(enableTts: true);
            },
            tooltip: '로그아웃',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 80,
              color: Colors.green,
            ),
            const SizedBox(height: 24),
            Text(
              '환영합니다, $userName님!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const Text(
              '로그인에 성공했습니다.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).logout(enableTts: true);
              },
              child: const Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}