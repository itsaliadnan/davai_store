import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/auth/presentation/providers/user_session_provider.dart';
import 'package:davai_store/features/profile/view/provider/change_password_provider.dart';
import 'package:davai_store/features/widgets/custom_button.dart';
import 'package:davai_store/features/widgets/text_field.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Fill all fields')));
      return;
    }

    if (newController.text != confirmController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    ref
        .read(changePasswordControllerProvider.notifier)
        .changePassword(
          currentPassword: currentController.text.trim(),
          newPassword: newController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(changePasswordControllerProvider);

    // listener (نجاح / خطأ)
    ref.listen(changePasswordControllerProvider, (prev, next) {
      next.whenOrNull(
        data: (_) async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password changed successfully')),
          );

          // logout
          await ref.read(userSessionControllerProvider.notifier).logout();

          // تحويل للوغن
          Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
        },
        error: (err, _) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(err.toString())));
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
