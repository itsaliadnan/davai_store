import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class ProductSliderCard extends StatelessWidget {
  final String imageUrl;

  const ProductSliderCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Container(
      width: double.infinity,
      color: colors.surfaceContainer,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,

        errorBuilder: (_, __, ___) {
          return Icon(
            Icons.broken_image_outlined,
            size: 60,
            color: colors.onSurfaceVariant,
          );
        },

        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }

          final expected = loadingProgress.expectedTotalBytes;

          return Center(
            child: SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: colors.primary,
                value: expected != null
                    ? loadingProgress.cumulativeBytesLoaded / expected
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
