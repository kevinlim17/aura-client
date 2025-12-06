import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/providers/auth_provider.dart';
import '../../../domain/providers/tts_provider.dart';
import '../../../domain/entities/auth_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';
import 'register_screen.dart';

/// Login screen for user authentication
/// Supports accessibility features including TTS
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  // Form controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Form state
  bool _obscurePassword = true;

  // Validation errors
  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    // TTS announcement when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ttsService = ref.read(ttsServiceProvider);
      ttsService.speak(
        '로그인 화면입니다. 이메일과 비밀번호를 입력하세요.',
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Validate email field
  String? _validateEmail(String value) {
    if (value.trim().isEmpty) {
      return '이메일을 입력해주세요.';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value.trim())) {
      return '올바른 이메일 형식이 아닙니다.';
    }
    return null;
  }

  /// Validate password field
  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return '비밀번호를 입력해주세요.';
    }
    if (value.length < 8) {
      return '비밀번호는 8자 이상이어야 합니다.';
    }
    return null;
  }

  /// Validate all form fields
  bool _validateForm() {
    setState(() {
      _emailError = _validateEmail(_emailController.text);
      _passwordError = _validatePassword(_passwordController.text);
    });

    final hasErrors = _emailError != null || _passwordError != null;

    // TTS feedback for validation errors
    if (hasErrors) {
      final ttsService = ref.read(ttsServiceProvider);
      ttsService.speak('입력 정보를 확인해주세요.');
    }

    return !hasErrors;
  }

  /// Handle login button press
  Future<void> _handleLogin() async {
    // Haptic feedback
    HapticFeedback.mediumImpact();

    // Validate form
    if (!_validateForm()) {
      return;
    }

    // Call login method from auth notifier
    final authNotifier = ref.read(authNotifierProvider.notifier);
    await authNotifier.login(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );

    // Check login result only if widget is still mounted
    if (!mounted) return;

    final authState = ref.read(authNotifierProvider);
    authState.maybeWhen(
      authenticated: (user, accessToken) {
        // Login successful - navigation handled by app router
        // Nothing to do here as main.dart will handle navigation
      },
      error: (error) {
        // Error handled by auth notifier TTS
        // Show error dialog for visual users
        _showErrorDialog(error.message);
      },
      orElse: () {},
    );
  }

  /// Handle register navigation
  void _handleNavigateToRegister() {
    HapticFeedback.lightImpact();

    final ttsService = ref.read(ttsServiceProvider);
    ttsService.speak('회원가입 화면으로 이동합니다.');

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      ),
    );
  }

  /// Show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('로그인 실패'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState.isLoading;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App branding
              const SizedBox(height: AppSpacing.xxl),
              Semantics(
                header: true,
                label: 'Aura 시각장애인을 위한 미술관 가이드',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aura',
                      style: AppTypography.display.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Container(
                      height: 2,
                      width: 200,
                      color: AppColors.divider,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      '시각장애인을 위한 미술관 가이드',
                      style: AppTypography.body2.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),

              // Form section
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email field
                      AppTextField(
                        label: '이메일',
                        hint: 'example@email.com',
                        semanticLabel: '이메일 입력 필드',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        errorText: _emailError,
                        enabled: !isLoading,
                        prefixIcon: Icons.email_outlined,
                        onChanged: (_) {
                          if (_emailError != null) {
                            setState(() => _emailError = null);
                          }
                        },
                        onSubmitted: (_) {
                          // Move focus to password field
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // Password field
                      AppTextField(
                        label: '비밀번호',
                        hint: '비밀번호를 입력하세요',
                        semanticLabel: '비밀번호 입력 필드',
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        errorText: _passwordError,
                        enabled: !isLoading,
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        onSuffixIconTap: () {
                          setState(() => _obscurePassword = !_obscurePassword);
                        },
                        onChanged: (_) {
                          if (_passwordError != null) {
                            setState(() => _passwordError = null);
                          }
                        },
                        onSubmitted: (_) {
                          // Submit form when done is pressed
                          _handleLogin();
                        },
                      ),
                      const SizedBox(height: AppSpacing.sm),

                      // Forgot password link
                      Align(
                        alignment: Alignment.centerRight,
                        child: Semantics(
                          link: true,
                          label: '비밀번호를 잊으셨나요?',
                          child: InkWell(
                            onTap: isLoading ? null : () {
                              HapticFeedback.lightImpact();
                              final ttsService = ref.read(ttsServiceProvider);
                              ttsService.speak('비밀번호 찾기 기능은 준비 중입니다.');

                              // Show info dialog
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('안내'),
                                  content: const Text('비밀번호 찾기 기능은 준비 중입니다.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: const Text('확인'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(AppSpacing.xs),
                              child: Text(
                                '비밀번호를 잊으셨나요?',
                                style: AppTypography.body2.copyWith(
                                  color: AppColors.primary,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom buttons
              const SizedBox(height: AppSpacing.lg),
              PrimaryButton(
                label: '로그인',
                semanticLabel: '로그인 버튼',
                onPressed: isLoading ? null : _handleLogin,
                isLoading: isLoading,
              ),
              const SizedBox(height: AppSpacing.md),
              SecondaryButton(
                label: '계정 만들기',
                semanticLabel: '회원가입 화면으로 이동',
                onPressed: isLoading ? null : _handleNavigateToRegister,
              ),
              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
    );
  }
}