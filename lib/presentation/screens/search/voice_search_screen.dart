import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../domain/providers/search_provider.dart';
import '../../../domain/providers/tts_provider.dart';
import 'search_result_screen.dart';

/// Voice search screen for artwork search using speech-to-text
class VoiceSearchScreen extends ConsumerStatefulWidget {
  const VoiceSearchScreen({super.key});

  @override
  ConsumerState<VoiceSearchScreen> createState() => _VoiceSearchScreenState();
}

class _VoiceSearchScreenState extends ConsumerState<VoiceSearchScreen>
    with SingleTickerProviderStateMixin {
  final SpeechToText _speechToText = SpeechToText();
  bool _isInitialized = false;
  bool _isListening = false;
  String _transcribedText = '';
  double _confidence = 0.0;
  String? _errorMessage;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _initSpeech();
    _setupAnimation();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _announceScreen();
    });
  }

  void _setupAnimation() {
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _speechToText.stop();
    super.dispose();
  }

  void _announceScreen() {
    final ttsService = ref.read(ttsServiceProvider);
    ttsService.speak(
      '음성 검색 화면입니다. 마이크 버튼을 눌러 검색어를 말씀해주세요.',
    );
  }

  Future<void> _initSpeech() async {
    try {
      final available = await _speechToText.initialize(
        onStatus: _onSpeechStatus,
        onError: (error) {
          debugPrint('[VoiceSearch] Speech error: $error');
          setState(() {
            _errorMessage = '음성 인식 오류가 발생했습니다.';
            _isListening = false;
          });
        },
      );
      setState(() {
        _isInitialized = available;
        if (!available) {
          _errorMessage = '음성 인식을 사용할 수 없습니다.';
        }
      });
    } catch (e) {
      debugPrint('[VoiceSearch] Init error: $e');
      setState(() {
        _errorMessage = '음성 인식 초기화에 실패했습니다.';
      });
    }
  }

  void _onSpeechStatus(String status) {
    debugPrint('[VoiceSearch] Status: $status');
    if (status == 'done' || status == 'notListening') {
      setState(() {
        _isListening = false;
      });
    }
  }

  Future<void> _startListening() async {
    if (!_isInitialized) {
      final ttsService = ref.read(ttsServiceProvider);
      await ttsService.speak('음성 인식을 사용할 수 없습니다.');
      return;
    }

    HapticFeedback.heavyImpact();
    setState(() {
      _errorMessage = null;
      _transcribedText = '';
      _confidence = 0.0;
    });

    final ttsService = ref.read(ttsServiceProvider);
    await ttsService.speak('음성 인식을 시작합니다. 작품명이나 작가명을 말씀해주세요.');

    // Wait for TTS to finish before starting speech recognition
    await Future.delayed(const Duration(milliseconds: 1500));

    try {
      await _speechToText.listen(
        onResult: _onSpeechResult,
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 3),
        localeId: 'ko_KR',
        listenOptions: SpeechListenOptions(
          listenMode: ListenMode.confirmation,
        ),
      );
      setState(() {
        _isListening = true;
      });
      HapticFeedback.mediumImpact();
    } catch (e) {
      debugPrint('[VoiceSearch] Listen error: $e');
      setState(() {
        _errorMessage = '음성 인식 시작에 실패했습니다.';
      });
    }
  }

  Future<void> _stopListening() async {
    HapticFeedback.mediumImpact();
    await _speechToText.stop();
    setState(() {
      _isListening = false;
    });
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _transcribedText = result.recognizedWords;
      _confidence = result.confidence;
    });

    if (result.finalResult && result.recognizedWords.isNotEmpty) {
      _onRecognitionComplete(result.recognizedWords, result.confidence);
    }
  }

  Future<void> _onRecognitionComplete(String text, double confidence) async {
    HapticFeedback.mediumImpact();

    final ttsService = ref.read(ttsServiceProvider);
    await ttsService.speak('인식된 텍스트: $text');
  }

  Future<void> _performSearch() async {
    if (_transcribedText.trim().isEmpty) {
      final ttsService = ref.read(ttsServiceProvider);
      await ttsService.speak('검색어가 없습니다. 마이크 버튼을 눌러 다시 시도해주세요.');
      return;
    }

    HapticFeedback.mediumImpact();

    // Update search query and execute search
    ref.read(searchProvider.notifier).updateTextQuery(_transcribedText);
    await ref.read(searchProvider.notifier).searchByText();

    if (!mounted) return;

    // Navigate to result screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SearchResultScreen(),
      ),
    );
  }

  void _clearTranscription() {
    HapticFeedback.lightImpact();
    setState(() {
      _transcribedText = '';
      _confidence = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(isSearchLoadingProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: Semantics(
          button: true,
          label: '뒤로 가기',
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.textPrimary,
            ),
            onPressed: () {
              HapticFeedback.lightImpact();
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          '음성 검색',
          style: AppTypography.headline2.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Divider
              Container(
                height: 2,
                color: AppColors.divider,
              ),
              const SizedBox(height: AppSpacing.xl),

              // Section title
              Semantics(
                header: true,
                child: Text(
                  '음성으로 검색',
                  style: AppTypography.headline3.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),

              // Description
              Text(
                _isListening
                    ? '듣고 있습니다...'
                    : '마이크 버튼을 눌러 검색어를 말씀해주세요',
                style: AppTypography.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xxl),

              // Main microphone button
              _buildMicrophoneButton(),
              const SizedBox(height: AppSpacing.xl),

              // Transcribed text display
              Expanded(
                child: _buildTranscriptionArea(),
              ),

              // Error message
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: Text(
                    _errorMessage!,
                    style: AppTypography.body2.copyWith(
                      color: AppColors.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              // Action buttons
              if (_transcribedText.isNotEmpty) ...[
                _buildSearchButton(isLoading),
                const SizedBox(height: AppSpacing.md),
                _buildRetryButton(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMicrophoneButton() {
    return Semantics(
      button: true,
      label: _isListening ? '녹음 중지' : '음성 녹음 시작',
      hint: _isListening ? '탭하여 녹음을 중지합니다' : '탭하여 음성 검색을 시작합니다',
      child: GestureDetector(
        onTap: _isListening ? _stopListening : _startListening,
        child: AnimatedBuilder(
          animation: _pulseAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _isListening ? _pulseAnimation.value : 1.0,
              child: Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  color: _isListening ? AppColors.error : AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    if (_isListening)
                      BoxShadow(
                        color: AppColors.error.withValues(alpha: 0.5),
                        blurRadius: 20.0,
                        spreadRadius: 5.0,
                      )
                    else
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                  ],
                ),
                child: Icon(
                  _isListening ? Icons.stop : Icons.mic,
                  size: 48.0,
                  color: AppColors.textOnPrimary,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTranscriptionArea() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: AppColors.dividerLight,
          width: 2.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_transcribedText.isEmpty)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mic_none,
                      size: 64.0,
                      color: AppColors.textDisabled,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      '인식된 텍스트가 여기에 표시됩니다',
                      style: AppTypography.body2.copyWith(
                        color: AppColors.textDisabled,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          else ...[
            // Transcribed text
            Expanded(
              child: SingleChildScrollView(
                child: Semantics(
                  label: '인식된 텍스트: $_transcribedText',
                  child: Text(
                    _transcribedText,
                    style: AppTypography.headline3.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Confidence indicator
            _buildConfidenceIndicator(),
          ],
        ],
      ),
    );
  }

  Widget _buildConfidenceIndicator() {
    final confidencePercent = (_confidence * 100).toInt();
    final confidenceColor = _confidence >= 0.8
        ? AppColors.success
        : _confidence >= 0.5
            ? AppColors.warning
            : AppColors.error;

    return Semantics(
      label: '신뢰도 $confidencePercent퍼센트',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '신뢰도: ',
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          Container(
            width: 100,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.dividerLight,
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: _confidence,
              child: Container(
                decoration: BoxDecoration(
                  color: confidenceColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            '$confidencePercent%',
            style: AppTypography.caption.copyWith(
              color: confidenceColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchButton(bool isLoading) {
    return Semantics(
      button: true,
      label: '검색하기',
      enabled: !isLoading,
      child: GestureDetector(
        onTap: isLoading ? null : _performSearch,
        child: Container(
          width: double.infinity,
          height: 56.0,
          decoration: BoxDecoration(
            color: isLoading ? AppColors.textDisabled : AppColors.primary,
            borderRadius: BorderRadius.circular(8.0),
          ),
          alignment: Alignment.center,
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: AppColors.textOnPrimary,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  '이 텍스트로 검색',
                  style: AppTypography.button.copyWith(
                    color: AppColors.textOnPrimary,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildRetryButton() {
    return Semantics(
      button: true,
      label: '다시 녹음하기',
      child: GestureDetector(
        onTap: () {
          _clearTranscription();
          _startListening();
        },
        child: Container(
          width: double.infinity,
          height: 56.0,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(8.0),
          ),
          alignment: Alignment.center,
          child: Text(
            '다시 녹음하기',
            style: AppTypography.button.copyWith(
              color: AppColors.textOnSecondary,
            ),
          ),
        ),
      ),
    );
  }
}