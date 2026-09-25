import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmptyCart extends StatelessWidget {
  final BuildContext context;

  const EmptyCart({super.key, required this.context});

  @override
  Widget build(BuildContext _) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 64,
            color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(context.t.products.emptyCart, style: context.text.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          TextButton(
            onPressed: () => context.go('/home'),
            child: Text(context.t.products.startShopping),
          ),
        ],
      ),
    );
  }
}
