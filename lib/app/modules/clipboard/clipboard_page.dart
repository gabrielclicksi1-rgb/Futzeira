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
                double larguraDisponivel;
                bool responsive = constraints.maxWidth > 380;
                  double alturaDisponivel;

                if(constraints.maxWidth >= 600){
                  larguraDisponivel = 400 ;//16 de pageMargin
                  alturaDisponivel = 450;
                } else if(constraints.maxWidth >= 470 && constraints.maxWidth <= 600){
                  larguraDisponivel = 
                  constraints.maxWidth * 0.60 ;//16 de pageMargin
                  alturaDisponivel = constraints.maxHeight * 0.70;
                } 
                else{ 
                  larguraDisponivel = responsive ?
                 constraints.maxWidth * 0.99 :
                  constraints.maxWidth - (AppSpacing.pageMargin * 2 );
                  alturaDisponivel = responsive? constraints.maxWidth * 1.1 :constraints.maxWidth * 1.1 ;
                   }//16 de pageMargin}
              

                return Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.pageMargin,
                      vertical: AppSpacing.md,
                    ),
                    child: Column(
                      children: [

                        SizedBox(
                          height: 52,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: SizedBox(
                            width: larguraDisponivel,
                            height: alturaDisponivel,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.surfaceLowest,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: AppColors.onPrimary,
                                      width: 1,
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
    final paint = Paint()
      ..color = AppColors.inversePrimary
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // Exemplo: Desenhando apenas a linha do meio-campo usando as dimensões relativas (size)
    // size.width e size.height se adaptam perfeitamente a qualquer tamanho de tela!
    canvas.drawLine(
      Offset(10, size.height / 2),
      Offset(size.width - 10, size.height / 2),
      paint,
    );

    // Círculo central usando o tamanho relativo
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width * 0.12, // 15% da largura do campo
      paint,
    );
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width * 0.007, // 15% da largura do campo
      paint,
    );

     canvas.drawLine(
      Offset(10, 10),
      Offset(10, size.height - 10),
      paint,
    );

    canvas.drawLine(
      Offset(10, 10),
      Offset(size.width -10 , 10),
      paint,
    );

    canvas.drawLine(
      Offset(size.width - 10, 10 ),
      Offset(size.width -10 , size.height - 10),
      paint,
    );

     canvas.drawLine(
      Offset( 10,  size.height - 10 ),
      Offset(size.width -10 , size.height - 10),
      paint,
    );

    canvas.drawLine(
      Offset( size.width * 2/10,  size.height - 10, ),
      Offset(size.width * 2/10, size.height - 80),
      paint,
    );

     canvas.drawLine(
      Offset( size.width * 2/10 ,size.height - 80, ),
      Offset(size.width * 8/10, size.height - 80),
      paint,
    );

    canvas.drawLine(
      Offset( size.width * 8/10 ,size.height - 10, ),
      Offset(size.width * 8/10, size.height - 80),
      paint,
    );

     canvas.drawLine(
      Offset( size.width * 2/10, 10 ),
      Offset(size.width * 2/10, 80),
      paint,
    );

     canvas.drawLine(
      Offset( size.width * 2/10, 80),
      Offset(size.width * 8/10, 80),
      paint,
    );

     canvas.drawLine(
      Offset( size.width * 8/10, 80),
      Offset(size.width * 8/10, 10),
      paint,
    );



 

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
