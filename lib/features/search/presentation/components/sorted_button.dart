import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';

class SortByButton extends StatelessWidget {
  final ValueChanged<String> onSelected;

  const SortByButton({super.key, required this.onSelected});

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
        onSelected: onSelected,
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'newest',
            child: Text(context.t.products.newest),
          ),
          PopupMenuItem(
            value: 'price_low',
            child: Text(context.t.products.priceLowtoHigh),
          ),
          PopupMenuItem(
            value: 'price_high',
            child: Text(context.t.products.priceHightoLow),
          ),
          PopupMenuItem(
            value: 'popular',
            child: Text(context.t.products.mostPopular),
          ),
        ],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.sort, color: context.colorScheme.onSurfaceVariant),
            const SizedBox(width: AppSpacing.xs),
            Text(
              context.t.products.sortBy,
              style: context.text.labelMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
