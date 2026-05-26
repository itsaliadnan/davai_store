import 'package:davai_store/core/data/mock/promo_mock_data.dart';
import 'package:davai_store/features/home/presentation/components/promo_card.dart';
import 'package:davai_store/features/home/presentation/components/promo_indicator.dart';
import 'package:davai_store/features/home/presentation/controller/promo_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({super.key});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  final sliderController = PromoSliderController();

  @override
  void initState() {
    super.initState();

    sliderController.startAutoPlay(itemCount: promos.length);
  }

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

          child: PageView.builder(
            controller: sliderController.pageController,

            onPageChanged: (index) {
              sliderController.onPageChanged(index);
            },

            itemCount: promos.length,

            itemBuilder: (context, index) {
              final promo = promos[index];

              return PromoCard(
                promo: promo,
                onTap: () {
                  context.push(promo.route);
                },
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        ValueListenableBuilder(
          valueListenable: sliderController.currentIndex,

          builder: (context, currentIndex, _) {
            return PromoIndicator(
              currentIndex: currentIndex,
              itemCount: promos.length,
            );
          },
        ),
      ],
    );
  }
}
