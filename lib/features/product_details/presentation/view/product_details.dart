import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/features/products/data/model/product_model.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/cart/data/controller/cart_controller.dart';
import 'package:davai_store/features/favorite/controller/favorite_controller.dart';
import 'package:davai_store/features/product_details/presentation/components/circle_button.dart';
import 'package:davai_store/features/product_details/presentation/components/product_slider.dart';
import 'package:davai_store/features/product_details/presentation/components/quantity_selector.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductDetails extends ConsumerStatefulWidget {
  final ProductModel product;

  const ProductDetails({super.key, required this.product});

  @override
  ConsumerState<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends ConsumerState<ProductDetails> {
  int quantity = 1;
  bool _descriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final colors = context.colorScheme;
    final text = context.text;
    final favorites = ref.watch(favoritesProvider);
    final isFav = favorites.contains(product.id);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 130),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ProductSlider(product: product),

                Positioned(
                  top: 8,
                  left: 8,
                  child: SafeArea(
                    bottom: false,
                    child: CircleButton(
                      icon: Icons.arrow_back_ios_new_rounded,
                      onTap: () => context.pop(),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TITLE
                  Text(
                    product.title,
                    style: text.headlineSmall?.copyWith(letterSpacing: -0.3),
                  ),

                  const SizedBox(height: 6),

                  // RATING
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        size: 16,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '4.5',
                        style: text.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // PRICE
                  Text(
                    '${product.price.toStringAsFixed(2)}\$',
                    style: text.headlineSmall?.copyWith(
                      color: colors.error,
                      letterSpacing: -0.5,
                    ),
                  ),

                  const SizedBox(height: 22),

                  // DESCRIPTION
                  Text(context.t.products.description, style: text.titleMedium),

                  const SizedBox(height: 8),

                  Text(
                    product.description.isNotEmpty
                        ? product.description
                        : context.t.products.noDescriptionAvailable,
                    maxLines: _descriptionExpanded ? null : 2,
                    overflow: _descriptionExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                    style: text.bodyMedium?.copyWith(
                      height: 1.6,
                      color: colors.onSurfaceVariant,
                    ),
                  ),

                  if (product.description.length > 90) ...[
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _descriptionExpanded = !_descriptionExpanded;
                        });
                      },
                      child: Text(
                        _descriptionExpanded
                            ? context.t.products.hide
                            : context.t.products.readMore,
                        style: text.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colors.secondary,
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 26),

                  // ========================================================
                  // QUANTITY
                  // ========================================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.t.products.quantity,
                        style: text.titleMedium,
                      ),

                      QuantitySelector(
                        quantity: quantity,
                        onDecrease: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        onIncrease: () {
                          if (quantity < product.stock) {
                            setState(() {
                              quantity++;
                            });
                          }
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  Row(
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: product.stock > 0
                              ? Colors.green
                              : colors.error,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        product.stock > 0
                            ? '${product.stock} items available'
                            : 'Out of stock',
                        style: text.bodyMedium?.copyWith(
                          color: product.stock > 0
                              ? Colors.green
                              : colors.error,
                          fontWeight: FontWeight.w600,
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

      // BOTTOM ACTION
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Row(
            children: [
              // FAVORITE
              SizedBox(
                width: 56,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    ref
                        .read(favoritesProvider.notifier)
                        .toggleFavorite(product.id);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    side: BorderSide(
                      color: isFav ? colors.secondary : colors.outlineVariant,
                    ),
                    shape: const CircleBorder(),
                  ),
                  child: Icon(
                    isFav
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    size: 20,
                    color: isFav ? colors.secondary : colors.onSurface,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // ADD TO CART
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: product.stock <= 0
                        ? null
                        : () {
                            for (int i = 0; i < quantity; i++) {
                              ref
                                  .read(cartProvider.notifier)
                                  .addItem(product, Colors.red);
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(context.t.products.addToCart),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: colors.inverseSurface,
                      foregroundColor: colors.onInverseSurface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.shopping_bag_outlined, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Add to Cart — \$${(product.price * quantity).toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
