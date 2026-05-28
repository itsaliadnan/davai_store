import 'dart:async';

import 'package:flutter/material.dart';

class ProductSliderController {
  final PageController pageController = PageController();

  final ValueNotifier<int> currentIndex = ValueNotifier(0);

  Timer? timer;

  void startAutoPlay({required int itemCount}) {
    timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!pageController.hasClients) return;

      int nextPage = currentIndex.value + 1;

      if (nextPage >= itemCount) {
        nextPage = 0;
      }

      pageController.animateToPage(
        nextPage,
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
