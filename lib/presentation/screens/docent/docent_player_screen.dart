import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../domain/entities/docent_entity.dart';
import '../../../domain/providers/docent_provider.dart';
import '../../../core/accessibility/native_tts_file_service.dart';
import 'feedback_screen.dart';

/// Docent player screen with audio playback using just_audio
class DocentPlayerScreen extends ConsumerStatefulWidget {
  final DocentSessionEntity session;

  const DocentPlayerScreen({
    super.key,
    required this.session,
  });

  @override
  ConsumerState<DocentPlayerScreen> createState() =>
      _DocentPlayerScreenState();
}

class _DocentPlayerScreenState extends ConsumerState<DocentPlayerScreen> {
  // Audio player
  late AudioPlayer _audioPlayer;

  // Playback state
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isLoading = true;

  // Playback statistics
  int _playCount = 0;
  int _totalListeningSeconds = 0;
  DateTime? _sessionStartTime;
  DateTime? _playbackStartTime;
  Timer? _statsTimer;

  @override
  void initState() {
    super.initState();
    _sessionStartTime = DateTime.now();
    _audioPlayer = AudioPlayer();
    _initializeAudio();

    // Start stats tracking timer (update every 5 seconds during playback)
    _statsTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (_isPlaying) {
        _updatePlaybackStats();
      }
    });
  }

  /// Initialize audio player with TTS audio URL or generate from text
  Future<void> _initializeAudio() async {
    try {
      String? audioSource;

      // Option 1: Use server-provided TTS audio URL
      if (widget.session.hasTtsAudio) {
        debugPrint('[DocentPlayerScreen] Loading audio from server: ${widget.session.ttsAudioUrl}');
        audioSource = widget.session.ttsAudioUrl;
        await _audioPlayer.setUrl(audioSource!);
      }
      // Option 2: Generate TTS audio file using native Android TTS
      else {
        debugPrint('[DocentPlayerScreen] No server audio, generating with native TTS');

        final nativeTts = NativeTtsFileService();

        // Check if TTS is available
        final isAvailable = await nativeTts.isTtsAvailable();
        if (!isAvailable) {
          debugPrint('[DocentPlayerScreen] Native TTS not available');
          setState(() {
            _isLoading = false;
          });
          return;
        }

        // Generate audio file
        final audioPath = await nativeTts.synthesizeToFile(
          text: widget.session.generatedText,
          filename: 'docent_${widget.session.id}',
          language: 'ko-KR',
          pitch: 1.0,
          rate: 1.0,
        );

        if (audioPath == null) {
          debugPrint('[DocentPlayerScreen] Failed to generate TTS audio');
          setState(() {
            _isLoading = false;
          });
          return;
        }

        debugPrint('[DocentPlayerScreen] Generated audio file: $audioPath');
        await _audioPlayer.setFilePath(audioPath);
      }

      // Listen to duration changes
      _audioPlayer.durationStream.listen((duration) {
        if (duration != null && mounted) {
          setState(() {
            _totalDuration = duration;
          });
        }
      });

      // Listen to position changes
      _audioPlayer.positionStream.listen((position) {
        if (mounted) {
          setState(() {
            _currentPosition = position;
          });
        }
      });

      // Listen to player state changes
      _audioPlayer.playerStateStream.listen((state) {
        if (mounted) {
          setState(() {
            _isPlaying = state.playing;
            _isLoading = state.processingState == ProcessingState.loading ||
                state.processingState == ProcessingState.buffering;
          });

          // Handle completion
          if (state.processingState == ProcessingState.completed) {
            _handlePlaybackComplete();
          }
        }
      });

      setState(() {
        _isLoading = false;
      });

      debugPrint('[DocentPlayerScreen] Audio initialized successfully');
    } catch (e) {
      debugPrint('[DocentPlayerScreen] Error initializing audio: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _statsTimer?.cancel();
    // Final stats update
    _updatePlaybackStats(finalized: true);
    // Dispose audio player
    _audioPlayer.dispose();
    super.dispose();
  }

  /// Handle playback toggle
  Future<void> _togglePlayback() async {
    HapticFeedback.mediumImpact();

    if (_isPlaying) {
      // Pause playback
      await _audioPlayer.pause();

      // Update listening time
      if (_playbackStartTime != null) {
        final duration = DateTime.now().difference(_playbackStartTime!);
        _totalListeningSeconds += duration.inSeconds;
      }

      _updatePlaybackStats();
    } else {
      // Start playback
      _playbackStartTime = DateTime.now();
      _playCount++;

      await _audioPlayer.play();
    }
  }

  /// Handle playback completion
  void _handlePlaybackComplete() {
    debugPrint('[DocentPlayerScreen] Playback completed');

    // Update listening time
    if (_playbackStartTime != null) {
      final duration = DateTime.now().difference(_playbackStartTime!);
      _totalListeningSeconds += duration.inSeconds;
    }

    // Final stats update
    _updatePlaybackStats(finalized: true);
  }

  /// Seek to beginning
  Future<void> _seekToBeginning() async {
    HapticFeedback.lightImpact();
    await _audioPlayer.seek(Duration.zero);
  }

  /// Update playback statistics
  Future<void> _updatePlaybackStats({bool finalized = false}) async {
    // Calculate completion rate
    double completionRate = 0.0;
    final totalSeconds = _totalDuration.inSeconds;
    if (totalSeconds > 0) {
      completionRate =
          (_totalListeningSeconds / totalSeconds).clamp(0.0, 1.0);
    }

    try {
      await updateDocentPlaybackStats(
        ref,
        sessionId: widget.session.id,
        playCount: _playCount,
        totalListeningSeconds: _totalListeningSeconds,
        completionRate: completionRate,
      );

      debugPrint('[DocentPlayerScreen] Playback stats updated: '
          'playCount=$_playCount, '
          'listeningTime=$_totalListeningSeconds, '
          'completion=${(completionRate * 100).toStringAsFixed(1)}%');
    } catch (e) {
      debugPrint('[DocentPlayerScreen] Failed to update playback stats: $e');
    }
  }

  /// Handle feedback button
  void _handleFeedback() {
    HapticFeedback.lightImpact();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FeedbackScreen(session: widget.session),
      ),
    );
  }

  /// Handle voice settings button
  void _handleVoiceSettings() {
    HapticFeedback.lightImpact();
    // TODO: Navigate to voice settings screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('음성 설정 기능은 곧 추가될 예정입니다.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  /// Handle view other artworks button
  void _handleViewOtherArtworks() {
    HapticFeedback.lightImpact();
    // Navigate back to artwork selection
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Column(
            children: [
              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: AppSpacing.xl),

                      // Artwork info card
                      _buildArtworkInfoCard(),
                      const SizedBox(height: AppSpacing.xxl),

                      // Audio player
                      _buildAudioPlayer(),
                      const SizedBox(height: AppSpacing.xl),

                      // Control buttons (처음부터, 음성 설정)
                      _buildControlButtons(),
                    ],
                  ),
                ),
              ),

              // Bottom action buttons
              const SizedBox(height: AppSpacing.lg),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  /// Build artwork info card
  Widget _buildArtworkInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: AppColors.divider,
          width: 2.0,
        ),
      ),
      child: Column(
        children: [
          Text(
            widget.session.artworkTitle ?? '제목 없음',
            style: AppTypography.headline2.copyWith(
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            widget.session.artworkArtist ?? '작가 미상',
            style: AppTypography.body1.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            '2013', // TODO: Get year from artwork data
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Build audio player
  Widget _buildAudioPlayer() {
    // Check if audio failed to load (not loading and no duration)
    if (!_isLoading && _totalDuration == Duration.zero) {
      return Container(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'TTS 오디오를 사용할 수 없습니다',
              style: AppTypography.body1.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Play/Pause button
        _buildPlayPauseButton(),
        const SizedBox(height: AppSpacing.md),

        // Status text
        Text(
          _isPlaying ? '일시정지' : '재생',
          style: AppTypography.headline2.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.xl),

        // Progress bar
        _buildProgressBar(),
        const SizedBox(height: AppSpacing.sm),

        // Time display
        _buildTimeDisplay(),
      ],
    );
  }

  /// Build play/pause button
  Widget _buildPlayPauseButton() {
    return Semantics(
      button: true,
      label: _isPlaying ? '일시정지' : '재생',
      child: GestureDetector(
        onTap: _isLoading ? null : _togglePlayback,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: _isLoading ? AppColors.textDisabled : AppColors.primary,
            shape: BoxShape.circle,
            boxShadow: [
              if (!_isLoading)
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
            ],
          ),
          child: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.surface,
                  ),
                )
              : Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: AppColors.surface,
                  size: 80,
                ),
        ),
      ),
    );
  }

  /// Build progress bar
  Widget _buildProgressBar() {
    final progress = _totalDuration.inMilliseconds > 0
        ? _currentPosition.inMilliseconds / _totalDuration.inMilliseconds
        : 0.0;

    return Column(
      children: [
        // Progress indicator
        Stack(
          children: [
            // Background
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: AppColors.dividerLight,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            // Progress
            FractionallySizedBox(
              widthFactor: progress.clamp(0.0, 1.0),
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Build time display
  Widget _buildTimeDisplay() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _formatDuration(_currentPosition),
            style: AppTypography.body1.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            _formatDuration(_totalDuration),
            style: AppTypography.body1.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  /// Build control buttons (처음부터, 음성 설정)
  Widget _buildControlButtons() {
    return Row(
      children: [
        // From beginning button
        Expanded(
          child: Semantics(
            button: true,
            label: '처음부터 재생',
            child: GestureDetector(
              onTap: _seekToBeginning,
              child: Container(
                height: 56.0,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: AppColors.dividerLight,
                    width: 2.0,
                  ),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.replay,
                      color: AppColors.textPrimary,
                      size: 20,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      '처음부터',
                      style: AppTypography.button.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        // Voice settings button
        Expanded(
          child: Semantics(
            button: true,
            label: '음성 설정',
            child: GestureDetector(
              onTap: _handleVoiceSettings,
              child: Container(
                height: 56.0,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: AppColors.dividerLight,
                    width: 2.0,
                  ),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      color: AppColors.textPrimary,
                      size: 20,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      '음성 설정',
                      style: AppTypography.button.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Build action buttons
  Widget _buildActionButtons() {
    return Column(
      children: [
        // Feedback button
        Semantics(
          button: true,
          label: '피드백 남기기',
          child: GestureDetector(
            onTap: _handleFeedback,
            child: Container(
              width: double.infinity,
              height: 56.0,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8.0),
              ),
              alignment: Alignment.center,
              child: Text(
                '피드백 남기기',
                style: AppTypography.button.copyWith(
                  color: AppColors.surface,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        // View other artworks button
        Semantics(
          button: true,
          label: '다른 작품 보기',
          child: GestureDetector(
            onTap: _handleViewOtherArtworks,
            child: Container(
              width: double.infinity,
              height: 56.0,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(8.0),
              ),
              alignment: Alignment.center,
              child: Text(
                '다른 작품 보기',
                style: AppTypography.button.copyWith(
                  color: AppColors.surface,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Format duration to readable string (m:ss)
  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds.remainder(60);
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}