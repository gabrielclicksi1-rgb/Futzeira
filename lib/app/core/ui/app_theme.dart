import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_spacing.dart';

 class AppTheme {
  AppTheme._();

  
  static final ThemeData dark = _buildDarkTheme();

  static ThemeData _buildDarkTheme() {
    final colorScheme = ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.onPrimaryContainer,
      secondary: const Color(0xFFFFF9EF),
      onSecondary: AppColors.onGold,
      secondaryContainer: AppColors.goldContainer,
      onSecondaryContainer: const Color(0xFF725F00),
      tertiary: AppColors.cyan,
      onTertiary: AppColors.onCyan,
      tertiaryContainer: AppColors.cyanStrong,
      onTertiaryContainer: const Color(0xFF005B70),
      error: AppColors.error,
      onError: AppColors.onError,
      errorContainer: AppColors.errorContainer,
      onErrorContainer: const Color(0xFFFFDAD6),
      surface: AppColors.background,
      onSurface: AppColors.foreground,
      surfaceContainerLowest: AppColors.surfaceLowest,
      surfaceContainerLow: AppColors.surfaceLow,
      surfaceContainer: AppColors.surface,
      surfaceContainerHigh: AppColors.surfaceHigh,
      surfaceContainerHighest: AppColors.surfaceHighest,
      surfaceBright: AppColors.surfaceBright,
      outline: AppColors.outline,
      outlineVariant: AppColors.outlineVariant,
      inverseSurface: AppColors.inverseSurface,
      onInverseSurface: AppColors.inverseOnSurface,
      inversePrimary: AppColors.inversePrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.surfaceLowest,
      cardColor: AppColors.surfaceLow,
      dividerColor: Colors.white.withValues(alpha: 0.08),
      textTheme: _buildTextTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.foreground,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: AppColors.foreground,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat',
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceLow,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, AppSpacing.minimumTouchTarget),
          backgroundColor: AppColors.primaryStrong,
          foregroundColor: AppColors.onPrimary,
          disabledBackgroundColor: AppColors.surfaceHighest,
          disabledForegroundColor: AppColors.foregroundMuted,
          elevation: 0,
          textStyle: _labelStyle(fontSize: 13, color: AppColors.onPrimary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, AppSpacing.minimumTouchTarget),
          foregroundColor: AppColors.foreground,
          side: const BorderSide(color: Color(0x4D51D7FF)),
          textStyle: _labelStyle(fontSize: 13, color: AppColors.foreground),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(0, AppSpacing.minimumTouchTarget),
          foregroundColor: AppColors.primary,
          textStyle: _labelStyle(fontSize: 12, color: AppColors.primary),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceLow,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        hintStyle: GoogleFonts.inter(
          color: AppColors.foregroundMuted.withValues(alpha: 0.7),
          fontSize: 14,
        ),
        labelStyle: GoogleFonts.inter(color: AppColors.foregroundMuted),
        enabledBorder: _inputBorder(AppColors.outlineVariant),
        focusedBorder: _inputBorder(AppColors.primaryStrong, width: 1.5),
        errorBorder: _inputBorder(AppColors.error),
        focusedErrorBorder: _inputBorder(AppColors.error, width: 1.5),
        border: _inputBorder(AppColors.outlineVariant),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceHigh,
        selectedColor: AppColors.primaryStrong.withValues(alpha: 0.16),
        disabledColor: AppColors.surface,
        secondarySelectedColor: AppColors.gold.withValues(alpha: 0.16),
        labelStyle: _labelStyle(fontSize: 11, color: AppColors.foreground),
        secondaryLabelStyle: _labelStyle(fontSize: 11, color: AppColors.gold),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primaryStrong,
        linearTrackColor: AppColors.surfaceHighest,
        refreshBackgroundColor: AppColors.surface,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surfaceHighest,
        contentTextStyle: GoogleFonts.inter(color: AppColors.foreground),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surfaceLowest,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.outline,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  static TextTheme _buildTextTheme() {
    final body = GoogleFonts.interTextTheme(ThemeData.dark().textTheme);
    final display = GoogleFonts.montserratTextTheme(body);

    return body.copyWith(
      displayLarge: _displayStyle(display.displayLarge, 56, 56, 900, -2.24),
      displayMedium: _displayStyle(display.displayMedium, 44, 44, 900, -1.32),
      displaySmall: _displayStyle(display.displaySmall, 36, 44, 800, -0.72),
      headlineLarge: _displayStyle(display.headlineLarge, 36, 44, 800, -0.72),
      headlineMedium: _displayStyle(display.headlineMedium, 28, 34, 800, -0.56),
      headlineSmall: _displayStyle(display.headlineSmall, 24, 32, 700, -0.24),
      titleLarge: _displayStyle(display.titleLarge, 20, 28, 700, 0),
      titleMedium: _displayStyle(display.titleMedium, 16, 24, 700, 0),
      titleSmall: _displayStyle(display.titleSmall, 14, 20, 700, 0.1),
      bodyLarge: _bodyStyle(body.bodyLarge, 16, 24),
      bodyMedium: _bodyStyle(body.bodyMedium, 14, 20),
      bodySmall: _bodyStyle(body.bodySmall, 12, 16),
      labelLarge: _labelStyle(fontSize: 12, color: AppColors.foreground),
      labelMedium: _labelStyle(fontSize: 11, color: AppColors.foregroundMuted),
      labelSmall: _labelStyle(fontSize: 10, color: AppColors.foregroundMuted),
    );
  }

  static TextStyle _displayStyle(
    TextStyle? base,
    double size,
    double lineHeight,
    int weight,
    double letterSpacing,
  ) =>
      (base ?? const TextStyle()).copyWith(
        fontSize: size,
        height: lineHeight / size,
        fontWeight: FontWeight.values[(weight ~/ 100) - 1],
        letterSpacing: letterSpacing,
        color: AppColors.foreground,
      );

  static TextStyle _bodyStyle(TextStyle? base, double size, double lineHeight) =>
      (base ?? const TextStyle()).copyWith(
        fontSize: size,
        height: lineHeight / size,
        color: AppColors.foreground,
      );

  static TextStyle _labelStyle({required double fontSize, required Color color}) =>
      GoogleFonts.montserrat(
        fontSize: fontSize,
        height: 14 / fontSize,
        fontWeight: FontWeight.w800,
        letterSpacing: fontSize <= 11 ? 0.88 : 0.24,
        color: color,
      );

  static OutlineInputBorder _inputBorder(Color color, {double width = 1}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        borderSide: BorderSide(color: color, width: width),
      );
}
