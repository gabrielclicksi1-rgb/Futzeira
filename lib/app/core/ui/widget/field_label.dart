import 'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldLabel extends StatelessWidget {
  const FieldLabel({ super.key,required this.title, this.trailing, this.icon,this.size, this.color });
  final String title;
  final String? trailing;
  final IconData? icon; 
  final double?  size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, size: size, color: color),
        SizedBox(width: 5),
        Text(title, style: labelStyle(color: LoginColors.muted)),
        if (trailing != null)
          Text(
            trailing!,
            style: GoogleFonts.inter(
              color: LoginColors.cyan,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}