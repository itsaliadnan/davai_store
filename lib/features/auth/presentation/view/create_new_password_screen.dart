import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/core/utils/app_snackbar.dart';
import 'package:davai_store/features/auth/presentation/providers/user_provider.dart';
import 'package:davai_store/core/widgets/custom_button.dart';
import 'package:davai_store/core/widgets/text_field.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class CreateNewpasswordScreen extends ConsumerStatefulWidget {
  final String email;
  final String otp;

  const CreateNewpasswordScreen({
    super.key,
    required this.email,
    required this.otp,
  });

  @override
  ConsumerState<CreateNewpasswordScreen> createState() =>
      _CreateNewpasswordScreenState();
}

class _CreateNewpasswordScreenState
    extends ConsumerState<CreateNewpasswordScreen> {
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  context.t.newPassword.newPassword,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Lottie.asset('assets/lottie/EnterPassword.json'),
                SizedBox(height: AppSpacing.xl),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    context.t.newPassword.newPasswordHint,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                CustomTextField(
                  hintText: context.t.changePassword.newPassword,
                  controller: passwordController,
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
                const SizedBox(height: AppSpacing.xl),
                CustomButton(
                  width: 120,
                  text: context.t.newPassword.save,
                  onPressed: () async {
                    final password = passwordController.text.trim();
                    final confirm = confirmController.text.trim();

                    if (password.isEmpty || confirm.isEmpty) {
                      AppSnackBar.error(context, context.t.auth.fillAllFields);
                      return;
                    }

                    if (password != confirm) {
                      AppSnackBar.error(
                        context,
                        context.t.auth.passwordsDoNotMatch,
                      );
                      return;
                    }

                    try {
                      await ref
                          .read(userApiProvider)
                          .resetPassword(widget.email, widget.otp, password);

                      if (!context.mounted) return;

                      AppSnackBar.success(
                        context,
                        context.t.auth.passwordUpdatedSuccessfully,
                      );

                      context.go('/login');
                    } catch (e) {
                      if (!context.mounted) return;

                      AppSnackBar.error(context, e.toString());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
