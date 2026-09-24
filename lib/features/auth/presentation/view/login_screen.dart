import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/core/widgets/hold_to_login.dart';
import 'package:davai_store/core/widgets/text_field.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  context.t.auth.loginTitle,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                Lottie.asset(
                  'assets/lottie/Login.json',
                  width: 250,
                  height: 250,
                ),

                CustomTextField(
                  controller: emailController,
                  hintText: context.t.auth.enterYourEmail,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email,
                  prefixIconColor: context.colorScheme.onPrimaryContainer,
                  hintTextColor: context.colorScheme.onPrimaryContainer,
                  textColor: context.colorScheme.onPrimaryContainer,
                ),
                const SizedBox(height: AppSpacing.lg),
                CustomTextField(
                  controller: passwordController,
                  hintText: context.t.auth.enterYourPassword,
                  isPassword: true,
                  prefixIcon: Icons.lock,
                  prefixIconColor: context.colorScheme.onPrimaryContainer,
                  hintTextColor: context.colorScheme.onPrimaryContainer,
                  textColor: context.colorScheme.onPrimaryContainer,
                ),

                const SizedBox(height: AppSpacing.lg),
                HoldToLogin(
                  emailController: emailController,
                  passwordController: passwordController,
                  width: 140,
                ),

                SizedBox(height: 80),
                Column(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        context.push('/forgot-password');
                      },
                      child: Text(
                        context.t.auth.forgetPassword,
                        style: TextStyle(
                          fontSize: 14,
                          color: context.colorScheme.inversePrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.t.auth.dontHaveAnAccount,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(width: 4),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            context.push('/register');
                          },
                          child: Text(
                            context.t.auth.signUp,
                            style: TextStyle(
                              fontSize: 14,
                              color: context.colorScheme.inversePrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
