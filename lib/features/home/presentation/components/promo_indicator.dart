import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class PromoIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const PromoIndicator({
    super.key,
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: List.generate(itemCount, (index) {
        final isActive = index == currentIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),

          margin: const EdgeInsets.symmetric(horizontal: 4),

          height: 8,

          width: isActive ? 24 : 8,

          decoration: BoxDecoration(
            color: isActive
                ? context.colorScheme.tertiaryContainer
                : context.colorScheme.onTertiary,

            borderRadius: BorderRadius.circular(20),
          ),
        );
      }),
    );
  }
}
