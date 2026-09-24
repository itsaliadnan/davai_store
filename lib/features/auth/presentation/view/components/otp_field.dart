import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpField extends StatelessWidget {
  final Function(String) onCompleted;

  const OtpField({super.key, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: context.colorScheme.surfaceDim),
      ),
    );

    return Center(
      child: Pinput(
        length: 6,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyDecorationWith(
          border: Border.all(color: context.colorScheme.primary, width: 2),
        ),
        submittedPinTheme: defaultPinTheme.copyDecorationWith(
          color: context.colorScheme.surface,
          border: Border.all(color: context.colorScheme.surfaceDim),
        ),
        onCompleted: (pin) {
          onCompleted(pin);
        },
      ),
    );
  }
}
