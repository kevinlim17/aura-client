import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/onboarding/profile_setup_screen.dart';
import '../screens/onboarding/preferences_setup_screen.dart';
import '../screens/onboarding/context_setup_screen.dart';
import '../screens/docent/docent_player_screen.dart';
import '../screens/docent/feedback_screen.dart';
import '../../domain/entities/docent_entity.dart';

/// Route names
class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String profileSetup = '/profile-setup';
  static const String preferencesSetup = '/preferences-setup';
  static const String contextSetup = '/context-setup';
  static const String home = '/home';
  static const String docentPlayer = '/docent-player';
  static const String feedback = '/feedback';
}

/// Navigation helpers
class AppNavigation {
  /// Navigate to home screen (clear all previous routes)
  static Future<void> toHome(BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  /// Navigate to login screen (clear all previous routes)
  static Future<void> toLogin(BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  /// Navigate to register screen
  static Future<void> toRegister(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }

  /// Navigate to profile setup screen
  static Future<void> toProfileSetup(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ProfileSetupScreen()),
    );
  }

  /// Replace current screen with profile setup screen
  static Future<void> replaceWithProfileSetup(BuildContext context) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ProfileSetupScreen()),
    );
  }

  /// Navigate to preferences setup screen
  static Future<void> toPreferencesSetup(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const PreferencesSetupScreen()),
    );
  }

  /// Replace current screen with preferences setup screen
  static Future<void> replaceWithPreferencesSetup(BuildContext context) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const PreferencesSetupScreen()),
    );
  }

  /// Navigate to context setup screen
  static Future<void> toContextSetup(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ContextSetupScreen()),
    );
  }

  /// Replace current screen with context setup screen
  static Future<void> replaceWithContextSetup(BuildContext context) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ContextSetupScreen()),
    );
  }

  /// Navigate to docent player screen
  static Future<void> toDocentPlayer(
    BuildContext context, {
    required DocentSessionEntity session,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DocentPlayerScreen(session: session),
      ),
    );
  }

  /// Replace current screen with docent player screen
  static Future<void> replaceWithDocentPlayer(
    BuildContext context, {
    required DocentSessionEntity session,
  }) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => DocentPlayerScreen(session: session),
      ),
    );
  }

  /// Navigate to feedback screen
  static Future<void> toFeedback(
    BuildContext context, {
    required DocentSessionEntity session,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FeedbackScreen(session: session),
      ),
    );
  }

  /// Pop current screen
  static void pop(BuildContext context, [dynamic result]) {
    Navigator.of(context).pop(result);
  }

  /// Pop until reaching a specific route
  static void popUntil(BuildContext context, String routeName) {
    Navigator.of(context).popUntil(ModalRoute.withName(routeName));
  }
}
