import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/features/cart/data/controller/cart_controller.dart';
import 'package:davai_store/features/favorite/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LuxeNavItem {
  final IconData icon;
  final IconData iconFilled;

  const LuxeNavItem({required this.icon, required this.iconFilled});
}

class LuxeBottomNavBar extends ConsumerWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const LuxeBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const List<LuxeNavItem> _items = [
    LuxeNavItem(icon: Icons.home_outlined, iconFilled: Icons.home_rounded),
    LuxeNavItem(icon: Icons.search_outlined, iconFilled: Icons.search_rounded),
    LuxeNavItem(
      icon: Icons.favorite_border_rounded,
      iconFilled: Icons.favorite_rounded,
    ),
    LuxeNavItem(
      icon: Icons.shopping_bag_outlined,
      iconFilled: Icons.shopping_bag_rounded,
    ),
    LuxeNavItem(
      icon: Icons.person_outline_rounded,
      iconFilled: Icons.person_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartCount = ref.watch(cartProvider).length;
    final favoritesCount = ref.watch(favoritesProvider).length;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_items.length, (index) {
            final item = _items[index];

            int? badge;
            if (index == 2) {
              badge = favoritesCount > 0 ? favoritesCount : null;
            } else if (index == 3) {
              badge = cartCount > 0 ? cartCount : null;
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: _LuxeNavTile(
                item: item,
                isActive: index == currentIndex,
                badge: badge,
                onTap: () => onTap(index),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// NAV ITEM

class _LuxeNavTile extends StatefulWidget {
  final LuxeNavItem item;
  final bool isActive;
  final int? badge;
  final VoidCallback onTap;

  const _LuxeNavTile({
    required this.item,
    required this.isActive,
    required this.badge,
    required this.onTap,
  });

  @override
  State<_LuxeNavTile> createState() => _LuxeNavTileState();
}

class _LuxeNavTileState extends State<_LuxeNavTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: widget.isActive ? 1 : 0,
    );
  }

  @override
  void didUpdateWidget(covariant _LuxeNavTile oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final active = widget.isActive;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: context.colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(16),
              border: active
                  ? Border.all(
                      color: colors.primary.withValues(alpha: 0.35),
                      width: 1.5,
                    )
                  : null,
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.onSurface.withValues(
                    alpha: active ? 0.14 : 0.08,
                  ),
                  blurRadius: active ? 14 : 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                AnimatedScale(
                  scale: active ? 1.08 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutBack,
                  child: Icon(
                    active ? widget.item.iconFilled : widget.item.icon,
                    size: 25,
                    color: active ? colors.secondary : colors.onSurfaceVariant,
                  ),
                ),
                if (widget.badge != null)
                  Positioned(
                    top: 7,
                    right: 7,
                    child: _Badge(count: widget.badge!),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// BADGE

class _Badge extends StatelessWidget {
  final int count;

  const _Badge({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: context.colorScheme.error,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.colorScheme.onPrimary, width: 2),
      ),
      child: Text(
        count > 99 ? '99+' : '$count',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w700,
          color: context.colorScheme.onPrimary,
          height: 1.3,
        ),
      ),
    );
  }
}
