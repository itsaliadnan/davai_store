import 'package:davai_store/core/extentions/theme_extentions.dart';
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

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
                Row(
                  children: [
                    IconButton(
                      onPressed: context.pop,
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 22),
                    Text(
                      context.t.changePassword.forgotPassword,
                      style: context.text.titleLarge,
                    ),
                  ],
                ),
                Lottie.asset('assets/lottie/passwordLost.json'),
                const SizedBox(height: AppSpacing.xl),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    context.t.changePassword.forgotPasswordHint,
                    textAlign: TextAlign.center,
                    style: context.text.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    controller: emailController,
                    hintText: context.t.changePassword.emailHint,
                    isPassword: false,
                    prefixIcon: Icons.email,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                CustomButton(
                  width: 120,
                  text: context.t.changePassword.send,
                  onPressed: () async {
                    final email = emailController.text.trim();

                    if (email.isEmpty) {
                      AppSnackBar.error(context, context.t.auth.enterYourEmail);
                      return;
                    }

                    try {
                      await ref.read(userApiProvider).forgotPassword(email);

                      if (!context.mounted) return;

                      AppSnackBar.success(
                        context,
                        context.t.auth.otpSentToYourEmail,
                      );

                      context.push('/otp-screen', extra: email);
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
