import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/core/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductSliderCard extends StatelessWidget {
  final Product product;

  const ProductSliderCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      padding: const EdgeInsets.all(AppSpacing.lg),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.lg),
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primaryContainer,
            context.colorScheme.primaryContainer,
          ],
        ),
      ),

      child: Image.asset(product.image, height: 120, fit: BoxFit.contain),
    );
  }
}
