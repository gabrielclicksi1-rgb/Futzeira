import 'dart:math' as math;

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


      final paintFill = Paint()
      ..color = AppColors.inversePrimary
      ..style = PaintingStyle.fill;

     final baixoPontoPenalt = Offset(size.width * 1/2 , size.height - 80);

     final double raioMeiaLua = size.width * 0.10;

     //final baixorect = Rect.fromCircle(center: baixoPontoPenalt, radius: raioMeiaLua);
     final baixorect = Rect.fromCenter(
      center:baixoPontoPenalt,
      width: size.width * 0.2,  // Largura do oval (horizontal)
      height: size.height * 0.10, // Altura do oval (vertical - mude aqui para deixar mais achatado ou pontudo)
    );

      const double baixoanguloInicial = math.pi;

      const double anguloVarredura = math.pi;




      final altoPontoPenalt = Offset(size.width * 1/2, 80);
      final altorect = Rect.fromCircle(center: altoPontoPenalt, radius: raioMeiaLua);
      const double altoanguloInicial = 0.0;
       
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
       paintFill,
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




  
  //marca do penalti baixo
    canvas.drawCircle(
      Offset(size.width * 1/2, size.height - 55),
      size.width * 0.0070, // 15% da largura do campo
       paintFill,
    );
   // marca do penalti cima
    canvas.drawCircle(
      Offset(size.width * 1/2, 55),
      size.width * 0.0070, // 15% da largura do campo
       paintFill,
    );


    canvas.drawLine(
      Offset( size.width * 8/20, 10),
      Offset(size.width * 8/20, 2),
      paint,
    );

    canvas.drawLine(
      Offset( size.width * 12/20, 10),
      Offset(size.width * 12/20, 2),
      paint,
    );


     canvas.drawLine(
      Offset( size.width * 8/20, 2),
      Offset(size.width * 12/20, 2),
      paint,
    );



     canvas.drawLine(
      Offset( size.width * 8/20, size.height - 10),
      Offset(size.width * 8/20, size.height - 2),
      paint,
    );


    canvas.drawLine(
      Offset( size.width * 12/20, size.height - 10),
      Offset(size.width * 12/20, size.height - 2),
      paint,
    );


    
    canvas.drawLine(
      Offset( size.width * 8/20, size.height - 2),
      Offset(size.width * 12/20, size.height - 2),
      paint,
    );


    
    canvas.drawLine(
      Offset( size.width * 7/20, size.height - 35),
      Offset(size.width * 7/20, size.height - 10),
      paint,
    );

    canvas.drawLine(
      Offset( size.width * 13/20, size.height - 35),
      Offset(size.width * 13/20, size.height - 10),
      paint,
    );

    canvas.drawLine(
      Offset( size.width * 7/20, size.height - 35),
      Offset(size.width * 13/20, size.height - 35),
      paint,
    );




 canvas.drawLine(
      Offset( size.width * 7/20,   35),
      Offset(size.width * 7/20,   10),
      paint,
    );

    canvas.drawLine(
      Offset( size.width * 13/20,   35),
      Offset(size.width * 13/20,   10),
      paint,
    );

    canvas.drawLine(
      Offset( size.width * 7/20,   35),
      Offset(size.width * 13/20,   35),
      paint,
    );





   
  
    canvas.drawArc(baixorect,  baixoanguloInicial, anguloVarredura, false, paint);
    canvas.drawArc(altorect,  altoanguloInicial, anguloVarredura, false, paint);
     


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
