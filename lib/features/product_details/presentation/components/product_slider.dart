import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/features/products/data/model/product_model.dart';
import 'package:davai_store/features/product_details/presentation/components/product_slider_card.dart';
import 'package:davai_store/features/product_details/presentation/controller/product_slider.controller.dart';
import 'package:flutter/material.dart';

class ProductSlider extends StatefulWidget {
  final ProductModel product;

  const ProductSlider({super.key, required this.product});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  final sliderController = ProductSliderController();

  @override
  void dispose() {
    sliderController.dispose();
    super.dispose();
  }

  List<String> get productImages {
    final images = <String>[];

    if (widget.product.image.isNotEmpty) {
      images.add(widget.product.image);
    }

    for (final image in widget.product.images) {
      if (image.isNotEmpty && !images.contains(image)) {
        images.add(image);
      }
    }

    return images;
  }

  void _goTo(int index) {
    sliderController.pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final images = productImages;

    if (images.isEmpty) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 280,
        decoration: BoxDecoration(
          color: colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Icon(
          Icons.image_not_supported_outlined,
          size: 55,
          color: colors.onSurfaceVariant,
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 280,
          child: PageView.builder(
            controller: sliderController.pageController,
            itemCount: images.length,
            onPageChanged: sliderController.onPageChanged,
            itemBuilder: (context, index) {
              return ProductSliderCard(imageUrl: images[index]);
            },
          ),
        ),
        if (images.length > 1) ...[
          const SizedBox(height: 12),

          SizedBox(
            height: 56,
            child: ValueListenableBuilder<int>(
              valueListenable: sliderController.currentIndex,
              builder: (context, currentIndex, _) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: images.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final active = index == currentIndex;

                    return GestureDetector(
                      onTap: () => _goTo(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: active ? colors.primary : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Opacity(
                            opacity: active ? 1 : 0.55,
                            child: ProductSliderCard(imageUrl: images[index]),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
