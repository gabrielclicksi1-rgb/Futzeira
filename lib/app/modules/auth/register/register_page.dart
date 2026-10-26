import 'package:flutter/material.dart';

import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:futzera_app/app/core/ui/app_spacing.dart';
import 'package:futzera_app/app/core/ui/fut_state.dart';
import 'package:futzera_app/app/core/ui/widget/Header.dart';
import 'package:futzera_app/app/core/ui/widget/athlete_photo_card.dart';
import 'package:futzera_app/app/core/ui/widget/check_box.dart';
import 'package:futzera_app/app/core/ui/widget/dominant_foot_Selector.dart';
import 'package:futzera_app/app/core/ui/widget/field_label.dart';
import 'package:futzera_app/app/core/ui/widget/generic_little_card.dart';
import 'package:futzera_app/app/core/ui/widget/line_progress.dart';
import 'package:futzera_app/app/core/ui/widget/login_atmosphere.dart';
import 'package:futzera_app/app/core/ui/widget/positon_selector.dart';
import 'package:futzera_app/app/core/ui/widget/round_icon_button.dart';
import 'package:futzera_app/app/modules/auth/register/register_controller.dart';

import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegistrarPageState();
}

class _RegistrarPageState extends FutState<RegisterPage, RegisterController> {
  final nameController = TextEditingController();
  //final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //final confirmPassController = TextEditingController();
  bool _obscurePassword = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          LoginAtmosphere(),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 448),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.pageMargin,
                    vertical: AppSpacing.md,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //principal Children
                      Header(
                        iconWidget: RoundIconButton(
                          icon: Icons.arrow_back,
                          label: 'Voltar',
                          onPressed: () => Get.back(),
                        ),
                        textHeader: 'PASSO 1 DE 2',
                      ),
                      SizedBox(height: AppSpacing.sm),
                      LineProgress(),
                      SizedBox(height: AppSpacing.lg),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GenericLittleCard(
                            textSize: 12.8,
                            color: AppColors.primaryContainer.withAlpha(77),
                            label: 'TEMPORADA OFICIAL 2027',
                            icon: Icons.star_rounded,
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpacing.xs),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'CRIE SEU CARD',
                              style: labelStyle(
                                fontSize: 30,
                                color: AppColors.inverseSurface,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' DE ATLETA',
                                  style: labelStyle(
                                    fontSize: 30,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 330),
                        child: Text(
                          'Entre para o ecossistema do futebol amador, dispute partidas de alto nível e monte seu legado no gramado',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.inter(
                            color: LoginColors.muted,
                            fontSize: 15.9,
                            height: 1.55,
                          ),
                        ),
                      ),
                      SizedBox(height: AppSpacing.md),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [AthletePhotoCard()],
                      ),
                      SizedBox(height: AppSpacing.xs),
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              FieldLabel(
                                title: 'NOME COMPLETO',
                                //trailing: 'ex: #10-SP',
                                icon: Icons.person,
                                size: 14,
                                color: AppColors.primaryStrong,
                              ),
                              const SizedBox(height: 6),
                              TextFormField(
                                controller: nameController,

                                textInputAction: TextInputAction.next,
                                autofillHints: const [
                                  AutofillHints.username,
                                  AutofillHints.email,
                                ],
                                style: inputTextStyle(),
                                decoration: inputDecoration(
                                  hint: 'lucas@futzeira.com ou #10-SP',
                                ),
                                validator: (value) =>
                                    (value == null || value.trim().isEmpty)
                                    ? 'Informe seu e-mail ou ID de atleta.'
                                    : null,
                              ),
                              SizedBox(height: AppSpacing.md),
                              FieldLabel(
                                title: 'APELIDO DE JOGADOR',
                                //trailing: 'ex: #10-SP',
                                icon: Icons.sports_soccer,
                                size: 12,
                                color: AppColors.primaryStrong,
                              ),
                              const SizedBox(height: 6),
                              TextFormField(
                                controller: userNameController,
                                textInputAction: TextInputAction.next,
                                autofillHints: const [
                                  AutofillHints.username,
                                  AutofillHints.email,
                                ],
                                style: inputTextStyle(),
                                decoration: inputDecoration(
                                  hint: 'lucas@futzeira',
                                  //icon: Icons.badge_outlined,
                                ),
                                validator: (value) =>
                                    (value == null || value.trim().isEmpty)
                                    ? 'Informe seu e-mail ou ID de atleta.'
                                    : null,
                              ),
                              SizedBox(height: AppSpacing.md),
                              FieldLabel(
                                title: 'POSIÇÃO DE DESTAQUE',
                                //trailing: 'ex: #10-SP',
                                icon: Icons.diversity_2_sharp,
                                size: 12,
                                color: AppColors.primaryStrong,
                              ),
                              const SizedBox(height: 6),

                              PositionSelector(controller: controller),

                              SizedBox(height: AppSpacing.md),

                              FieldLabel(
                                title: 'PERNA DOMINANTE',
                                //trailing: 'ex: #10-SP',
                                icon: Icons.do_not_step_outlined,
                                size: 14,
                                color: AppColors.primaryStrong,
                              ),
                              const SizedBox(height: 6),

                              DominantFootSelector(controller: controller),

                              SizedBox(height: AppSpacing.md),

                              FieldLabel(
                                title: 'E-MAIL PRICIPAL',
                                //trailing: 'ex: #10-SP',
                                icon: Icons.mail_outline,
                                size: 14,
                                color: AppColors.primaryStrong,
                              ),

                              const SizedBox(height: 6),

                              TextFormField(
                                controller: emailController,

                                textInputAction: TextInputAction.next,
                                autofillHints: const [
                                  AutofillHints.username,
                                  AutofillHints.email,
                                ],
                                style: inputTextStyle(),
                                decoration: inputDecoration(
                                  hint: 'lucas@futzeira',
                                  //icon: Icons.badge_outlined,
                                ),
                                validator: (value) =>
                                    (value == null || value.trim().isEmpty)
                                    ? 'Informe seu e-mail ou ID de atleta.'
                                    : null,
                              ),

                              SizedBox(height: AppSpacing.md),

                              FieldLabel(
                                title: 'SENHA DE ACESSO',
                                //trailing: 'ex: #10-SP',
                                icon: Icons.lock_outline,
                                size: 14,
                                color: AppColors.primaryStrong,
                              ),

                              const SizedBox(height: 6),

                              TextFormField(
                                obscureText: _obscurePassword,
                                controller: passwordController,
                                //keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                autofillHints: const [
                                  AutofillHints.username,
                                  AutofillHints.email,
                                ],
                                style: inputTextStyle(),
                                decoration: inputDecoration(
                                  hint: 'lucas@futzeira',
                                  //icon: Icons.badge_outlined,
                                  suffix: IconButton(
                                    icon: Icon(
                                      // Alterna o ícone dependendo do estado
                                      _obscurePassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: LoginColors.muted,
                                      size: 16,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword =
                                            !_obscurePassword; // Inverte o estado ao clicar
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) =>
                                    (value == null || value.trim().isEmpty)
                                    ? 'Informe seu e-mail ou ID de atleta.'
                                    : null,
                              ),

                              SizedBox(height: AppSpacing.md),

                              FieldLabel(
                                title: 'COMFIRMAR SENHA',
                                //trailing: 'ex: #10-SP',
                                icon: Icons.security_outlined,
                                size: 13,
                                color: AppColors.primaryStrong,
                              ),

                              const SizedBox(height: 6),

                              TextFormField(
                                obscureText: true,
                                //controller: controller.athleteIdController,
                                //keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                autofillHints: const [
                                  AutofillHints.username,
                                  AutofillHints.email,
                                ],
                                style: inputTextStyle(),
                                decoration: inputDecoration(
                                  hint: 'lucas@futzeira',

                                  //icon: Icons.badge_outlined,
                                  suffix: Icon(
                                    Icons.security_rounded,
                                    color: AppColors.foregroundMuted,
                                    size: 14,
                                  ),
                                ),
                                validator: (value) =>
                                    (value == null || value.trim().isEmpty)
                                    ? 'Informe seu e-mail ou ID de atleta.'
                                    : null,
                              ),

                              SizedBox(height: AppSpacing.sm),

                              CheckBox(),

                              SizedBox(height: AppSpacing.sm),

                              ElevatedButton(
                                onPressed: () {
                                  final position =
                                      controller.selectedPosition.value;

                                  if (position == null) {
                                    Get.snackbar(
                                      'Atenção',
                                      'Selecione uma posição de destaque.',
                                    );
                                    return;
                                  }

                                  // Envie `position` junto com os demais dados do cadastro.
                                  controller.register(position);
                                },
                                child: const Text('CRIAR CONTA'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
