import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/providers/auth_provider.dart';
import '../../../domain/entities/auth_state.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';

/// Register screen for new user registration
/// Supports accessibility features including TTS and visual impairment options
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  // Form controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Form state
  bool _isVisuallyImpaired = false;
  DisabilitySeverity _disabilitySeverity = DisabilitySeverity.none;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Validation errors
  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;
  String? _disabilityError;

  @override
  void initState() {
    super.initState();
    // TTS announcement when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ttsService = ref.read(ttsServiceProvider);
      ttsService.speak(
        '회원가입 화면입니다. 이름, 이메일, 비밀번호를 입력하고 시각장애 여부를 선택해주세요.',
      );
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  /// Validate name field
  String? _validateName(String value) {
    if (value.trim().isEmpty) {
      return '이름을 입력해주세요.';
    }
    if (value.trim().length < 2) {
      return '이름은 2자 이상이어야 합니다.';
    }
    return null;
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
    if (!value.contains(RegExp(r'[A-Za-z]')) ||
        !value.contains(RegExp(r'[0-9]'))) {
      return '비밀번호는 영문과 숫자를 포함해야 합니다.';
    }
    return null;
  }

  /// Validate confirm password field
  String? _validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return '비밀번호를 다시 입력해주세요.';
    }
    if (value != _passwordController.text) {
      return '비밀번호가 일치하지 않습니다.';
    }
    return null;
  }

  /// Validate disability severity selection
  String? _validateDisability() {
    if (_isVisuallyImpaired && _disabilitySeverity == DisabilitySeverity.none) {
      return '시각장애 정도를 선택해주세요.';
    }
    return null;
  }

  /// Validate all form fields
  bool _validateForm() {
    setState(() {
      _nameError = _validateName(_nameController.text);
      _emailError = _validateEmail(_emailController.text);
      _passwordError = _validatePassword(_passwordController.text);
      _confirmPasswordError = _validateConfirmPassword(_confirmPasswordController.text);
      _disabilityError = _validateDisability();
    });

    final hasErrors = _nameError != null ||
        _emailError != null ||
        _passwordError != null ||
        _confirmPasswordError != null ||
        _disabilityError != null;

    // TTS feedback for validation errors
    if (hasErrors) {
      final ttsService = ref.read(ttsServiceProvider);
      ttsService.speak('입력 정보를 확인해주세요.');
    }

    return !hasErrors;
  }

  /// Handle register button press
  Future<void> _handleRegister() async {
    // Haptic feedback
    HapticFeedback.mediumImpact();

    // Validate form
    if (!_validateForm()) {
      return;
    }

    // Call register method from auth notifier
    final authNotifier = ref.read(authNotifierProvider.notifier);
    await authNotifier.register(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      name: _nameController.text.trim(),
      isVisuallyImpaired: _isVisuallyImpaired,
      disabilitySeverity: _isVisuallyImpaired
          ? _disabilitySeverity
          : DisabilitySeverity.none,
      enableTts: _isVisuallyImpaired,
    );

    // Check registration result
    final authState = ref.read(authNotifierProvider);
    authState.maybeWhen(
      authenticated: (_, __, ___) {
        // Registration successful - navigation handled by app router
        if (mounted) {
          Navigator.of(context).pop();
        }
      },
      error: (message, _) {
        // Error handled by auth notifier TTS
        // Show error dialog for visual users
        if (mounted && !_isVisuallyImpaired) {
          _showErrorDialog(message);
        }
      },
      orElse: () {},
    );
  }

  /// Show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('회원가입 실패'),
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
              // Title
              Semantics(
                header: true,
                label: '회원가입',
                child: Text(
                  '회원가입',
                  style: AppTypography.headline1,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                '계정 정보를 입력해주세요',
                style: AppTypography.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Scrollable form
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Name field
                      AppTextField(
                        label: '이름',
                        hint: '이름을 입력하세요',
                        semanticLabel: '이름 입력 필드',
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        errorText: _nameError,
                        enabled: !isLoading,
                        prefixIcon: Icons.person_outline,
                        onChanged: (_) {
                          if (_nameError != null) {
                            setState(() => _nameError = null);
                          }
                        },
                      ),
                      const SizedBox(height: AppSpacing.md),

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
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // Password field
                      AppTextField(
                        label: '비밀번호',
                        hint: '8자 이상, 영문과 숫자 포함',
                        semanticLabel: '비밀번호 입력 필드',
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
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
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // Confirm password field
                      AppTextField(
                        label: '비밀번호 확인',
                        hint: '비밀번호를 다시 입력하세요',
                        semanticLabel: '비밀번호 확인 입력 필드',
                        controller: _confirmPasswordController,
                        obscureText: _obscureConfirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        errorText: _confirmPasswordError,
                        enabled: !isLoading,
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: _obscureConfirmPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        onSuffixIconTap: () {
                          setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                        },
                        onChanged: (_) {
                          if (_confirmPasswordError != null) {
                            setState(() => _confirmPasswordError = null);
                          }
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),

                      // Visual impairment section
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                          border: Border.all(
                            color: _disabilityError != null
                                ? AppColors.error
                                : AppColors.dividerLight,
                            width: AppBorders.medium,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Visual impairment checkbox
                            Semantics(
                              label: '시각장애 여부',
                              checked: _isVisuallyImpaired,
                              enabled: !isLoading,
                              child: InkWell(
                                onTap: isLoading ? null : () {
                                  HapticFeedback.selectionClick();
                                  setState(() {
                                    _isVisuallyImpaired = !_isVisuallyImpaired;
                                    if (!_isVisuallyImpaired) {
                                      _disabilitySeverity = DisabilitySeverity.none;
                                      _disabilityError = null;
                                    }
                                  });
                                  final ttsService = ref.read(ttsServiceProvider);
                                  ttsService.speak(
                                    _isVisuallyImpaired
                                        ? '시각장애 선택됨. 장애 정도를 선택해주세요.'
                                        : '시각장애 선택 해제됨.',
                                  );
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: _isVisuallyImpaired
                                            ? AppColors.primary
                                            : AppColors.surface,
                                        border: Border.all(
                                          color: _isVisuallyImpaired
                                              ? AppColors.primary
                                              : AppColors.dividerLight,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: _isVisuallyImpaired
                                          ? const Icon(
                                              Icons.check,
                                              size: 18,
                                              color: Colors.white,
                                            )
                                          : null,
                                    ),
                                    const SizedBox(width: AppSpacing.sm),
                                    Expanded(
                                      child: Text(
                                        '시각장애가 있습니다',
                                        style: AppTypography.body1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Disability severity options
                            if (_isVisuallyImpaired) ...[
                              const SizedBox(height: AppSpacing.md),
                              const Divider(),
                              const SizedBox(height: AppSpacing.sm),
                              Text(
                                '장애 정도 선택',
                                style: AppTypography.body1.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.sm),

                              // Total blindness option
                              Semantics(
                                label: '전맹 (완전 시각장애)',
                                selected: _disabilitySeverity == DisabilitySeverity.totalBlindness,
                                enabled: !isLoading,
                                child: InkWell(
                                  onTap: isLoading ? null : () {
                                    HapticFeedback.selectionClick();
                                    setState(() {
                                      _disabilitySeverity = DisabilitySeverity.totalBlindness;
                                      _disabilityError = null;
                                    });
                                    final ttsService = ref.read(ttsServiceProvider);
                                    ttsService.speak('전맹 선택됨');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: AppSpacing.sm,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: _disabilitySeverity == DisabilitySeverity.totalBlindness
                                                  ? AppColors.primary
                                                  : AppColors.dividerLight,
                                              width: 2,
                                            ),
                                          ),
                                          child: _disabilitySeverity == DisabilitySeverity.totalBlindness
                                              ? Center(
                                                  child: Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: AppColors.primary,
                                                    ),
                                                  ),
                                                )
                                              : null,
                                        ),
                                        const SizedBox(width: AppSpacing.sm),
                                        Expanded(
                                          child: Text(
                                            '전맹 (완전 시각장애)',
                                            style: AppTypography.body2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // Low vision option
                              Semantics(
                                label: '저시력 (부분 시각장애)',
                                selected: _disabilitySeverity == DisabilitySeverity.lowVision,
                                enabled: !isLoading,
                                child: InkWell(
                                  onTap: isLoading ? null : () {
                                    HapticFeedback.selectionClick();
                                    setState(() {
                                      _disabilitySeverity = DisabilitySeverity.lowVision;
                                      _disabilityError = null;
                                    });
                                    final ttsService = ref.read(ttsServiceProvider);
                                    ttsService.speak('저시력 선택됨');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: AppSpacing.sm,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: _disabilitySeverity == DisabilitySeverity.lowVision
                                                  ? AppColors.primary
                                                  : AppColors.dividerLight,
                                              width: 2,
                                            ),
                                          ),
                                          child: _disabilitySeverity == DisabilitySeverity.lowVision
                                              ? Center(
                                                  child: Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: AppColors.primary,
                                                    ),
                                                  ),
                                                )
                                              : null,
                                        ),
                                        const SizedBox(width: AppSpacing.sm),
                                        Expanded(
                                          child: Text(
                                            '저시력 (부분 시각장애)',
                                            style: AppTypography.body2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),

                      // Disability error message
                      if (_disabilityError != null) ...[
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          _disabilityError!,
                          style: AppTypography.caption.copyWith(
                            color: AppColors.error,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              // Bottom buttons
              const SizedBox(height: AppSpacing.lg),
              PrimaryButton(
                label: '회원가입',
                semanticLabel: '회원가입 버튼',
                onPressed: isLoading ? null : _handleRegister,
                isLoading: isLoading,
              ),
              const SizedBox(height: AppSpacing.md),
              SecondaryButton(
                label: '로그인으로 돌아가기',
                semanticLabel: '로그인 화면으로 돌아가기',
                onPressed: isLoading ? null : () {
                  HapticFeedback.lightImpact();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}