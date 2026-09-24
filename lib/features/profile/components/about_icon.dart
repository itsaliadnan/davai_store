import 'package:flutter/material.dart';

class AboutIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const AboutIcon({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Icon(icon, color: color, size: 23),
    );
  }
}
