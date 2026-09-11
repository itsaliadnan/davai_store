import 'package:davai_store/features/home/presentation/components/promo_card.dart';
import 'package:davai_store/features/home/presentation/components/promo_indicator.dart';
import 'package:davai_store/features/home/presentation/controller/promo_provider.dart';
import 'package:davai_store/features/home/presentation/controller/promo_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PromoSlider extends ConsumerStatefulWidget {
  const PromoSlider({super.key});

  @override
  ConsumerState<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends ConsumerState<PromoSlider> {
  final sliderController = PromoSliderController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    sliderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final promosAsync = ref.watch(promosProvider);
    return promosAsync.when(
      loading: () => const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      ),

      error: (e, _) => const SizedBox(
        height: 200,
        child: Center(child: Text('Error loading promos')),
      ),

      data: (promos) {
        sliderController.startAutoPlay(itemCount: promos.length);

        return SizedBox(
          height: 200,
          child: Stack(
            children: [
              PageView.builder(
                controller: sliderController.pageController,
                onPageChanged: sliderController.onPageChanged,
                itemCount: promos.length,
                itemBuilder: (context, index) {
                  final promo = promos[index];

                  return AnimatedBuilder(
                    animation: sliderController.pageController,
                    builder: (context, child) {
                      double value = 1.0;

                      if (sliderController.pageController.hasClients) {
                        final page = sliderController.pageController.page;

                        if (page != null) {
                          value = page - index;
                          value = (1 - (value.abs() * 0.15)).clamp(0.9, 1.0);
                        }
                      }

                      return Transform.scale(
                        scale: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: PromoCard(
                            promo: promo,
                            onTap: () {
                              // context.push(...)
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),

              /// INDICATOR
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: ValueListenableBuilder<int>(
                  valueListenable: sliderController.currentIndex,
                  builder: (context, currentIndex, _) {
                    return PromoIndicator(
                      currentIndex: currentIndex,
                      itemCount: promos.length,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
