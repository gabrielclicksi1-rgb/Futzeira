import'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:futzera_app/app/core/ui/app_spacing.dart';
class SocialDivider extends StatelessWidget {
  final double paddingHorizontal;
  final String label;
  const SocialDivider({super.key,  this.label = '',  this.paddingHorizontal = 0.0});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Row(
        children: [
          const Expanded(child: Divider(color: LoginColors.surfaceHigh, height: 1)),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: paddingHorizontal),
            child: Text(label, style: labelStyle(color: LoginColors.outline)),
          ),
          const Expanded(child: Divider(color: LoginColors.surfaceHigh, height: 1)),
        ],
      ),
    );
  }
}