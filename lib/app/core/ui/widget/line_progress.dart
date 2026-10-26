import 'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/app_colors.dart';

class LineProgress extends StatelessWidget {
  const LineProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // Criar widget.
      borderRadius: BorderRadius.circular(99),
      child: LinearProgressIndicator(
        value: 50 / 100,
        minHeight: 8,
        backgroundColor:  AppColors.inverseOnSurface,
        valueColor: const AlwaysStoppedAnimation(AppColors.primary),
      ),
    );
  }
}
