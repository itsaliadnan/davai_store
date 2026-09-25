import 'package:davai_store/core/data/providers/settings_provider.dart';
import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/cart/data/controller/cart_controller.dart';
import 'package:davai_store/features/cart/data/model/cart_items_model.dart';
import 'package:davai_store/features/cart/presentation/components/cart_summary.dart';
import 'package:davai_store/features/cart/presentation/components/empty_cart.dart';
import 'package:davai_store/features/cart/presentation/components/item_card.dart';
import 'package:davai_store/features/navbar/navigation_bar.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  double _calculateSubtotal(List<CartItem> cartItems) {
    return cartItems.fold<double>(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  Future<void> _confirmClearCart(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.t.products.clearCartTitle),
        content: Text(context.t.products.clearCartMessage),
        actions: [
          TextButton(
            onPressed: () => context.pop(false),
            child: Text(context.t.products.cancel),
          ),
          TextButton(
            onPressed: () => context.pop(true),
            child: Text(
              context.t.products.confirm,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      ref.read(cartProvider.notifier).clearItems();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final deliveryFeeAsync = ref.watch(effectiveDeliveryFeeProvider);

    final subtotal = _calculateSubtotal(cartItems);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.t.products.cart, style: context.text.titleMedium),
            Text(
              '${cartItems.length} ${context.t.products.items}',
              style: context.text.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actionsPadding: const EdgeInsets.only(right: AppSpacing.md),
        actions: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(AppSpacing.lg),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
                size: 18,
              ),
              onPressed: cartItems.isEmpty
                  ? null
                  : () => _confirmClearCart(context, ref),
            ),
          ),
        ],
      ),

      body: cartItems.isEmpty
          ? EmptyCart(context: context)
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                        child: ItemCard(
                          item: item,
                          onDelete: () {
                            ref.read(cartProvider.notifier).removeItem(item);
                          },
                          onIncrease: () {
                            ref
                                .read(cartProvider.notifier)
                                .increaseQuantity(index);
                          },
                          onDecrease: () {
                            ref
                                .read(cartProvider.notifier)
                                .decreaseQuantity(index);
                          },
                        ),
                      );
                    },
                  ),
                ),

                deliveryFeeAsync.when(
                  loading: () => const Padding(
                    padding: EdgeInsets.all(AppSpacing.lg),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (err, _) => CartSummary(
                    subtotal: subtotal,
                    deliveryFee: 0,
                    total: subtotal,
                    onCheckout: () => context.push('/checkout'),
                  ),
                  data: (deliveryFee) => CartSummary(
                    subtotal: subtotal,
                    deliveryFee: deliveryFee,
                    total: subtotal + deliveryFee,
                    onCheckout: () => context.push('/checkout'),
                  ),
                ),
                SizedBox(height: LuxeBottomNavBar.totalHeight),
              ],
            ),
    );
  }
}
