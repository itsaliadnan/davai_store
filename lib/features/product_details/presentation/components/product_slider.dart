import 'package:davai_store/core/data/mock/product_mock_data.dart';
import 'package:davai_store/features/product_details/presentation/components/product_slider_card.dart';
import 'package:davai_store/features/product_details/presentation/controller/product_slider.controller.dart';
import 'package:flutter/material.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220,
          child: Stack(
            children: [
              PageView.builder(
                controller: sliderController.pageController,
                onPageChanged: sliderController.onPageChanged,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductSliderCard(product: products[index]);
                },
              ),

              // LEFT ARROW
              Positioned(
                left: 14,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      sliderController.pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ),

              // RIGHT ARROW
              Positioned(
                right: 10,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      sliderController.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
