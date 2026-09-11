import 'package:davai_store/core/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';

class PhoneField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String completeNumber)? onChanged;
  final double? height;

  const PhoneField({super.key, this.controller, this.onChanged, this.height});

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  String code = '+964'; // افتراضي العراق
  String get fullPhoneNumber {
    return '$code${widget.controller?.text ?? ''}';
  }

  void _pickCountry() async {
    final country = await showDialog<Country>(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            height: 500,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(AppSpacing.md),
                  child: Text(
                    'Select Country',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (context, index) {
                      final c = countries[index];
                      return ListTile(
                        title: Text('${c.name} (+${c.dialCode})'),
                        onTap: () {
                          Navigator.pop(context, c);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (country != null) {
      setState(() {
        code = '+${country.dialCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(AppSpacing.md),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          // 🔹 كود الدولة (نفس القديم)
          InkWell(
            onTap: _pickCountry,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Text(
                code,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),

          // 🔹 Divider (نفس القديم)
          Container(height: 25, width: 1, color: Colors.grey.shade300),

          // 🔹 الرقم (نفس القديم)
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: '7XXXXXXXXX',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              ),
              onChanged: (value) {
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
