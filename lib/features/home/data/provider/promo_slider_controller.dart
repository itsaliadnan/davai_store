import 'dart:async';

import 'package:flutter/material.dart';

class PromoSliderController {
  final PageController pageController = PageController();

  final ValueNotifier<int> currentIndex = ValueNotifier(0);

  Timer? timer;
  void startAutoPlay({required int itemCount}) {
    timer?.cancel();

    if (itemCount <= 1) return;

    timer = Timer.periodic(const Duration(seconds: 4), (_) async {
      if (!pageController.hasClients) return;

      final current = currentIndex.value;

      if (current == itemCount - 1) {
        pageController.jumpToPage(0);
        return;
      }

      pageController.animateToPage(
        current + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void dispose() {
    timer?.cancel();
    currentIndex.dispose();
    pageController.dispose();
  }
}
