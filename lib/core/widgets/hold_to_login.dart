import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/utils/app_snackbar.dart';
import 'package:davai_store/features/auth/data/model/user_model.dart';
import 'package:davai_store/features/auth/presentation/providers/user_provider.dart';
import 'package:davai_store/features/auth/presentation/providers/user_session_provider.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HoldToLogin extends ConsumerStatefulWidget {
  const HoldToLogin({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.width,
    this.height = 52,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final double? width;
  final double height;

  @override
  ConsumerState<HoldToLogin> createState() => _HoldToLoginState();
}

class _HoldToLoginState extends ConsumerState<HoldToLogin>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
    reverseDuration: const Duration(milliseconds: 250),
  );

  bool _isLoading = false;
  bool _confirming = false;

  @override
  void initState() {
    super.initState();
    _c.addStatusListener(_onStatus);
  }

  void _onStatus(AnimationStatus status) async {
    if (status == AnimationStatus.completed && !_confirming) {
      await _login();
    }
  }

  Future<void> _login() async {
    if (_isLoading) return;

    if (widget.emailController.text.isEmpty ||
        widget.passwordController.text.isEmpty) {
      AppSnackBar.error(context, context.t.auth.pleaseFillInAllFields);

      _c.reverse();
      return;
    }

    _confirming = true;
    setState(() => _isLoading = true);

    try {
      final result = await ref
          .read(userApiProvider)
          .loginUser(
            widget.emailController.text.trim(),
            widget.passwordController.text.trim(),
          );

      final user = result['user'] as UserModel;
      final sessionToken = result['sessionToken'] as String;
      final expiresAt = result['expiresAt'] as DateTime;

      await ref
          .read(userSessionControllerProvider.notifier)
          .saveSession(user.id, user.email, sessionToken, expiresAt);

      if (!mounted) return;

      AppSnackBar.success(context, 'Welcome ${user.name}');

      context.go('/home');
    } catch (_) {
      if (!context.mounted) return;

      AppSnackBar.error(context, context.t.auth.wrongPassOrEmail);
    } finally {
      _confirming = false;

      if (mounted) {
        setState(() => _isLoading = false);
        _c.reverse();
      }
    }
  }

  @override
  void dispose() {
    _c.removeStatusListener(_onStatus);
    _c.dispose();
    super.dispose();
  }

  void _start() {
    if (_isLoading) return;
    _c.forward();
  }

  void _cancel() {
    if (!_confirming) _c.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => _start(),
      onTapUp: (_) => _cancel(),
      onTapCancel: _cancel,
      child: Container(
        width: widget.width,
        height: widget.height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: context.success.withValues(alpha: 0.4)),
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
                    color: context.success.withValues(alpha: 0.15),
                    child: const SizedBox.expand(),
                  ),
                ),
              ),
            ),
            Center(
              child: _isLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: cs.primary,
                      ),
                    )
                  : AnimatedBuilder(
                      animation: _c,
                      builder: (context, _) => Text(
                        _c.value > 0.05
                            ? context.t.profile.keepHolding
                            : context.t.auth.login,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: context.success,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
