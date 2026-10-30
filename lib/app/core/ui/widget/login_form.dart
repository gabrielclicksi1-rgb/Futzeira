import 'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:futzera_app/app/core/ui/app_spacing.dart';
import 'package:futzera_app/app/core/ui/widget/field_label.dart';
import 'package:futzera_app/app/modules/auth/login/login_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({required this.controller});
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: LoginColors.surfaceHigh.withValues(alpha: 0.64),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: Colors.white.withValues(alpha: 0.045)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 28,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 70,
            right: 70,
            child: Container(
              height: 1,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Color(0x4D75FF9E),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 6),
                /*TextFormField(
                  //controller: _emailEC,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [
                    AutofillHints.username,
                    AutofillHints.email,
                  ],
                  style: _inputTextStyle(),
                  decoration: _inputDecoration(
                    hint: 'lucas@futzeira.com ou #10-SP',
                    icon: Icons.badge_outlined,
                  ),
                  validator: (value) => (value == null || value.trim().isEmpty)
                      ? 'Informe seu e-mail ou ID de atleta.'
                      : null,
                ),*/
                //const SizedBox(height: AppSpacing.md),
                //const FieldLabel(title: 'Senha Tática'),
                //const SizedBox(height: 6),
                /*TextFormField(
                  //controller: //_passwordEC
                  obscureText: true, // controller.isPasswordObscured.value,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.password],
                  style: _inputTextStyle(letterSpacing: 1.1),
                  decoration: _inputDecoration(
                    hint: '••••••••••••',
                    icon: Icons.lock_outline,
                    suffix: IconButton(
                      tooltip: controller.isPasswordObscured.value
                          ? 'Mostrar senha'
                          : 'Ocultar senha',
                      onPressed: controller.togglePasswordVisibility,
                      icon: Icon(
                        controller.isPasswordObscured.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 20,
                        color: controller.isPasswordObscured.value
                            ? LoginColors.muted
                            : LoginColors.primary,
                      ),
                    ),
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'Informe sua senha.'
                        : null,
                    onFieldSubmitted: (_) => controller.submit(),
                  ),
                ),*/
                //const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(AppRadius.xs),

                        //onTap: //() => controller.toggleRememberAccess(
                        //!controller.rememberAccess.value,)
                        child: Row(
                          children: [
                            SizedBox(
                              width: 22,
                              height: 22,
                              child: Checkbox(
                                value: true, //controller.rememberAccess.value,
                                onChanged: (bool? value) {
                                  print('test');
                                }, //controller.toggleRememberAccess,
                                activeColor: LoginColors.primary,
                                checkColor: LoginColors.onPrimary,
                                side: const BorderSide(
                                  color: LoginColors.outline,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                'Lembrar acesso',
                                style: GoogleFonts.inter(
                                  color: LoginColors.muted,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {}, // controller.showIntegrationMessage()
                      //'Recuperar senha',
                      style: TextButton.styleFrom(
                        minimumSize: const Size(0, 40),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        foregroundColor: LoginColors.primary,
                      ),
                      child: Text(
                        'Esqueci a senha',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),

                //_PrimaryLoginButton(
                //isLoading: true, //controller.isLoading.value,

                //onPressed: () {}, //controller.submit,
                // ),
                //PrimaryButton(widgetfinaly: Text('teste'),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle? _inputTextStyle() {}

  InputDecoration? _inputDecoration({
    required String hint,
    required IconData icon,
  }) {}
}

class _PrimaryLoginButton {}
