import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/model/product_model.dart';
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

  void _previous(int count) {
    final current = sliderController.currentIndex.value;

    if (current <= 0) return;

    sliderController.pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  void _next(int count) {
    final current = sliderController.currentIndex.value;

    if (current >= count - 1) return;

    sliderController.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                controller: sliderController.pageController,
                itemCount: images.length,
                onPageChanged: sliderController.onPageChanged,
                itemBuilder: (context, index) {
                  return ProductSliderCard(imageUrl: images[index]);
                },
              ),

              if (images.length > 1)
                ValueListenableBuilder<int>(
                  valueListenable: sliderController.currentIndex,
                  builder: (context, currentIndex, _) {
                    return Positioned(
                      left: 24,
                      child: _SliderButton(
                        icon: Icons.arrow_back_ios_new_rounded,
                        enabled: currentIndex > 0,
                        onTap: () => _previous(images.length),
                      ),
                    );
                  },
                ),

              if (images.length > 1)
                ValueListenableBuilder<int>(
                  valueListenable: sliderController.currentIndex,
                  builder: (context, currentIndex, _) {
                    return Positioned(
                      right: 24,
                      child: _SliderButton(
                        icon: Icons.arrow_forward_ios_rounded,
                        enabled: currentIndex < images.length - 1,
                        onTap: () => _next(images.length),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),

        // ============================================================
        // INDICATORS
        // ============================================================
        if (images.length > 1) ...[
          const SizedBox(height: 14),

          ValueListenableBuilder<int>(
            valueListenable: sliderController.currentIndex,
            builder: (context, currentIndex, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  final active = currentIndex == index;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: active ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: active ? colors.primary : colors.outlineVariant,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ],
    );
  }
}

// ============================================================
// SLIDER BUTTON
// ============================================================

class _SliderButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const _SliderButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: enabled ? 1 : 0.35,
      child: Material(
        color: colors.surface.withValues(alpha: 0.94),
        elevation: 3,
        shadowColor: Colors.black.withValues(alpha: 0.15),
        shape: const CircleBorder(),
        child: InkWell(
          onTap: enabled ? onTap : null,
          customBorder: const CircleBorder(),
          child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(icon, size: 15, color: colors.onSurface),
          ),
        ),
      ),
    );
  }
}
