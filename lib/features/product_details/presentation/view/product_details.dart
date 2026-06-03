import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/model/product_model.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/cart/presentation/controller/cart_controller.dart';
import 'package:davai_store/features/product_details/presentation/components/color_selector.dart';
import 'package:davai_store/features/product_details/presentation/components/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductDetails extends ConsumerStatefulWidget {
  const ProductDetails({super.key});

  @override
  ConsumerState<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends ConsumerState<ProductDetails> {
  Color selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              icon: Icon(
                size: 16,
                Icons.notifications_none,
                color: context.colorScheme.primary,
              ),
              onPressed: () {
                context.go('/notifications');
              },
            ),
          ),
        ],
        title: Text('Product Details'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductSlider(),
              SizedBox(height: AppSpacing.lg),

              Padding(
                padding: const EdgeInsets.only(left: AppSpacing.lg),
                child: Text(
                  'sumsetlamp',
                  style: context.textTheme.headlineLarge,
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: AppSpacing.lg),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "4.5",
                      style: context.textTheme.bodyLarge,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "120\$",

                      style: context.textTheme.bodyLarge,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              ColorSelector(
                colors: [Colors.red, Colors.blue, Colors.green, Colors.orange],
                selectedColor: selectedColor,
                onSelect: (color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              ),
              Divider(
                height: AppSpacing.lg,
                thickness: 1,
                color: context.colorScheme.outlineVariant,
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ref
                    .read(cartProvider.notifier)
                    .addItem(
                      Product(
                        title: 'sumsetlamp',
                        price: 120,
                        selectedColor: selectedColor,
                        image: '',
                      ),
                    );

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Added to cart')));
              },
              child: const Text("Add to Cart"),
            ),
          ),
        ),
      ),
    );
  }
}
