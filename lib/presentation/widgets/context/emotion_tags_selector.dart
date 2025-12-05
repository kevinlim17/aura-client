import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/providers/context_provider.dart';

/// Emotion tags selector widget
class EmotionTagsSelector extends ConsumerStatefulWidget {
  final List<String> selectedTags;
  final ValueChanged<List<String>> onTagsChanged;

  const EmotionTagsSelector({
    super.key,
    required this.selectedTags,
    required this.onTagsChanged,
  });

  @override
  ConsumerState<EmotionTagsSelector> createState() => _EmotionTagsSelectorState();
}

class _EmotionTagsSelectorState extends ConsumerState<EmotionTagsSelector> {
  final _customTagController = TextEditingController();

  // Predefined emotion tags
  static const List<String> _predefinedTags = [
    '행복함',
    '슬픔',
    '평온함',
    '그리움',
    '설렘',
    '감사함',
    '외로움',
    '즐거움',
    '불안함',
    '편안함',
    '후회',
    '희망',
  ];

  @override
  void dispose() {
    _customTagController.dispose();
    super.dispose();
  }

  void _toggleTag(String tag) {
    final newTags = List<String>.from(widget.selectedTags);
    if (newTags.contains(tag)) {
      newTags.remove(tag);
    } else {
      if (newTags.length < 5) {
        // Limit to 5 tags
        newTags.add(tag);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('최대 5개의 감정 태그만 선택할 수 있습니다'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
    widget.onTagsChanged(newTags);
  }

  void _addCustomTag() {
    final tag = _customTagController.text.trim();
    if (tag.isEmpty) return;

    if (widget.selectedTags.contains(tag)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('이미 추가된 태그입니다'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (widget.selectedTags.length >= 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('최대 5개의 감정 태그만 선택할 수 있습니다'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final newTags = List<String>.from(widget.selectedTags)..add(tag);
    widget.onTagsChanged(newTags);
    _customTagController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final recommendedTags = ref.watch(recommendedEmotionTagsProvider);
    final isLoadingTags = ref.watch(isLoadingEmotionTagsProvider);

    // Combine predefined tags with recommended tags
    final allTags = <String>{
      ..._predefinedTags,
      ...recommendedTags,
    }.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              '감정 태그',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            if (isLoadingTags)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            if (recommendedTags.isNotEmpty && !isLoadingTags)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '추천',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          '최대 5개까지 선택 가능',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 12),

        // Selected tags
        if (widget.selectedTags.isNotEmpty) ...[
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.selectedTags.map((tag) {
              final isRecommended = recommendedTags.contains(tag);
              return Chip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isRecommended) ...[
                      const Icon(Icons.auto_awesome, size: 14, color: Colors.blue),
                      const SizedBox(width: 4),
                    ],
                    Text(tag),
                  ],
                ),
                onDeleted: () => _toggleTag(tag),
                deleteIconColor: Colors.white,
                backgroundColor: Colors.pink.shade400,
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
        ],

        // Available tags
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: allTags.map((tag) {
            final isSelected = widget.selectedTags.contains(tag);
            if (isSelected) return const SizedBox.shrink();

            final isRecommended = recommendedTags.contains(tag);
            return ActionChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isRecommended) ...[
                    const Icon(Icons.auto_awesome, size: 14, color: Colors.blue),
                    const SizedBox(width: 4),
                  ],
                  Text(tag),
                ],
              ),
              onPressed: () => _toggleTag(tag),
              backgroundColor: isRecommended ? Colors.blue.shade50 : Colors.grey.shade200,
              side: BorderSide(
                color: isRecommended ? Colors.blue : Colors.grey.shade400,
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 16),

        // Custom tag input
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _customTagController,
                decoration: InputDecoration(
                  labelText: '커스텀 태그 추가',
                  hintText: '나만의 감정 태그를 입력하세요',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.add),
                ),
                onSubmitted: (_) => _addCustomTag(),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.add_circle),
              color: Colors.pink,
              iconSize: 32,
              onPressed: _addCustomTag,
            ),
          ],
        ),
      ],
    );
  }
}
