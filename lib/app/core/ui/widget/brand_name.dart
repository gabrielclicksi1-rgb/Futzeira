import 'package:material_ui/material_ui.dart';

import 'package:futzera_app/app/core/ui/app_colors.dart';
class BrandName extends StatelessWidget {
  const BrandName({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.7,
        ),
        children: [
          TextSpan(
            text: 'FUT',
            style: TextStyle(color: AppColors.text),
          ),
          TextSpan(
            text: 'ZEIRA',
            style: TextStyle(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}