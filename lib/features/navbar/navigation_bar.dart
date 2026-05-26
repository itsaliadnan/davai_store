import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/colors.dart';
import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Nav item model
// ─────────────────────────────────────────────────────────────────────────────
class LuxeNavItem {
  final IconData icon;
  final IconData iconFilled;
  final String label;
  final int? badgeCount; // null = no badge, 0 = dot only, >0 = number

  const LuxeNavItem({
    required this.icon,
    required this.iconFilled,
    required this.label,
    this.badgeCount,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// LuxeBottomNavBar
//
// Usage:
//   LuxeBottomNavBar(
//     currentIndex: _index,
//     onTap: (i) => setState(() => _index = i),
//     cartBadgeCount: 3,
//   )
// ─────────────────────────────────────────────────────────────────────────────
class LuxeBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final int? cartBadgeCount; // overrides default cart badge

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
      icon: Icons.search_rounded,
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
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimaryContainer.withValues(alpha: 0.2),
        border: Border(
          top: BorderSide(color: context.colorScheme.outline, width: 0.5),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 8,
          bottom: bottomPadding > 0 ? bottomPadding : 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final isActive = index == currentIndex;

            // Attach badge to cart (index 3)
            final badge = index == 3 ? cartBadgeCount : item.badgeCount;

            return _LuxeNavTile(
              item: item,
              isActive: isActive,
              badge: badge,
              onTap: () => onTap(index),
            );
          }),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Single tile
// ─────────────────────────────────────────────────────────────────────────────
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
  late final AnimationController _ctrl;
  late final Animation<double> _scale;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scale = Tween<double>(
      begin: 1.0,
      end: 1.18,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack));
    _opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));

    if (widget.isActive) _ctrl.value = 1.0;
  }

  @override
  void didUpdateWidget(_LuxeNavTile old) {
    super.didUpdateWidget(old);
    if (widget.isActive != old.isActive) {
      widget.isActive ? _ctrl.forward() : _ctrl.reverse();
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final active = widget.isActive;

    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon + badge
            AnimatedBuilder(
              animation: _ctrl,
              builder: (_, __) => Transform.scale(
                scale: _scale.value,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Active pill indicator
                    if (active)
                      Positioned.fill(
                        child: FadeTransition(
                          opacity: _opacity,
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.colorScheme.primary.withOpacity(
                                0.15,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),

                    // Icon
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Icon(
                        active ? widget.item.icon : widget.item.icon,
                        size: 24,
                        color: active
                            ? context.colorScheme.primary
                            : context.colorScheme.tertiary,
                      ),
                    ),

                    // Badge
                    if (widget.badge != null)
                      Positioned(
                        top: 2,
                        right: 8,
                        child: _Badge(count: widget.badge!),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 2),

            // Label
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 180),
              style: TextStyle(
                fontSize: 10,
                fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                color: active
                    ? context.colorScheme.primary
                    : context.colorScheme.tertiary,
                letterSpacing: active ? 0.1 : 0,
              ),
              child: Text(widget.item.label),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Badge — dot (count == 0) or number pill (count > 0)
// ─────────────────────────────────────────────────────────────────────────────
class _Badge extends StatelessWidget {
  final int count;
  const _Badge({required this.count});

  @override
  Widget build(BuildContext context) {
    final isDot = count == 0;

    return Container(
      width: isDot ? 8 : null,
      height: isDot ? 8 : 16,
      padding: isDot ? null : const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.alertRed,
        borderRadius: BorderRadius.circular(isDot ? 4 : 8),
        border: Border.all(
          color: context.colorScheme.primaryContainer,
          width: 1.5,
        ),
      ),
      child: isDot
          ? null
          : Text(
              count > 99 ? '99+' : '$count',
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
    );
  }
}
