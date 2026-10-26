import 'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:futzera_app/app/core/ui/app_spacing.dart';

class GenericLittleCard extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color color;
  final double textSize;
  const GenericLittleCard({ super.key, required this.label, this.icon = Icons.abc, required this.color, this.textSize = 10 });

   @override
   Widget build(BuildContext context) {
       return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(AppRadius.xs),
                border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
              ),
              child: Row(
               mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 16,),
                  const SizedBox(width: 3),
                  Text(label, style: labelStyle(fontSize: textSize ,color: AppColors.primary,),)
                ],
              ),
            );
  }
}