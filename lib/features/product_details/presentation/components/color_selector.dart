import 'package:flutter/material.dart';

class ColorSelector extends StatelessWidget {
  final List<Color> colors;
  final Color selectedColor;
  final Function(Color) onSelect;

  const ColorSelector({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: colors.map((color) {
        final isSelected = selectedColor == color;

        return GestureDetector(
          onTap: () => onSelect(color),
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.black : Colors.grey.shade300,
                width: isSelected ? 3 : 1,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
