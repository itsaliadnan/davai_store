import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/features/product_details/presentation/components/quantity_icon_button.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuantityIconButton(icon: Icons.remove_rounded, onTap: onDecrease),
        SizedBox(
          width: 28,
          child: Text(
            '$quantity',
            textAlign: TextAlign.center,
            style: context.text.titleSmall,
          ),
        ),
        QuantityIconButton(icon: Icons.add_rounded, onTap: onIncrease),
      ],
    );
  }
}
