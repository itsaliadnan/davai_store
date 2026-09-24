import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class QuantityIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const QuantityIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, size: 18, color: context.colorScheme.onSurface),
      ),
    );
  }
}
