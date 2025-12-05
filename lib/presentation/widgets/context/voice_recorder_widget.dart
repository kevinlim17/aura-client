import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/providers/context_provider.dart';
import '../../../domain/usecases/context_management_usecase.dart';
import '../../../data/services/voice_service.dart';

/// Voice recorder widget
class VoiceRecorderWidget extends ConsumerStatefulWidget {
  final Function(RecordingResult) onRecordingComplete;

  const VoiceRecorderWidget({
    super.key,
    required this.onRecordingComplete,
  });

  @override
  ConsumerState<VoiceRecorderWidget> createState() => _VoiceRecorderWidgetState();
}

class _VoiceRecorderWidgetState extends ConsumerState<VoiceRecorderWidget> {
  Timer? _timer;
  Duration _currentDuration = Duration.zero;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() {
        _currentDuration = ref.read(contextManagementUseCaseProvider).recordingDuration;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> _startRecording() async {
    final notifier = ref.read(contextNotifierProvider.notifier);

    // Request permission first
    final hasPermission = await notifier.requestMicrophonePermission();
    if (!hasPermission) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('마이크 권한이 필요합니다'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    await notifier.startRecording();
    _startTimer();
  }

  Future<void> _stopRecording() async {
    final notifier = ref.read(contextNotifierProvider.notifier);
    final result = await notifier.stopRecording();
    _stopTimer();

    if (result != null) {
      widget.onRecordingComplete(result);
    }
  }

  Future<void> _pauseRecording() async {
    final notifier = ref.read(contextNotifierProvider.notifier);
    await notifier.pauseRecording();
    _stopTimer();
  }

  Future<void> _resumeRecording() async {
    final notifier = ref.read(contextNotifierProvider.notifier);
    await notifier.resumeRecording();
    _startTimer();
  }

  Future<void> _cancelRecording() async {
    final notifier = ref.read(contextNotifierProvider.notifier);
    await notifier.cancelRecording();
    _stopTimer();
    setState(() {
      _currentDuration = Duration.zero;
    });
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds.remainder(60);
    final milliseconds = (duration.inMilliseconds.remainder(1000) / 10).floor();
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.${milliseconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final contextState = ref.watch(contextNotifierProvider);
    final useCase = ref.watch(contextManagementUseCaseProvider);
    final recordingState = useCase.recordingState;

    final isIdle = recordingState == RecordingState.idle;
    final isRecording = recordingState == RecordingState.recording;
    final isPaused = recordingState == RecordingState.paused;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade200, width: 2),
      ),
      child: Column(
        children: [
          // Recording status
          Icon(
            isRecording ? Icons.mic : Icons.mic_none,
            size: 64,
            color: isRecording ? Colors.red : Colors.blue,
          ),
          const SizedBox(height: 16),

          // Duration display
          Text(
            _formatDuration(_currentDuration),
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: isRecording ? Colors.red : Colors.blue,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
          const SizedBox(height: 8),

          // Status text
          Text(
            isRecording
                ? '녹음 중...'
                : isPaused
                    ? '일시정지됨'
                    : '녹음 대기',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),

          // Control buttons
          if (isIdle) ...[
            ElevatedButton.icon(
              onPressed: _startRecording,
              icon: const Icon(Icons.fiber_manual_record),
              label: const Text('녹음 시작'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ] else ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Pause/Resume button
                IconButton(
                  onPressed: isRecording ? _pauseRecording : _resumeRecording,
                  icon: Icon(isRecording ? Icons.pause : Icons.play_arrow),
                  iconSize: 32,
                  color: Colors.blue,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(12),
                  ),
                ),
                const SizedBox(width: 16),

                // Stop button
                IconButton(
                  onPressed: _stopRecording,
                  icon: const Icon(Icons.stop),
                  iconSize: 32,
                  color: Colors.white,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(12),
                  ),
                ),
                const SizedBox(width: 16),

                // Cancel button
                IconButton(
                  onPressed: _cancelRecording,
                  icon: const Icon(Icons.close),
                  iconSize: 32,
                  color: Colors.white,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(12),
                  ),
                ),
              ],
            ),
          ],

          const SizedBox(height: 16),

          // Instructions
          Text(
            isIdle
                ? '버튼을 눌러 녹음을 시작하세요'
                : isRecording
                    ? '일시정지, 중지 또는 취소할 수 있습니다'
                    : '재개, 중지 또는 취소할 수 있습니다',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
