import 'package:davai_store/features/cart/presentation/view/cart_screen.dart';
import 'package:davai_store/features/home/presentation/view/home_screen.dart';
import 'package:davai_store/features/home/presentation/view/notifications_screen.dart';
import 'package:davai_store/features/navbar/main_screen.dart';
import 'package:davai_store/features/product_details/presentation/view/product_details.dart';
import 'package:davai_store/features/search/presentation/view/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',

  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScreen(child: child);
      },

      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),

        GoRoute(
          path: '/notifications',
          builder: (context, state) => const NotificationsScreen(),
        ),

        GoRoute(path: '/search', builder: (context, state) => SearchScreen()),
        GoRoute(
          path: '/product-details',
          builder: (context, state) => ProductDetails(),
        ),
        GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
        GoRoute(
          path: '/profile',
          builder: (context, state) =>
              const Scaffold(body: Center(child: Text('Profile'))),
        ),
      ],
    ),
  ],
);
