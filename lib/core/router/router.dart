import 'package:davai_store/features/products/data/model/product_model.dart';
import 'package:davai_store/features/auth/presentation/providers/user_session_provider.dart';
import 'package:davai_store/features/auth/presentation/view/create_new_password_screen.dart';
import 'package:davai_store/features/auth/presentation/view/forgot_password_screen.dart';
import 'package:davai_store/features/auth/presentation/view/login_screen.dart';
import 'package:davai_store/features/auth/presentation/view/otp_screen.dart';
import 'package:davai_store/features/auth/presentation/view/signup_screen.dart';
import 'package:davai_store/features/cart/presentation/view/cart_screen.dart';
import 'package:davai_store/features/favorite/view/favorite_screen.dart';
import 'package:davai_store/features/home/presentation/components/story_screen.dart';
import 'package:davai_store/features/home/presentation/view/home_screen.dart';
import 'package:davai_store/features/notifications/presentation/view/notifications_screen.dart';
import 'package:davai_store/features/navbar/main_screen.dart';
import 'package:davai_store/features/product_details/presentation/view/product_details.dart';
import 'package:davai_store/features/products/presentation/view/product_screen.dart';
import 'package:davai_store/features/products_category/presentation/view/products_category_screen.dart';
import 'package:davai_store/features/profile/presentation/view/about_screen.dart';
import 'package:davai_store/features/profile/presentation/view/change_password_screen.dart';
import 'package:davai_store/features/profile/presentation/view/help_support_screen.dart';
import 'package:davai_store/features/profile/presentation/view/profile.screen.dart';
import 'package:davai_store/features/search/presentation/view/search_screen.dart';
import 'package:davai_store/features/spalash/presentation/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final session = ref.watch(userSessionControllerProvider);

  return GoRouter(
    initialLocation: '/splash',

    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
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
        path: '/story',
        builder: (context, state) =>
            StoryViewerScreen(images: state.extra as List<String>),
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
      GoRoute(path: '/about', builder: (context, state) => const AboutScreen()),
      GoRoute(
        path: '/help-support',
        builder: (context, state) => HelpSupportScreen(),
      ),
      GoRoute(
        path: '/all-product',
        builder: (context, state) => AllProductsScreen(),
      ),
    ],

    redirect: (context, state) {
      final isLoggedIn = session != null;

      final isGoingToSplash = state.matchedLocation == '/splash';
      final isGoingToLogin = state.matchedLocation == '/login';
      final isGoingToRegister = state.matchedLocation == '/register';
      final isGoingToForgotPassword =
          state.matchedLocation == '/forgot-password';
      final isGoingToOtp = state.matchedLocation == '/otp-screen';
      final isGoingToNewPassword = state.matchedLocation == '/new-password';

      if (isGoingToSplash) return null;

      if (!isLoggedIn &&
          !isGoingToLogin &&
          !isGoingToRegister &&
          !isGoingToForgotPassword &&
          !isGoingToOtp &&
          !isGoingToNewPassword) {
        return '/login';
      }

      if (isLoggedIn &&
          (isGoingToLogin || isGoingToRegister || isGoingToForgotPassword)) {
        return '/home';
      }

      return null;
    },
  );
});
