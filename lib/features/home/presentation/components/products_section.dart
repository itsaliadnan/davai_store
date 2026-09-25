import 'package:davai_store/features/products/data/providers/product_provider.dart';
import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/features/products/presentation/view/product_card.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductsSection extends ConsumerWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  context.t.home.newArrivals,
                  style: context.text.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.2,
                  ),
                ),
              ),

              TextButton(
                onPressed: () {
                  context.push('/all-product');
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  context.t.home.showAll,
                  style: context.text.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        /// GRID
        productsAsync.when(
          data: (products) {
            if (products.isEmpty) {
              return Center(
                child: Text(
                  context.t.erorrs.noProductsFound,
                  style: context.text.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 12,
                childAspectRatio: 0.68,
              ),

              itemBuilder: (context, index) {
                if (index >= products.length) {
                  return const SizedBox();
                }

                final product = products[index];

                return ProductCard(product: product);
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(
            child: Column(
              children: [
                Icon(Icons.error, color: context.colorScheme.error),
                const SizedBox(height: 8),
                Text(
                  'حدث خطأ: ${e.toString()}',
                  style: context.text.bodyMedium?.copyWith(
                    color: context.colorScheme.error,
                  ),
                ),
                TextButton(
                  onPressed: () => ref.refresh(productProvider),
                  child: Text(
                    context.t.erorrs.tryAgain,
                    style: context.text.bodyMedium?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
