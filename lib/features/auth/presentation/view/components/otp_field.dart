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
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
    );

    return Center(
      child: Pinput(
        length: 6,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyDecorationWith(
          border: Border.all(color: Colors.blue, width: 2),
        ),
        submittedPinTheme: defaultPinTheme.copyDecorationWith(
          color: Colors.blue.shade50,
          border: Border.all(color: Colors.blue),
        ),
        onCompleted: (pin) {
          onCompleted(pin);
        },
      ),
    );
  }
}
