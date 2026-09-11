import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/home/presentation/components/products_section.dart';
import 'package:davai_store/features/home/presentation/components/promo_slider.dart';
import 'package:davai_store/features/home/presentation/components/search_bar.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          context.t.home.davaiStore,
          style: context.text.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),

            child: IconButton(
              icon: Icon(
                Icons.notifications_none,
                size: 28,
                color: context.colorScheme.onSurface,
              ),
              onPressed: () => context.push('/notifications'),
            ),
          ),
        ],
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/category.svg',
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              context.colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
          onPressed: () {
            context.push('/products-category-screen');
          },
        ),
      ),

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SearchBarWidget(),

                const SizedBox(height: 20),

                const PromoSlider(),

                const SizedBox(height: 28),

                // const CategorySection(),
                const SizedBox(height: 28),

                const ProductsSection(),
                const SizedBox(height: 40),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
