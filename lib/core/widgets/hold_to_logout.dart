import 'package:davai_store/core/utils/app_snackbar.dart';
import 'package:davai_store/features/auth/presentation/providers/user_session_provider.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HoldToLogout extends ConsumerStatefulWidget {
  final double? width;
  final double height;

  const HoldToLogout({super.key, this.width, this.height = 52});

  @override
  ConsumerState<HoldToLogout> createState() => _HoldToLogoutState();
}

class _HoldToLogoutState extends ConsumerState<HoldToLogout>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 900),
        reverseDuration: const Duration(milliseconds: 250),
      )..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          try {
            await ref.read(userSessionControllerProvider.notifier).logout();

            if (!mounted) return;

            AppSnackBar.success(context, 'Logged out successfully');
          } catch (e) {
            if (!mounted) return;

            AppSnackBar.error(context, e.toString());
          }
        }
      });

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return GestureDetector(
      onTapDown: (_) => _c.forward(),
      onTapUp: (_) => _c.reverse(),
      onTapCancel: () => _c.reverse(),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: cs.error.withValues(alpha: 0.4)),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedBuilder(
                animation: _c,
                builder: (context, _) => Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: FractionallySizedBox(
                    widthFactor: _c.value,
                    child: ColoredBox(
                      color: cs.error.withValues(alpha: 0.15),
                      child: const SizedBox.expand(),
                    ),
                  ),
                ),
              ),
              Center(
                child: AnimatedBuilder(
                  animation: _c,
                  builder: (context, _) => Text(
                    _c.value > 0.05
                        ? context.t.profile.keepHolding
                        : context.t.profile.holdToLogout,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: cs.error,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
