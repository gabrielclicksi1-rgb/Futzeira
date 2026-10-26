import 'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/app_colors.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      height: 42,
      child: Material(
        color: LoginColors.surfaceHigh.withValues(alpha: 0.72),
        shape: const CircleBorder(),
        child: IconButton(
          tooltip: label,
          onPressed: onPressed,
          icon: Icon(icon, size: 20, color: LoginColors.text),
        ),
      ),
    );
  }
}