import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../domain/entities/search_state.dart';
import '../../../domain/providers/search_provider.dart';
import '../../../domain/providers/tts_provider.dart';
import 'search_result_screen.dart';

/// Camera search screen for artwork search using OCR
class CameraSearchScreen extends ConsumerStatefulWidget {
  const CameraSearchScreen({super.key});

  @override
  ConsumerState<CameraSearchScreen> createState() => _CameraSearchScreenState();
}

class _CameraSearchScreenState extends ConsumerState<CameraSearchScreen>
    with WidgetsBindingObserver {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isInitialized = false;
  bool _isTakingPicture = false;
  String? _capturedImagePath;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _announceScreen();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final controller = _cameraController;
    if (controller == null || !controller.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    }
  }

  void _announceScreen() {
    final ttsService = ref.read(ttsServiceProvider);
    ttsService.speak(
      '카메라 검색 화면입니다. 작품 설명이나 이름이 보이는 곳을 촬영해주세요.',
    );
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras == null || _cameras!.isEmpty) {
        setState(() {
          _errorMessage = '카메라를 사용할 수 없습니다.';
        });
        return;
      }

      // Use the first back camera
      final camera = _cameras!.firstWhere(
        (cam) => cam.lensDirection == CameraLensDirection.back,
        orElse: () => _cameras!.first,
      );

      _cameraController = CameraController(
        camera,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await _cameraController!.initialize();

      if (!mounted) return;

      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      debugPrint('[CameraSearch] Camera init error: $e');
      setState(() {
        _errorMessage = '카메라 초기화에 실패했습니다.';
      });
    }
  }

  Future<void> _takePicture() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    if (_isTakingPicture) return;

    setState(() {
      _isTakingPicture = true;
      _errorMessage = null;
    });

    // Haptic feedback for shutter
    HapticFeedback.heavyImpact();

    try {
      final XFile image = await _cameraController!.takePicture();

      // Save to app directory
      final directory = await getApplicationDocumentsDirectory();
      final fileName = 'ocr_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final savedPath = '${directory.path}/$fileName';

      await File(image.path).copy(savedPath);

      setState(() {
        _capturedImagePath = savedPath;
        _isTakingPicture = false;
      });

      // Announce capture and start OCR
      final ttsService = ref.read(ttsServiceProvider);
      await ttsService.speak('사진을 촬영했습니다. 텍스트를 분석하고 있습니다.');

      // Process OCR
      await _processOcr(savedPath);
    } catch (e) {
      debugPrint('[CameraSearch] Take picture error: $e');
      setState(() {
        _isTakingPicture = false;
        _errorMessage = '사진 촬영에 실패했습니다.';
      });

      final ttsService = ref.read(ttsServiceProvider);
      await ttsService.speak('사진 촬영에 실패했습니다. 다시 시도해주세요.');
    }
  }

  Future<void> _processOcr(String imagePath) async {
    ref.read(searchProvider.notifier).startCameraCapture();
    await ref.read(searchProvider.notifier).processImageWithOcr(imagePath);
  }

  Future<void> _performSearch() async {
    final ocrText = ref.read(searchProvider).ocrText;
    if (ocrText == null || ocrText.trim().isEmpty) {
      final ttsService = ref.read(ttsServiceProvider);
      await ttsService.speak('인식된 텍스트가 없습니다. 다시 촬영해주세요.');
      return;
    }

    HapticFeedback.mediumImpact();

    // Search with OCR text
    ref.read(searchProvider.notifier).updateTextQuery(ocrText);
    await ref.read(searchProvider.notifier).searchByText();

    if (!mounted) return;

    // Navigate to result screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SearchResultScreen(),
      ),
    );
  }

  void _retakePhoto() {
    HapticFeedback.lightImpact();
    setState(() {
      _capturedImagePath = null;
    });
    ref.read(searchProvider.notifier).cancelOcrProcess();
  }

  @override
  Widget build(BuildContext context) {
    final ocrStatus = ref.watch(ocrStatusProvider);
    final ocrText = ref.watch(searchProvider.select((s) => s.ocrText));
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
          '카메라 검색',
          style: AppTypography.headline2.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Container(
                height: 2,
                color: AppColors.divider,
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Main content
            Expanded(
              child: _capturedImagePath == null
                  ? _buildCameraPreview()
                  : _buildResultView(ocrStatus, ocrText),
            ),

            // Bottom controls
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: _capturedImagePath == null
                  ? _buildCaptureButton()
                  : _buildResultControls(ocrStatus, ocrText, isLoading),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraPreview() {
    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.camera_alt_outlined,
                size: 80,
                color: AppColors.textDisabled,
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                _errorMessage!,
                style: AppTypography.body1.copyWith(
                  color: AppColors.error,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    if (!_isInitialized || _cameraController == null) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: AppColors.primary,
            ),
            SizedBox(height: AppSpacing.lg),
            Text(
              '카메라 준비 중...',
              style: AppTypography.body1,
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Semantics(
            child: Text(
              '작품 설명이나 이름이 보이는 곳을 촬영해주세요',
              style: AppTypography.caption.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),

        // Camera preview
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Semantics(
                label: '카메라 프리뷰',
                child: CameraPreview(_cameraController!),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCaptureButton() {
    return Semantics(
      button: true,
      label: '사진 촬영',
      hint: '탭하여 사진을 촬영합니다',
      child: GestureDetector(
        onTap: _isTakingPicture ? null : _takePicture,
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            color: _isTakingPicture ? AppColors.textDisabled : AppColors.primary,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.textOnPrimary,
              width: 4.0,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: _isTakingPicture
              ? const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: CircularProgressIndicator(
                    color: AppColors.textOnPrimary,
                    strokeWidth: 3,
                  ),
                )
              : const Icon(
                  Icons.camera_alt,
                  size: 36.0,
                  color: AppColors.textOnPrimary,
                ),
        ),
      ),
    );
  }

  Widget _buildResultView(OcrStatus ocrStatus, String? ocrText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Column(
        children: [
          // Captured image preview
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Semantics(
                label: '촬영된 이미지',
                child: Image.file(
                  File(_capturedImagePath!),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // OCR result area
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: AppColors.dividerLight,
                  width: 2.0,
                ),
              ),
              child: _buildOcrResultContent(ocrStatus, ocrText),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOcrResultContent(OcrStatus ocrStatus, String? ocrText) {
    if (ocrStatus == OcrStatus.processing || ocrStatus == OcrStatus.capturing) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: AppColors.primary,
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              '텍스트 분석 중...',
              style: AppTypography.body1,
            ),
          ],
        ),
      );
    }

    if (ocrStatus == OcrStatus.failed || ocrText == null || ocrText.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: AppColors.error,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              '텍스트를 인식할 수 없습니다',
              style: AppTypography.body1.copyWith(
                color: AppColors.error,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            header: true,
            child: Text(
              '인식된 텍스트',
              style: AppTypography.caption.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Semantics(
            label: '인식된 텍스트: $ocrText',
            child: Text(
              ocrText,
              style: AppTypography.body1.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultControls(OcrStatus ocrStatus, String? ocrText, bool isLoading) {
    final hasValidText = ocrStatus == OcrStatus.completed &&
                         ocrText != null &&
                         ocrText.isNotEmpty;

    return Column(
      children: [
        // Search button
        if (hasValidText)
          Semantics(
            button: true,
            label: '이 텍스트로 검색',
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
          ),

        if (hasValidText) const SizedBox(height: AppSpacing.md),

        // Retake button
        Semantics(
          button: true,
          label: '다시 촬영하기',
          child: GestureDetector(
            onTap: _retakePhoto,
            child: Container(
              width: double.infinity,
              height: 56.0,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(8.0),
              ),
              alignment: Alignment.center,
              child: Text(
                '다시 촬영하기',
                style: AppTypography.button.copyWith(
                  color: AppColors.textOnSecondary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}