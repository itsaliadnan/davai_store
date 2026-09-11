import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:flutter/material.dart';

class SortByButton extends StatelessWidget {
  const SortByButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(AppSpacing.lg),
      ),
      child: PopupMenuButton<String>(
        onSelected: (value) {},
        itemBuilder: (context) => [
          const PopupMenuItem(value: 'newest', child: Text('Newest')),
          const PopupMenuItem(
            value: 'price_low',
            child: Text('Price: Low to High'),
          ),
          const PopupMenuItem(
            value: 'price_high',
            child: Text('Price: High to Low'),
          ),
          const PopupMenuItem(value: 'popular', child: Text('Most Popular')),
        ],
        // icon: Icon(Icons.sort, color: context.colorScheme.primary),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.sort, color: context.colorScheme.primary),
            const SizedBox(width: AppSpacing.xs),
            Text(
              'Sort By',
              style: context.text.labelMedium?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
