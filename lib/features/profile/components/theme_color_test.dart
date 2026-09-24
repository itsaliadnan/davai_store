import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class ColorPreviewScreen extends StatelessWidget {
  const ColorPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Preview')),
      body: colorPreview(context),
    );
  }
}

Widget colorPreview(BuildContext context) {
  final c = context.colorScheme;

  final colors = <String, Color>{
    // Primary
    'primary': c.primary,
    'onPrimary': c.onPrimary,
    'primaryContainer': c.primaryContainer,
    'onPrimaryContainer': c.onPrimaryContainer,

    // Secondary
    'secondary': c.secondary,
    'onSecondary': c.onSecondary,
    'secondaryContainer': c.secondaryContainer,
    'onSecondaryContainer': c.onSecondaryContainer,

    // Tertiary
    'tertiary': c.tertiary,
    'onTertiary': c.onTertiary,
    'tertiaryContainer': c.tertiaryContainer,
    'onTertiaryContainer': c.onTertiaryContainer,

    // Error
    'error': c.error,
    'onError': c.onError,
    'errorContainer': c.errorContainer,
    'onErrorContainer': c.onErrorContainer,

    // Surface
    'surface': c.surface,
    'onSurface': c.onSurface,
    'surfaceDim': c.surfaceDim,
    'surfaceBright': c.surfaceBright,

    // Surface containers
    'surfaceContainerLowest': c.surfaceContainerLowest,
    'surfaceContainerLow': c.surfaceContainerLow,
    'surfaceContainer': c.surfaceContainer,
    'surfaceContainerHigh': c.surfaceContainerHigh,
    'surfaceContainerHighest': c.surfaceContainerHighest,

    // Surface variants
    'onSurfaceVariant': c.onSurfaceVariant,

    // Outline
    'outline': c.outline,
    'outlineVariant': c.outlineVariant,

    // Inverse
    'inverseSurface': c.inverseSurface,
    'onInverseSurface': c.onInverseSurface,
    'inversePrimary': c.inversePrimary,

    // Fixed colors
    'primaryFixed': c.primaryFixed,
    'primaryFixedDim': c.primaryFixedDim,
    'onPrimaryFixed': c.onPrimaryFixed,
    'onPrimaryFixedVariant': c.onPrimaryFixedVariant,

    'secondaryFixed': c.secondaryFixed,
    'secondaryFixedDim': c.secondaryFixedDim,
    'onSecondaryFixed': c.onSecondaryFixed,
    'onSecondaryFixedVariant': c.onSecondaryFixedVariant,

    'tertiaryFixed': c.tertiaryFixed,
    'tertiaryFixedDim': c.tertiaryFixedDim,
    'onTertiaryFixed': c.onTertiaryFixed,
    'onTertiaryFixedVariant': c.onTertiaryFixedVariant,
  };

  return ListView(
    padding: const EdgeInsets.all(16),
    children: [
      for (final entry in colors.entries) _item(entry.key, entry.value),
    ],
  );
}

Widget _item(String name, Color color) {
  final brightness = ThemeData.estimateBrightnessForColor(color);

  return Container(
    height: 64,
    margin: const EdgeInsets.only(bottom: 4),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
    ),
    alignment: Alignment.centerLeft,
    child: Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: TextStyle(
              color: brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}',
          style: TextStyle(
            color: brightness == Brightness.dark
                ? Colors.white70
                : Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
