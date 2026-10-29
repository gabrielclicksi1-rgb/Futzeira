import 'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/app_spacing.dart';
import 'package:google_fonts/google_fonts.dart';

/// Shared design tokens for the Pitch Elite / FUTZEIRA visual system.
abstract final class AppColors {
  // Main surfaces.
  static const background = Color(0xFF0D141C);
  static const surfaceLowest = Color(0xFF080F16);
  static const surfaceLow = Color(0xFF151C24);
  static const surface = Color(0xFF192028);
  static const surfaceHigh = Color(0xFF242B33);
  static const surfaceHighest = Color(0xFF2E353E);
  static const surfaceBright = Color(0xFF333A43);

  // Text and borders.
  static const foreground = Color(0xFFDCE3EE);
  static const foregroundMuted = Color(0xFFBACBB9);
  static const outline = Color(0xFF859585);
  static const outlineVariant = Color(0xFF3B4A3D);

  // Brand and semantic accents.
  static const primary = Color(0xFF75FF9E);
  static const primaryStrong = Color(0xFF00E676);
  static const onPrimary = Color(0xFF003918);
  static const primaryContainer = Color(0xFF00E676);
  static const onPrimaryContainer = Color(0xFF00612E);

  static const gold = Color(0xFFFFE16D);
  static const goldStrong = Color(0xFFE9C400);
  static const onGold = Color(0xFF3A3000);
  static const goldContainer = Color(0xFFFFDB3C);

  static const cyan = Color(0xFFBAECFF);
  static const cyanStrong = Color(0xFF51D7FF);
  static const onCyan = Color(0xFF003543);

  static const error = Color(0xFFFFB4AB);
  static const errorContainer = Color(0xFF93000A);
  static const onError = Color(0xFF690005);

  // Additional match-state colors from the Street Arcade reference.
  static const arcadeRed = Color(0xFFFF1744);
  static const electricOrange = Color(0xFFFF6D00);
  static const hazardYellow = Color(0xFFE2F952);

  static const inverseSurface = Color(0xFFDCE3EE);
  static const inverseOnSurface = Color(0xFF2A313A);
  static const inversePrimary = Color(0xFF006D35);
}

abstract final class LoginColors {
  static const background = Color(0xFF0A0E14);
  static const surface = Color(0xFF181C21);
  static const surfaceMid = Color(0xFF1C2025);
  static const surfaceHigh = Color(0xFF262A30);
  static const surfaceHighest = Color(0xFF31353B);
  static const text = Color(0xFFE0E2EA);
  static const muted = Color(0xFFBACBB9);
  static const outline = Color(0xFF859585);
  static const primary = AppColors.primary;
  static const primaryStrong = AppColors.primaryStrong;
  static const onPrimary = AppColors.onPrimary;
  static const secondary = Color(0xFFFFF0C9);
  static const gold = Color(0xFFFECF00);
  static const cyan = Color(0xFF87F5FF);
}

TextStyle labelStyle({required Color color, double fontSize = 10}) =>
    GoogleFonts.montserrat(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      letterSpacing: 0.9,
    );

TextStyle inputTextStyle({double letterSpacing = 0}) => GoogleFonts.inter(
  color: LoginColors.text,
  fontSize: 13,
  letterSpacing: letterSpacing,
);

InputDecoration inputDecoration({
  required String hint,
  IconData? icon,
  Widget? suffix,
  double? size,
}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: GoogleFonts.inter(
      color: LoginColors.outline.withValues(alpha: 0.78),
      fontSize: 13,
    ),
    prefixIcon: icon != null
        ? Icon(icon, color: AppColors.foregroundMuted, size: 20)
        : null,
    suffixIcon: suffix,
    filled: true,
    fillColor: LoginColors.surface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    errorStyle: GoogleFonts.inter(color: AppColors.error, fontSize: 11),
    enabledBorder: _fieldBorder(const Color(0xFF31353B)),
    focusedBorder: _fieldBorder(LoginColors.primaryStrong, width: 1.5),
    errorBorder: _fieldBorder(AppColors.onError),
    focusedErrorBorder: _fieldBorder(AppColors.errorContainer, width: 1.5),
    border: _fieldBorder(const Color(0xFF31353B)),
  );
}

OutlineInputBorder _fieldBorder(Color color, {double width = 1}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.sm),
      borderSide: BorderSide(color: color, width: width),
    );
