import 'package:davai_store/core/model/product_model.dart';
import 'package:davai_store/features/auth/presentation/providers/user_session_provider.dart';
import 'package:davai_store/features/auth/presentation/view/create_newPassword_screen.dart';
import 'package:davai_store/features/auth/presentation/view/forgot_password_screen.dart';
import 'package:davai_store/features/auth/presentation/view/login_screen.dart';
import 'package:davai_store/features/auth/presentation/view/otp_screen.dart';
import 'package:davai_store/features/auth/presentation/view/signup_screen.dart';
import 'package:davai_store/features/cart/presentation/view/cart_screen.dart';
import 'package:davai_store/features/favorite/view/favorite_screen.dart';
import 'package:davai_store/features/home/presentation/view/home_screen.dart';
import 'package:davai_store/features/home/presentation/view/notifications_screen.dart';
import 'package:davai_store/features/navbar/main_screen.dart';
import 'package:davai_store/features/product_details/presentation/view/product_details.dart';
import 'package:davai_store/features/products_category/view/products_category_screen.dart';
import 'package:davai_store/features/profile/view/change_password_screen.dart';
import 'package:davai_store/features/profile/view/profile.screen.dart';
import 'package:davai_store/features/search/presentation/view/search_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final session = ref.watch(userSessionControllerProvider);

  return GoRouter(
    initialLocation: '/login',

    routes: [
      GoRoute(
        path: '/register',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/change-password',
        builder: (context, state) => const ChangePasswordScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      GoRoute(
        path: '/otp-screen',
        builder: (context, state) => OtpScreen(email: state.extra as String),
      ),

      GoRoute(
        path: '/new-password',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;

          return CreateNewpasswordScreen(
            email: data['email'],
            otp: data['otp'],
          );
        },
      ),
      // 🔥 الناف بار (لا يتغير)
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/cart',
            builder: (context, state) => const CartScreen(),
          ),
          GoRoute(
            path: '/favorite',
            builder: (context, state) => const FavoritesScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(path: '/search', builder: (context, state) => SearchScreen()),
        ],
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/product-details',
        builder: (context, state) =>
            ProductDetails(product: state.extra as ProductModel),
      ),
      GoRoute(
        path: '/products-category-screen',
        builder: (context, state) => ProductsCategoryScreen(),
      ),
    ],

    //الحماية
    redirect: (context, state) {
      final isLoggedIn = session != null;

      final isGoingToLogin = state.matchedLocation == '/login';
      final isGoingToRegister = state.matchedLocation == '/register';
      final isGoingToForgotPassword =
          state.matchedLocation == '/forgot-password';
      final isGoingToOtp = state.matchedLocation == '/otp-screen';
      final isGoingToNewPassword = state.matchedLocation == '/new-password';

      // غير مسجل → امنع الدخول
      if (!isLoggedIn &&
          !isGoingToLogin &&
          !isGoingToRegister &&
          !isGoingToForgotPassword &&
          !isGoingToOtp &&
          !isGoingToNewPassword) {
        return '/login';
      }

      //  مسجل → امنع الرجوع
      if (isLoggedIn &&
          (isGoingToLogin || isGoingToRegister || isGoingToForgotPassword)) {
        return '/home';
      }

      return null;
    },
  );
});
