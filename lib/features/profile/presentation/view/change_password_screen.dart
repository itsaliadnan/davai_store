import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/auth/presentation/providers/user_session_provider.dart';
import 'package:davai_store/features/profile/data/provider/change_password_provider.dart';
import 'package:davai_store/core/widgets/custom_button.dart';
import 'package:davai_store/core/widgets/text_field.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final currentController = TextEditingController();
  final newController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void dispose() {
    currentController.dispose();
    newController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  Future<void> handleChangePassword() async {
    if (currentController.text.isEmpty ||
        newController.text.isEmpty ||
        confirmController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.t.changePassword.pleaseFillAllFields,
            style: context.text.bodyMedium?.copyWith(
              color: context.colorScheme.onInverseSurface,
            ),
          ),
        ),
      );
      return;
    }

    if (newController.text != confirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.t.changePassword.passwordsDoNotMatch,
            style: context.text.bodyMedium?.copyWith(
              color: context.colorScheme.onInverseSurface,
            ),
          ),
        ),
      );
      return;
    }

    await ref
        .read(changePasswordControllerProvider.notifier)
        .changePassword(
          currentPassword: currentController.text.trim(),
          newPassword: newController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(changePasswordControllerProvider);

    ref.listen(changePasswordControllerProvider, (prev, next) {
      next.whenOrNull(
        data: (success) async {
          if (success != true) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.t.changePassword.passwordChangedSuccessfully,
                style: context.text.bodyMedium?.copyWith(
                  color: context.colorScheme.onInverseSurface,
                ),
              ),
            ),
          );

          await ref.read(userSessionControllerProvider.notifier).logout();

          if (!context.mounted) return;

          context.go('/login');
        },
        error: (err, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                err.toString(),
                style: context.text.bodyMedium?.copyWith(
                  color: context.colorScheme.onInverseSurface,
                ),
              ),
            ),
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(title: Text(context.t.changePassword.changePassword)),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            CustomTextField(
              controller: currentController,
              hintText: context.t.changePassword.currentPassword,
              isPassword: true,
              prefixIcon: Icons.lock,
            ),
            const SizedBox(height: AppSpacing.lg),

            CustomTextField(
              controller: newController,
              hintText: context.t.changePassword.newPassword,
              isPassword: true,
              prefixIcon: Icons.lock_outline,
            ),
            const SizedBox(height: AppSpacing.lg),

            CustomTextField(
              controller: confirmController,
              hintText: context.t.changePassword.confirmNewPassword,
              isPassword: true,
              prefixIcon: Icons.lock_outline,
            ),
            const SizedBox(height: AppSpacing.lg),

            CustomButton(
              text: context.t.changePassword.updatePassword,
              isLoading: state.isLoading,
              onPressed: handleChangePassword,
            ),
          ],
        ),
      ),
    );
  }
}
