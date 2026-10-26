import 'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:futzera_app/app/core/ui/app_spacing.dart';
import 'package:futzera_app/app/core/ui/widget/round_icon_button.dart';




class Header extends StatelessWidget {
  final RoundIconButton? helpWidget;
  final RoundIconButton? iconWidget;
  final String label;
  final String textHeader;
  const Header({ super.key, this.label = '', required this.textHeader, this.iconWidget, this.helpWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width:42,
              height:42,
              child: iconWidget,
            ),
        ]
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: AppColors.surfaceHigh.withValues(alpha: 0.88),
                borderRadius: BorderRadius.circular(AppRadius.pill),
                border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                      boxShadow: [BoxShadow(color: AppColors.primary, blurRadius: 7)],
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(textHeader, style: labelStyle(color: AppColors.primary)),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width:42,
              height:42,
              child:helpWidget,
            )]
        ),
        /*RoundIconButton(
          icon: Icons.help_outline,
          label: 'Central de ajuda',
          onPressed: () => Get.snackbar(
            'Central de ajuda',
            'Adicione aqui a rota ou o canal de suporte do FUTZEIRA.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: LoginColors.surfaceHigh,
            colorText: LoginColors.text,
            margin: const EdgeInsets.all(AppSpacing.md),
          ),
        ),*/
      ],
    );
  }
}