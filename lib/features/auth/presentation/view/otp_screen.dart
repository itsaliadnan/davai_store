import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/core/utils/app_snackbar.dart';
import 'package:davai_store/features/auth/presentation/providers/user_provider.dart';
import 'package:davai_store/features/auth/presentation/view/components/otp_field.dart';
import 'package:davai_store/core/widgets/custom_button.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class OtpScreen extends ConsumerStatefulWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  String otp = '';

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
                      context.t.otp.verifyEmail,
                      style: context.text.titleLarge,
                    ),
                  ],
                ),
                Lottie.asset('assets/lottie/otp.json'),
                const SizedBox(height: AppSpacing.xl),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    context.t.otp.otpHint,
                    textAlign: TextAlign.center,
                    style: context.text.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OtpField(
                    onCompleted: (String value) {
                      setState(() {
                        otp = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                CustomButton(
                  width: 120,
                  text: context.t.otp.verify,
                  onPressed: () async {
                    try {
                      await ref
                          .read(userApiProvider)
                          .verifyResetOtp(widget.email, otp);

                      if (!context.mounted) return;

                      context.push(
                        '/new-password',
                        extra: {
                          context.t.auth.email: widget.email,
                          context.t.auth.otp: otp,
                        },
                      );
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
