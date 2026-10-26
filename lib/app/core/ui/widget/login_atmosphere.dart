import 'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/widget/blur_glow.dart';

class LoginAtmosphere extends StatelessWidget {
  const LoginAtmosphere({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: Stack(
        children: [
          Positioned(
            top: -115,
            left: -95,
            child: BlurGlow(color: Color(0x3375FF9E), size: 300),
          ),
          Positioned(
            top: 280,
            right: -130,
            child: BlurGlow(color: Color(0x1A00DDEB), size: 330),
          ),
          Positioned(
            bottom: -155,
            left: 40,
            child: BlurGlow(color: Color(0x1A00E676), size: 360),
          ),
        ],
      ),
    );
  }
}