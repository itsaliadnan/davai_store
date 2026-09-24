import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/features/cart/data/controller/cart_controller.dart';
import 'package:davai_store/features/products/data/model/product_model.dart';
import 'package:davai_store/features/favorite/controller/favorite_controller.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends ConsumerWidget {
  final ProductModel product;

  final int? discountPercent;

  const ProductCard({super.key, required this.product, this.discountPercent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final isFav = favorites.contains(product.id);

    return GestureDetector(
      onTap: () {
        context.push('/product-details', extra: product);
      },
      child: Container(
        width: 260,
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: context.colorScheme.outline.withValues(alpha: 0.15),
            width: 0.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1.1,
                    child: Container(
                      width: double.infinity,
                      color: context.colorScheme.surfaceContainer,
                      child: product.image != null && product.image!.isNotEmpty
                          ? Image.network(
                              product.image!,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  const Icon(Icons.broken_image),
                            )
                          : const Icon(Icons.image),
                    ),
                  ),

                  Positioned(
                    top: 10,
                    left: 10,
                    child: GestureDetector(
                      onTap: () {
                        ref
                            .read(favoritesProvider.notifier)
                            .toggleFavorite(product.id);
                      },
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: context.colorScheme.surfaceContainerHigh,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          size: 16,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),

                  if (discountPercent != null)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: context.colorScheme.error,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'خصم $discountPercent٪',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(18, 12, 18, 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                        height: 1.2,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: context.colorScheme.error,
                          ),
                        ),
                        GestureDetector(
                          onTap: product.stock <= 0
                              ? null
                              : () {
                                  ref
                                      .read(cartProvider.notifier)
                                      .addItem(
                                        product,
                                        context.colorScheme.error,
                                      );

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        context.t.products.addToCart,
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              color: context.colorScheme.secondary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 16,
                              color: context.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
