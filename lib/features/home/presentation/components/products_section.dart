import 'package:davai_store/core/data/mock/product_mock_data.dart';
import 'package:davai_store/features/home/presentation/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:davai_store/core/theme/spacing.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'وصل حديثًا',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              TextButton(onPressed: () {}, child: const Text('عرض الكل')),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.sm),

        // Cards list
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: AppSpacing.md,
            crossAxisSpacing: AppSpacing.md,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(product: product);
          },
        ),
      ],
    );
  }
}
