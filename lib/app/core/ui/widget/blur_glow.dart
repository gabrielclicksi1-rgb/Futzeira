import 'package:flutter/material.dart';
import 'dart:ui';

class BlurGlow extends StatelessWidget {
  const BlurGlow({super.key, required this.color, required this.size});
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 55, sigmaY: 55),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}