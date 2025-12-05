import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/context_entity.dart';
import '../../../domain/entities/context_state.dart';
import '../../../domain/providers/context_provider.dart';
import '../../../domain/providers/auth_provider.dart';
import '../../../domain/usecases/context_management_usecase.dart';
import '../../widgets/context/emotion_tags_selector.dart';
import '../../widgets/context/importance_slider.dart';
import '../../widgets/context/voice_recorder_widget.dart';
import '../../widgets/context/context_list_item.dart';

/// Context input screen with tabs and list
class ContextInputScreen extends ConsumerStatefulWidget {
  final ContextType? initialContextType;
  final bool isCompanionInput;
  final int? companionUserId;

  const ContextInputScreen({
    super.key,
    this.initialContextType,
    this.isCompanionInput = false,
    this.companionUserId,
  });

  @override
  ConsumerState<ContextInputScreen> createState() => _ContextInputScreenState();
}

class _ContextInputScreenState extends ConsumerState<ContextInputScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ContextType _selectedContextType;

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  int _importanceLevel = 3;
  List<String> _selectedEmotionTags = [];
  InputMethod _inputMethod = InputMethod.text;
  String? _recordedVoiceFilePath;
  Duration? _recordedVoiceDuration;

  bool _showInputForm = false;

  @override
  void initState() {
    super.initState();
    _selectedContextType = widget.initialContextType ?? ContextType.memory;

    // Initialize tab controller
    _tabController = TabController(
      length: ContextType.values.length,
      vsync: this,
      initialIndex: ContextType.values.indexOf(_selectedContextType),
    );

    _tabController.addListener(_onTabChanged);

    // Listen to content changes for emotion tag recommendations
    _contentController.addListener(_onContentChanged);

    // Load contexts for initial type
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadContexts();
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _selectedContextType = ContextType.values[_tabController.index];
      });
      _loadContexts();
    }
  }

  void _loadContexts() {
    ref.read(contextListNotifierProvider.notifier).refreshContexts(
          contextType: _selectedContextType,
        );
  }

  void _onContentChanged() {
    final content = _contentController.text;
    if (content.length > 20) {
      ref.read(emotionTagsNotifierProvider.notifier).getRecommendedTags(content);
    }
  }

  void _switchToTextInput() {
    setState(() {
      _inputMethod = InputMethod.text;
      _recordedVoiceFilePath = null;
      _recordedVoiceDuration = null;
    });
  }

  void _switchToVoiceInput() {
    setState(() {
      _inputMethod = InputMethod.voice;
    });
  }

  void _onRecordingComplete(RecordingResult result) {
    setState(() {
      _recordedVoiceFilePath = result.filePath;
      _recordedVoiceDuration = result.duration;
    });
  }

  Future<void> _submit() async {
    final notifier = ref.read(contextNotifierProvider.notifier);

    if (_inputMethod == InputMethod.text) {
      final content = _contentController.text.trim();
      if (content.isEmpty) {
        _showError('내용을 입력해주세요');
        return;
      }

      await notifier.submitTextContext(
        contextType: _selectedContextType,
        content: content,
        title: _titleController.text.trim().isEmpty
            ? null
            : _titleController.text.trim(),
        emotionTags: _selectedEmotionTags,
        importanceLevel: _importanceLevel,
        isCompanionInput: widget.isCompanionInput,
        companionUserId: widget.companionUserId,
      );
    } else {
      if (_recordedVoiceFilePath == null) {
        _showError('먼저 음성을 녹음해주세요');
        return;
      }

      await notifier.submitVoiceContext(
        contextType: _selectedContextType,
        voiceFilePath: _recordedVoiceFilePath!,
        title: _titleController.text.trim().isEmpty
            ? null
            : _titleController.text.trim(),
        transcribedText: _contentController.text.trim().isEmpty
            ? null
            : _contentController.text.trim(),
        emotionTags: _selectedEmotionTags,
        importanceLevel: _importanceLevel,
        isCompanionInput: widget.isCompanionInput,
        companionUserId: widget.companionUserId,
        autoTranscribe: true,
      );
    }
  }

  void _resetForm() {
    _titleController.clear();
    _contentController.clear();
    setState(() {
      _importanceLevel = 3;
      _selectedEmotionTags = [];
      _inputMethod = InputMethod.text;
      _recordedVoiceFilePath = null;
      _recordedVoiceDuration = null;
      _showInputForm = false;
    });
    ref.read(emotionTagsNotifierProvider.notifier).reset();
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<void> _deleteContext(ContextEntity context) async {
    final confirmed = await showDialog<bool>(
      context: this.context,
      builder: (context) => AlertDialog(
        title: const Text('컨텍스트 삭제'),
        content: const Text('이 컨텍스트를 삭제하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('삭제'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final useCase = ref.read(contextManagementUseCaseProvider);
        final token = ref.read(currentTokenProvider);
        final user = ref.read(currentUserProvider);

        if (token != null && user != null) {
          await useCase.deleteContext(
            token: token,
            userId: int.parse(user.id),
            contextId: context.id,
          );
          _showSuccess('컨텍스트가 삭제되었습니다');
          _loadContexts();
        }
      } catch (e) {
        _showError('삭제에 실패했습니다: ${e.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen to context state changes
    ref.listen<ContextState>(contextNotifierProvider, (previous, next) {
      next.when(
        idle: () {},
        loading: () {},
        submitting: (message) {},
        success: (context, message) {
          _showSuccess(message);
          _resetForm();
          _loadContexts();
        },
        error: (message, code) {
          _showError(message);
        },
        recording: (recordingState, duration) {},
      );
    });

    final contextState = ref.watch(contextNotifierProvider);
    final isSubmitting = contextState.maybeWhen(
      submitting: (_) => true,
      orElse: () => false,
    );

    final contexts = ref.watch(contextsProvider);
    final isLoadingContexts = ref.watch(isLoadingContextsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isCompanionInput ? '동행자 컨텍스트' : '컨텍스트 관리',
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: ContextType.values.map((type) {
            return Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(type.icon, style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 4),
                  Text(type.displayName),
                ],
              ),
            );
          }).toList(),
        ),
      ),
      body: Column(
        children: [
          // Input form (collapsible)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _showInputForm ? null : 0,
            child: _showInputForm
                ? SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Input mode toggle
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SegmentedButton<InputMethod>(
                              segments: const [
                                ButtonSegment(
                                  value: InputMethod.text,
                                  icon: Icon(Icons.keyboard, size: 18),
                                  label: Text('텍스트'),
                                ),
                                ButtonSegment(
                                  value: InputMethod.voice,
                                  icon: Icon(Icons.mic, size: 18),
                                  label: Text('음성'),
                                ),
                              ],
                              selected: {_inputMethod},
                              onSelectionChanged: (Set<InputMethod> selected) {
                                if (selected.first == InputMethod.text) {
                                  _switchToTextInput();
                                } else {
                                  _switchToVoiceInput();
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Title input
                        TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            labelText: '제목 (선택)',
                            hintText: '컨텍스트 제목을 입력하세요',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.title),
                          ),
                          enabled: !isSubmitting,
                        ),
                        const SizedBox(height: 16),

                        // Content input or voice recorder
                        if (_inputMethod == InputMethod.text) ...[
                          TextField(
                            controller: _contentController,
                            decoration: InputDecoration(
                              labelText: '내용',
                              hintText: '당신의 이야기를 들려주세요',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              prefixIcon: const Icon(Icons.edit),
                            ),
                            maxLines: 6,
                            enabled: !isSubmitting,
                          ),
                        ] else ...[
                          VoiceRecorderWidget(
                            onRecordingComplete: _onRecordingComplete,
                          ),
                          if (_recordedVoiceFilePath != null) ...[
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.green),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.check_circle,
                                      color: Colors.green),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      '녹음 완료 (${_recordedVoiceDuration?.inSeconds}초)',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      setState(() {
                                        _recordedVoiceFilePath = null;
                                        _recordedVoiceDuration = null;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                        const SizedBox(height: 16),

                        // Emotion tags selector
                        EmotionTagsSelector(
                          selectedTags: _selectedEmotionTags,
                          onTagsChanged: (tags) {
                            setState(() {
                              _selectedEmotionTags = tags;
                            });
                          },
                        ),
                        const SizedBox(height: 16),

                        // Importance slider
                        ImportanceSlider(
                          level: _importanceLevel,
                          onLevelChanged: (level) {
                            setState(() {
                              _importanceLevel = level;
                            });
                          },
                        ),
                        const SizedBox(height: 24),

                        // Action buttons
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: isSubmitting ? null : _resetForm,
                                style: OutlinedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text('취소'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                onPressed: isSubmitting ? null : _submit,
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: isSubmitting
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2),
                                      )
                                    : const Text(
                                        '저장',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),

          // Divider
          if (_showInputForm) const Divider(height: 1),

          // Context list
          Expanded(
            child: Column(
              children: [
                // List header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        '저장된 ${_selectedContextType.displayName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${contexts.length}개',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

                // List content
                Expanded(
                  child: isLoadingContexts
                      ? const Center(child: CircularProgressIndicator())
                      : contexts.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.inbox,
                                    size: 64,
                                    color: Colors.grey.shade400,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    '저장된 컨텍스트가 없습니다',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '새로운 ${_selectedContextType.displayName}을(를) 추가해보세요',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : RefreshIndicator(
                              onRefresh: () async => _loadContexts(),
                              child: ListView.builder(
                                itemCount: contexts.length,
                                itemBuilder: (context, index) {
                                  final contextItem = contexts[index];
                                  return ContextListItem(
                                    context: contextItem,
                                    onTap: () {
                                      // TODO: Navigate to detail view
                                    },
                                    onEdit: () {
                                      // TODO: Implement edit functionality
                                      _showError('수정 기능은 준비 중입니다');
                                    },
                                    onDelete: () =>
                                        _deleteContext(contextItem),
                                  );
                                },
                              ),
                            ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _showInputForm = !_showInputForm;
          });
        },
        icon: Icon(_showInputForm ? Icons.close : Icons.add),
        label: Text(_showInputForm ? '닫기' : '새 컨텍스트'),
      ),
    );
  }
}
