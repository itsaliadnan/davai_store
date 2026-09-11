import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class LuxeNavItem {
  final IconData icon;
  final IconData iconFilled;
  final String label;
  final int? badgeCount;

  const LuxeNavItem({
    required this.icon,
    required this.iconFilled,
    required this.label,
    this.badgeCount,
  });
}

class LuxeBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final int? cartBadgeCount;

  const LuxeBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.cartBadgeCount,
  });

  static const List<LuxeNavItem> _items = [
    LuxeNavItem(
      icon: Icons.home_outlined,
      iconFilled: Icons.home_rounded,
      label: 'Home',
    ),
    LuxeNavItem(
      icon: Icons.search_outlined,
      iconFilled: Icons.search_rounded,
      label: 'Search',
    ),
    LuxeNavItem(
      icon: Icons.favorite_border_rounded,
      iconFilled: Icons.favorite_rounded,
      label: 'Saved',
    ),
    LuxeNavItem(
      icon: Icons.shopping_bag_outlined,
      iconFilled: Icons.shopping_bag_rounded,
      label: 'Cart',
    ),
    LuxeNavItem(
      icon: Icons.person_outline_rounded,
      iconFilled: Icons.person_rounded,
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_items.length, (index) {
            final item = _items[index];

            final badge = index == 3 ? cartBadgeCount : item.badgeCount;

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
              // كل عنصر له خلفيته الخاصة
              color: Colors.white,

              borderRadius: BorderRadius.circular(16),

              // تمييز بسيط للعنصر النشط
              border: active
                  ? Border.all(
                      color: colors.primary.withValues(alpha: 0.35),
                      width: 1.5,
                    )
                  : null,

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: active ? 0.14 : 0.08),
                  blurRadius: active ? 14 : 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),

            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                // ICON
                AnimatedScale(
                  scale: active ? 1.08 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutBack,
                  child: Icon(
                    active ? widget.item.iconFilled : widget.item.icon,
                    size: 25,
                    color: active ? colors.primary : colors.onSurfaceVariant,
                  ),
                ),

                // BADGE
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
    final isDot = count == 0;

    return Container(
      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
      padding: isDot
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: context.colorScheme.error,
        borderRadius: BorderRadius.circular(10),

        border: Border.all(color: Colors.white, width: 2),
      ),
      child: isDot
          ? const SizedBox(width: 6, height: 6)
          : Text(
              count > 99 ? '99+' : '$count',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1.3,
              ),
            ),
    );
  }
}
