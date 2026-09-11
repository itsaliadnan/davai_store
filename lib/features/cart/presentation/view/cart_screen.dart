import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/cart/presentation/components/item_card.dart';
import 'package:davai_store/features/cart/presentation/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        actionsPadding: const EdgeInsets.only(right: AppSpacing.md),
        title: const Text('Cart'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.lg),

            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                    child: ItemCard(
                      item: item,
                      onDelete: () {
                        ref.read(cartProvider.notifier).removeItem(item);
                      }, onIncrease: () {  }, onDecrease: () {  },
                    ),
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
