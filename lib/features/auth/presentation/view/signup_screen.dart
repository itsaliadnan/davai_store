import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/auth/presentation/providers/user_provider.dart';
import 'package:davai_store/features/widgets/custom_button.dart';
import 'package:davai_store/features/widgets/phone_field.dart';
import 'package:davai_store/features/widgets/text_field.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final phoneController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
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
                  context.t.auth.signUp,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  context.t.auth.toYourAccount,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Lottie.asset(
                  'assets/lottie/signup.json',
                  width: 200,
                  height: 200,
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: CustomTextField(
                        controller: firstNameController,

                        height: 1,
                        hintText: context.t.auth.firstName,
                        keyboardType: TextInputType.text,
                        prefixIcon: Icons.person,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Flexible(
                      fit: FlexFit.tight,
                      child: CustomTextField(
                        controller: lastNameController,
                        height: 1,
                        hintText: context.t.auth.familyName,
                        keyboardType: TextInputType.text,
                        prefixIcon: Icons.family_restroom_sharp,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                PhoneField(height: 49, controller: phoneController),
                const SizedBox(height: AppSpacing.lg),
                CustomTextField(
                  controller: emailController,
                  height: 1,
                  hintText: context.t.auth.email,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: AppSpacing.lg),
                CustomTextField(
                  controller: passwordController,
                  height: 1,
                  hintText: context.t.auth.password,
                  isPassword: true,
                  prefixIcon: Icons.lock,
                ),
                const SizedBox(height: AppSpacing.lg),
                CustomButton(
                  width: 140,
                  text: context.t.auth.signUp,
                  onPressed: () async {
                    final provider = ref.read(userApiProvider);

                    final fullName =
                        '${firstNameController.text} ${lastNameController.text}';
                    final phone = '+964${phoneController.text}';

                    try {
                      await provider.registerUser(
                        fullName,
                        emailController.text,
                        passwordController.text,
                        phone,
                      );

                      //نجاح
                      context.push('/home');
                    } catch (e) {
                      debugPrint(e.toString());

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  isLoading: false,
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(context.t.auth.alreadyHaveAnAccount),
                    TextButton(
                      onPressed: () {
                        context.push('/login');
                      },
                      child: Text(context.t.auth.login),
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
