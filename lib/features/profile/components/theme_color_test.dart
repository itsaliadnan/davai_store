import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class ColorPreviewScreen extends StatelessWidget {
  const ColorPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Color Preview")),
      body: colorPreview(context),
    );
  }
}

Widget colorPreview(BuildContext context) {
  final c = context.colorScheme;

  return ListView(
    children: [
      _item("primary", c.primary),
      _item("onPrimary", c.onPrimary),
      _item("surface", c.surface),
      _item("surfaceContainer", c.surfaceContainer),
      _item("onSurface", c.onSurface),
      _item("onSurfaceVariant", c.onSurfaceVariant),
      _item("secondary", c.secondary),
      _item("tertiary", c.tertiary),
    ],
  );
}

Widget _item(String name, Color color) {
  return Container(
    height: 60,
    color: color,
    alignment: Alignment.center,
    child: Text(name, style: const TextStyle(color: Colors.white)),
  );
}
