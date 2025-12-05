import 'package:flutter/material.dart';

/// Importance level selector widget (star rating style)
class ImportanceLevelSelector extends StatelessWidget {
  final int level;
  final ValueChanged<int> onLevelChanged;

  const ImportanceLevelSelector({
    super.key,
    required this.level,
    required this.onLevelChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '중요도',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.amber.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.amber.shade200),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final starLevel = index + 1;
                  final isSelected = starLevel <= level;
                  return GestureDetector(
                    onTap: () => onLevelChanged(starLevel),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        isSelected ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 36,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 8),
              Text(
                _getLevelLabel(level),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getLevelLabel(int level) {
    switch (level) {
      case 1:
        return '매우 낮음';
      case 2:
        return '낮음';
      case 3:
        return '보통';
      case 4:
        return '높음';
      case 5:
        return '매우 높음';
      default:
        return '보통';
    }
  }
}
