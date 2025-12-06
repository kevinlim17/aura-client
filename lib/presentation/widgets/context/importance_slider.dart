import 'package:flutter/material.dart';

/// Importance level slider widget
class ImportanceSlider extends StatelessWidget {
  final int level;
  final ValueChanged<int> onLevelChanged;

  const ImportanceSlider({
    super.key,
    required this.level,
    required this.onLevelChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '중요도',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _getLevelLabel(level),
              style: TextStyle(
                fontSize: 14,
                color: _getColorForLevel(level),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: _getColorForLevel(level),
                  inactiveTrackColor: Colors.grey.shade300,
                  thumbColor: _getColorForLevel(level),
                  overlayColor: _getColorForLevel(level).withValues(alpha: 0.2),
                  valueIndicatorColor: _getColorForLevel(level),
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 12,
                  ),
                  overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 24,
                  ),
                  trackHeight: 6,
                  valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                  valueIndicatorTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Slider(
                  value: level.toDouble(),
                  min: 1,
                  max: 5,
                  divisions: 4,
                  label: _getLevelLabel(level),
                  onChanged: (value) => onLevelChanged(value.round()),
                ),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _getColorForLevel(level).withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  level.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _getColorForLevel(level),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Level indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            final starLevel = index + 1;
            final isActive = starLevel <= level;
            return Expanded(
              child: Center(
                child: Icon(
                  Icons.star,
                  color: isActive
                      ? _getColorForLevel(level)
                      : Colors.grey.shade300,
                  size: 20,
                ),
              ),
            );
          }),
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

  Color _getColorForLevel(int level) {
    switch (level) {
      case 1:
        return Colors.grey;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.green;
      case 4:
        return Colors.orange;
      case 5:
        return Colors.red;
      default:
        return Colors.green;
    }
  }
}
