import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/cart/presentation/components/summary_row.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  final double subtotal;
  final double deliveryFee;
  final double total;
  final VoidCallback onCheckout;

  const CartSummary({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        border: Border(
          top: BorderSide(color: context.colorScheme.outlineVariant),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SummaryRow(label: context.t.products.subtotal, value: subtotal),
            const SizedBox(height: AppSpacing.sm),
            SummaryRow(label: context.t.products.delivery, value: deliveryFee),
            const SizedBox(height: AppSpacing.sm),
            Divider(color: context.colorScheme.outlineVariant),
            const SizedBox(height: AppSpacing.sm),
            SummaryRow(
              label: context.t.products.total,
              value: total,
              isBold: true,
            ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: onCheckout,
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colorScheme.onSurface,
                foregroundColor: context.colorScheme.surface,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.md),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(context.t.products.checkout),
                  const SizedBox(width: AppSpacing.xs),
                  const Icon(Icons.arrow_forward, size: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
