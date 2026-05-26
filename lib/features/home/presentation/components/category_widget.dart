import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const CategoryItem({
    super.key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),

        margin: const EdgeInsets.only(right: 12),

        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.shadow,
          ),
          color: isSelected
              ? context.colorScheme.primary
              : context.colorScheme.surfaceContainerHighest,

          borderRadius: BorderRadius.circular(20),
        ),

        child: Text(
          textAlign: TextAlign.center,
          title,
          style: TextStyle(
            color: isSelected
                ? context.colorScheme.secondary
                : context.colorScheme.tertiary,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
