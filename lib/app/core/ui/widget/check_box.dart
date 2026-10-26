import 'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool _isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _isAccepted,
      onChanged: (bool? value) {
        setState(() {
          _isAccepted = value ?? false;
        });
      },
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          6,
        ), // Ajuste o valor como preferir (ex: 4, 6, 8)
      ),
      // Cor do quadradinho quando marcado
      activeColor: AppColors.primary, // Exemplo de verde claro estilo a imagem
      //checkColor: AppColors.inverseOnSurface, // Cor do "visto" dentro do quadradinho
      controlAffinity:
          ListTileControlAffinity.leading, // Coloca a caixa à esquerda
      title: RichText(
        text: TextSpan(
          style: GoogleFonts.inter(
                color: LoginColors.muted,
                fontSize: 12.0,
                height: 1.55,
              ),
          children: [
            const TextSpan(
              text:
                  'Aceito as regras de conduta, respeito às arbitragens e o código de ',
            ),
            TextSpan(
              text: 'Fair Play do FUTZeira',
              style: GoogleFonts.inter(
                color: AppColors.primaryStrong,
                fontSize: 13,
                fontWeight: FontWeight(900),
               //height: 1.60,
              ), // Parte em negrito como na imagem
            ),
            const TextSpan(text: '.'),
          ],
        ),
      ),
      contentPadding: EdgeInsets.zero, // Remove margens extras se precisar
    );
  }
}
