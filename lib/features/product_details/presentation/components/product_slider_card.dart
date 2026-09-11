import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class ProductSliderCard extends StatelessWidget {
  final String imageUrl;

  const ProductSliderCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Stack(
          children: [
            // خلفية خفيفة
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colors.primaryContainer.withValues(alpha: 0.45),
                      colors.surfaceContainerHighest,
                    ],
                  ),
                ),
              ),
            ),

            // IMAGE
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,

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
                          value: expected != null
                              ? loadingProgress.cumulativeBytesLoaded / expected
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
