import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/model/product_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const CategoryCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  color: context.colorScheme.onSurfaceVariant.withValues(
                    alpha: 0.1,
                  ),
                ),
                child: product.image.isEmpty
                    ? const Icon(Icons.image, size: 50)
                    : Image.network(
                        product.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.broken_image),
                      ),
              ),
            ),

            /// 🔥 اسم المنتج
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
