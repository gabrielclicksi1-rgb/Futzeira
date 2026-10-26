import 'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:futzera_app/app/core/ui/app_spacing.dart';

class PrimaryButton extends StatelessWidget {
  final Widget widgetfinaly;
  final String? randomTextloading;
  final bool? isLoading;
  final VoidCallback? onPressed;
  const PrimaryButton({
    super.key,
     this.isLoading,
     this.onPressed,
    this.randomTextloading = 'AQUECENDO...',
      required this.widgetfinaly});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [LoginColors.primary, LoginColors.primaryStrong],
            ),
            borderRadius: BorderRadius.circular(AppRadius.sm),
            boxShadow: [
              BoxShadow(
                color: LoginColors.primaryStrong.withValues(alpha: 0.20),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: widgetfinaly
        ),
    );
    
  }
}

class PrimaryButtonTextStyle extends TextStyle {
  const PrimaryButtonTextStyle()
      : super(
          color: LoginColors.onPrimary,
          fontSize: 13,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.8,
        );
}