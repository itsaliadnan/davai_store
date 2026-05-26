import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:flutter/material.dart';

class SortByButton extends StatelessWidget {
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
        onSelected: (value) {
          // TODO: handle sorting logic
        },
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.sort, size: 18, color: context.colorScheme.primary),
            const SizedBox(width: 4),
            Text(
              'Sort',
              style: TextStyle(
                color: context.colorScheme.primary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
