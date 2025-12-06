import 'package:flutter/material.dart';
import '../../../domain/entities/context_entity.dart';

/// Context type selector widget
class ContextTypeSelector extends StatelessWidget {
  final ContextType selectedType;
  final ValueChanged<ContextType> onTypeSelected;

  const ContextTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '컨텍스트 타입',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: ContextType.values.map((type) {
            final isSelected = type == selectedType;
            return ChoiceChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    type.icon,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 8),
                  Text(type.displayName),
                ],
              ),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  onTypeSelected(type);
                }
              },
              selectedColor: _getColorForType(type).withValues(alpha: 0.3),
              backgroundColor: Colors.grey.shade200,
              labelStyle: TextStyle(
                color: isSelected ? _getColorForType(type) : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Text(
          selectedType.description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Color _getColorForType(ContextType type) {
    switch (type) {
      case ContextType.memory:
        return Colors.blue;
      case ContextType.experience:
        return Colors.purple;
      case ContextType.emotion:
        return Colors.pink;
      case ContextType.travel:
        return Colors.green;
    }
  }
}
