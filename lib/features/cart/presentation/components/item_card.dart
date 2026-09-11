import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/model/cart_items_model.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onDelete;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const ItemCard({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    final product = item.product;

    return Stack(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 60,
                  decoration: BoxDecoration(
                    color: context.colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(AppSpacing.md),
                  ),
                  child: product.image == null || product.image!.isEmpty
                      ? const Icon(Icons.image_not_supported)
                      : Image.asset(
                          product.image!,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.image_not_supported);
                          },
                        ),
                ),

                const SizedBox(width: AppSpacing.lg),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: AppSpacing.lg,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: AppSpacing.sm),

                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: item.selectedColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.colorScheme.outline,
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${product.price}',
                            style: TextStyle(
                              fontSize: AppSpacing.lg,
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.all(AppSpacing.xs),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: context.colorScheme.outlineVariant,
                              ),
                              color: context.colorScheme.surfaceContainer,
                              borderRadius: BorderRadius.circular(
                                AppSpacing.sm,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: onDecrease,
                                  child: const SizedBox(
                                    width: 28,
                                    height: 28,
                                    child: Icon(Icons.remove),
                                  ),
                                ),

                                const SizedBox(width: AppSpacing.sm),

                                Text(
                                  '${item.quantity}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(width: AppSpacing.sm),

                                InkWell(
                                  onTap: onIncrease,
                                  child: const SizedBox(
                                    width: 28,
                                    height: 28,
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
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

        Positioned(
          top: 6,
          right: 6,
          child: GestureDetector(
            onTap: onDelete,
            child: const Icon(Icons.close, size: 16),
          ),
        ),
      ],
    );
  }
}
