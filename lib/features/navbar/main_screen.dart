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

    if (location.startsWith('/search')) currentIndex = 1;
    if (location.startsWith('/saved')) currentIndex = 2;
    if (location.startsWith('/cart')) currentIndex = 3;
    if (location.startsWith('/profile')) currentIndex = 4;

    return Scaffold(
      body: child,

      bottomNavigationBar: LuxeBottomNavBar(
        currentIndex: currentIndex,

        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/search');
              break;
            case 2:
              context.go('/saved');
              break;
            case 3:
              context.go('/cart');
              break;
            case 4:
              context.go('/profile');
              break;
          }
        },

        cartBadgeCount: 3,
      ),
    );
  }
}
