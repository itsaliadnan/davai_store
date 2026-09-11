import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/model/product_model.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/cart/presentation/controller/cart_controller.dart';
import 'package:davai_store/features/product_details/presentation/components/product_slider.dart';
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

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final colors = context.colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,

      // ============================================================
      // APP BAR
      // ============================================================
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,

        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: _CircleButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () => context.pop(),
          ),
        ),

        title: Text(
          'Product Details',
          style: context.text.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _CircleButton(
              icon: Icons.favorite_border_rounded,
              onTap: () {
                // TODO: Favorite
              },
            ),
          ),
        ],
      ),

      // ============================================================
      // BODY
      // ============================================================
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            // PRODUCT IMAGES
            ProductSlider(product: product),

            const SizedBox(height: 28),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ========================================================
                  // TITLE
                  // ========================================================
                  Text(
                    product.title,
                    style: context.text.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // ========================================================
                  // PRICE + RATING
                  // ========================================================
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${product.price.toStringAsFixed(2)}\$',
                        style: context.text.headlineSmall?.copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      const Spacer(),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              size: 17,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '4.5',
                              style: context.text.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Divider(height: 1, color: colors.outlineVariant),

                  const SizedBox(height: 24),

                  // ========================================================
                  // DESCRIPTION
                  // ========================================================
                  Text(
                    'Description',
                    style: context.text.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    product.description.isNotEmpty
                        ? product.description
                        : 'No description available.',
                    style: context.text.bodyMedium?.copyWith(
                      height: 1.65,
                      color: colors.onSurfaceVariant,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ========================================================
                  // QUANTITY
                  // ========================================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity',
                        style: context.text.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      _QuantitySelector(
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

                  const SizedBox(height: 26),

                  // ========================================================
                  // STOCK
                  // ========================================================
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: product.stock > 0
                          ? Colors.green.withValues(alpha: 0.08)
                          : colors.error.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          product.stock > 0
                              ? Icons.check_circle_rounded
                              : Icons.cancel_rounded,
                          size: 19,
                          color: product.stock > 0
                              ? Colors.green
                              : colors.error,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          product.stock > 0
                              ? '${product.stock} items available'
                              : 'Out of stock',
                          style: context.text.bodyMedium?.copyWith(
                            color: product.stock > 0
                                ? Colors.green
                                : colors.error,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ============================================================
      // BOTTOM ACTION
      // ============================================================
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          decoration: BoxDecoration(
            color: colors.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 20,
                offset: const Offset(0, -6),
              ),
            ],
          ),
          child: Row(
            children: [
              // TOTAL
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: context.text.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${(product.price * quantity).toStringAsFixed(2)}\$',
                      style: context.text.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // ADD TO CART
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 54,
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
                              const SnackBar(
                                content: Text('Added to cart'),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_bag_outlined, size: 21),
                        SizedBox(width: 8),
                        Text(
                          'Add to Cart',
                          style: TextStyle(fontWeight: FontWeight.w700),
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

// ============================================================
// CIRCLE BUTTON
// ============================================================

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Material(
      color: colors.surfaceContainerHighest,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(icon, size: 18, color: colors.onSurface),
        ),
      ),
    );
  }
}

// ============================================================
// QUANTITY SELECTOR
// ============================================================

class _QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  const _QuantitySelector({
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onDecrease,
            icon: const Icon(Icons.remove_rounded, size: 18),
          ),
          Text(
            '$quantity',
            style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          IconButton(
            onPressed: onIncrease,
            icon: const Icon(Icons.add_rounded, size: 18),
          ),
        ],
      ),
    );
  }
}
