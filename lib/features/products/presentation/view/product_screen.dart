import 'package:davai_store/features/products/data/providers/product_provider.dart';
import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/products/presentation/view/product_card.dart';
import 'package:davai_store/features/search/presentation/components/sorted_button.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllProductsScreen extends ConsumerStatefulWidget {
  const AllProductsScreen({super.key});

  @override
  ConsumerState<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends ConsumerState<AllProductsScreen> {
  String _sort = 'newest';

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final text = context.text;
    final productsAsync = ref.watch(productProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.md,
                0,
              ),
              child: Row(
                children: [
                  Material(
                    color: colors.surfaceContainer,
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () => Navigator.of(context).pop(),
                      child: SizedBox(
                        width: 36,
                        height: 36,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 16,
                          color: colors.onSurface,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    context.t.products.allProducts,
                    style: text.headlineSmall?.copyWith(letterSpacing: -0.3),
                  ),
                ],
              ),
            ),
            Expanded(
              child: productsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(
                  child: Text(
                    'حدث خطأ: $e',
                    style: text.bodyMedium?.copyWith(color: colors.error),
                  ),
                ),
                data: (allProducts) {
                  var products = allProducts;

                  switch (_sort) {
                    case 'newest':
                      break;
                    case 'price_low':
                      products = [...products]
                        ..sort((a, b) => a.price.compareTo(b.price));
                      break;
                    case 'price_high':
                      products = [...products]
                        ..sort((a, b) => b.price.compareTo(a.price));
                      break;
                    case 'popular':
                      products = [...products]
                        ..sort((a, b) => b.salesCount.compareTo(a.salesCount));
                      break;
                  }

                  if (products.isEmpty) {
                    return Center(
                      child: Text(
                        context.t.products.noProducts,
                        style: text.bodyMedium?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    );
                  }

                  return CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${products.length} منتج',
                                  style: text.bodyMedium?.copyWith(
                                    color: colors.onSurfaceVariant,
                                  ),
                                ),
                                SortByButton(
                                  onSelected: (value) =>
                                      setState(() => _sort = value),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(
                          AppSpacing.md,
                          0,
                          AppSpacing.md,
                          24,
                        ),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 12,
                                childAspectRatio: 0.68,
                              ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) =>
                                ProductCard(product: products[index]),
                            childCount: products.length,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
