import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:futzera_app/app/core/ui/app_spacing.dart';
import 'package:futzera_app/app/core/ui/widget/home_header.dart';
import 'package:futzera_app/app/core/ui/widget/login_atmosphere.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './clipboard_controller.dart';

class ClipboardPage extends GetView<ClipboardController> {
  const ClipboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          LoginAtmosphere(),
          SafeArea(
            bottom: false,
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Se a largura da tela for maior que 600px (ex: Tablet ou PC), tratamos como tela grande
                double larguraDisponivel =
                    constraints.maxWidth - (AppSpacing.pageMargin * 2);

                double alturaDisponivel = constraints.maxHeight - 100;

                double larguraBaseadaNaAltura = alturaDisponivel / 1.544;

                double campoWidth = larguraDisponivel < larguraBaseadaNaAltura
                    ? larguraDisponivel
                    : larguraBaseadaNaAltura;

                campoWidth = campoWidth.clamp(250.0, 410.0);

                return Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.pageMargin,
                      vertical: AppSpacing.md,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: campoWidth,
                            height: campoWidth * 1.544,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green[700],
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),

                                Positioned.fill(
                                  child: CustomPaint(painter: Campo()),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          HomeHeader(
            topName: 'Prancheta',
            playerName: 'User Name',
            level: 14,
            rating: 84,
            onProfileTap: () {
              // TODO: navegar para a página de perfil.
            },
          ),
        ],
      ),
    );
  }
}

class Campo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = 5;

    canvas.drawLine(
      Offset(size.width * 1 / 100, size.height * 1 / 2),
      Offset(size.width * 0.99, size.height * 1 / 2),
      paint,
    );

    canvas.drawLine(
      Offset(size.width * 1 / 100, size.height * 1 / 2),
      Offset(size.width * 0.7, size.height * 1 / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
