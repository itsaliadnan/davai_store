import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/auth/presentation/providers/user_provider.dart';
import 'package:davai_store/features/auth/presentation/providers/user_session_provider.dart';
import 'package:davai_store/features/widgets/custom_button.dart';
import 'package:davai_store/features/widgets/text_field.dart';
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
                ),
                const SizedBox(height: AppSpacing.lg),
                CustomTextField(
                  controller: passwordController,
                  hintText: context.t.auth.enterYourPassword,
                  isPassword: true,
                  prefixIcon: Icons.lock,
                ),

                const SizedBox(height: AppSpacing.lg),
                CustomButton(
                  width: 140,
                  text: context.t.auth.login,
                  isLoading: isLoading,
                  onPressed: () async {
                    if (isLoading) return;
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(context.t.auth.pleaseFillInAllFields),
                        ),
                      );
                      return;
                    }

                    setState(() => isLoading = true);

                    try {
                      final user = await ref
                          .read(userApiProvider)
                          .loginUser(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                      await ref
                          .read(userSessionControllerProvider.notifier)
                          .saveSession(user.id, user.email);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Welcome ${user.name}')),
                      );

                      if (mounted) {
                        context.go('/home');
                      }
                    } catch (e, stack) {
                      print("LOGIN ERROR: $e");
                      print("STACK: $stack");

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(context.t.auth.wrongPassOrEmail),
                        ),
                      );

                      if (mounted) {
                        setState(() => isLoading = false);
                      }
                    }
                  },
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
                      child: Text(context.t.auth.forgetPassword),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(context.t.auth.dontHaveAnAccount),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            context.push('/register');
                          },
                          child: Text(context.t.auth.signUp),
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
