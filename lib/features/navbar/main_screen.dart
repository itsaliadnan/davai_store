import 'package:davai_store/features/navbar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    int currentIndex = 0;

    if (location.startsWith('/search')) {
      currentIndex = 1;
    } else if (location.startsWith('/favorite')) {
      currentIndex = 2;
    } else if (location.startsWith('/cart')) {
      currentIndex = 3;
    } else if (location.startsWith('/profile')) {
      currentIndex = 4;
    }

    return Scaffold(
      extendBody: true,

      body: Stack(
        children: [
          // PAGE
          Positioned.fill(child: child),

          // FLOATING NAVBAR
          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: LuxeBottomNavBar(
              currentIndex: currentIndex,

              onTap: (index) {
                switch (index) {
                  case 0:
                    context.go('/home');
                    break;

                  case 1:
                    context.go('/search');
                    break;

                  case 2:
                    context.go('/favorite');
                    break;

                  case 3:
                    context.go('/cart');
                    break;

                  case 4:
                    context.go('/profile');
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
