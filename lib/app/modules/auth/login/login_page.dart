import 'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/fut_state.dart';
import 'package:futzera_app/app/core/ui/widget/field_label.dart';
import 'package:futzera_app/app/core/ui/widget/header.dart';
import 'package:futzera_app/app/core/ui/widget/login_form.dart';
import 'package:futzera_app/app/core/ui/widget/primary_button.dart';
import 'package:futzera_app/app/core/ui/widget/social_divider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:futzera_app/app/modules/auth/login/login_controller.dart';

import 'package:futzera_app/app/core/ui/widget/login_atmosphere.dart';
import 'package:futzera_app/app/core/ui/widget/round_icon_button.dart';

import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:futzera_app/app/core/ui/app_spacing.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends FutState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoginColors.background,
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
                      Header(textHeader: 'TEMPORADA 2027'),
                      const SizedBox(height: AppSpacing.md),
                      const _LoginBrand(),
                      const SizedBox(height: AppSpacing.lg),
                      LoginForm(controller: controller),
                      const SocialDivider(
                        label: 'OU ACESSE COM',
                        paddingHorizontal: 12,
                      ),
                      _SocialButtons(),
                      const SizedBox(height: AppSpacing.md),
                      _GuestAccessTile(),
                      const SizedBox(height: AppSpacing.lg),
                      _RegistrationFooter(),
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

// ignore: unused_element
class _LoginHeader extends StatelessWidget {
  const _LoginHeader({required this.onBack});
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: LoginColors.surfaceHigh.withValues(alpha: 0.88),
            borderRadius: BorderRadius.circular(AppRadius.pill),
            border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: LoginColors.primary,
                  boxShadow: [
                    BoxShadow(color: LoginColors.primary, blurRadius: 7),
                  ],
                ),
              ),
              const SizedBox(width: 7),
              Text(
                'TEMPORADA 2027',
                style: _labelStyle(color: LoginColors.primary),
              ),
            ],
          ),
        ),
        RoundIconButton(
          icon: Icons.help_outline,
          label: 'Central de ajuda',
          onPressed: () => Get.snackbar(
            'Central de ajuda',
            'Adicione aqui a rota ou o canal de suporte do FUTZEIRA.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: LoginColors.surfaceHigh,
            colorText: LoginColors.text,
            margin: const EdgeInsets.all(AppSpacing.md),
          ),
        ),
      ],
    );
  }
}

class _LoginBrand extends StatelessWidget {
  const _LoginBrand();

  @override
  Widget build(BuildContext context) {
    final display = Theme.of(context).textTheme.headlineLarge;

    return Column(
      children: [
        SizedBox(
          width: 72,
          height: 72,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: 0.785398,
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: LoginColors.primary.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: LoginColors.primary.withValues(alpha: 0.25),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [LoginColors.surfaceHighest, LoginColors.surface],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 16,
                      offset: Offset(0, 7),
                    ),
                  ],
                ),
                child: const Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      color: LoginColors.primary,
                      size: 34,
                    ),
                    Icon(Icons.add, color: LoginColors.primary, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('FUT', style: _brandWordStyle(display, LoginColors.text)),
            const SizedBox(width: 6),
            Text('ZEIRA', style: _brandWordStyle(display, LoginColors.primary)),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Entre em Campo',
          style: GoogleFonts.montserrat(
            color: LoginColors.text,
            fontSize: 28,
            height: 34 / 28,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.56,
          ),
        ),
        const SizedBox(height: 6),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 330),
          child: Text(
            'Acesse seu card de atleta, gerencie seu clube e confirme presença nas partidas de hoje.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: LoginColors.muted,
              fontSize: 12,
              height: 1.55,
            ),
          ),
        ),
      ],
    );
  }

  TextStyle _brandWordStyle(TextStyle? base, Color color) =>
      GoogleFonts.montserrat(
        textStyle: base,
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.1,
      );
}

class _PrimaryLoginButton extends StatelessWidget {
  const _PrimaryLoginButton({required this.isLoading, required this.onPressed});
  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.minimumTouchTarget,
      child: PrimaryButton(
        widgetfinaly: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(AppRadius.sm),
          child: Center(
            child: isLoading
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 17,
                        height: 17,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: LoginColors.onPrimary,
                        ),
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Text('AQUECENDO...', style: PrimaryButtonTextStyle()),
                    ],
                  )
                : const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'ENTRAR NA PARTIDA',
                        style: PrimaryButtonTextStyle(),
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Icon(
                        Icons.sports_soccer,
                        size: 20,
                        color: LoginColors.onPrimary,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _SocialButtons extends StatelessWidget {
  const _SocialButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SocialButton(
            label: 'Google',
            icon: const _GoogleMark(),
            onPressed: () => {}, //controller.showIntegrationMessage('Google'),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _SocialButton(
            label: 'Apple',
            icon: const Icon(Icons.apple, size: 20, color: LoginColors.text),
            onPressed: () => {}, // controller.showIntegrationMessage('Apple'),
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });
  final String label;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.minimumTouchTarget,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: LoginColors.text,
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: LoginColors.surfaceHigh,
          side: BorderSide(color: Colors.white.withValues(alpha: 0.035)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
        ),
      ),
    );
  }
}

class _GoogleMark extends StatelessWidget {
  const _GoogleMark();

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Color(0xFF4285F4),
          Color(0xFF34A853),
          Color(0xFFFBBC05),
          Color(0xFFEA4335),
        ],
      ).createShader(bounds),
      child: Text(
        'G',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _GuestAccessTile extends StatelessWidget {
  const _GuestAccessTile();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: LoginColors.surface.withValues(alpha: 0.86),
      borderRadius: BorderRadius.circular(AppRadius.sm),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        onTap: () =>
            {}, // controller.showIntegrationMessage('Acesso de convidado'),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: LoginColors.cyan.withValues(alpha: 0.13),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.travel_explore,
                  color: LoginColors.cyan,
                  size: 19,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Entrar como Convidado / Olheiro',
                      style: GoogleFonts.montserrat(
                        color: LoginColors.text,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Explore quadras, artilheiros e torneios abertos',
                      style: GoogleFonts.inter(
                        color: LoginColors.muted,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              const Icon(
                Icons.chevron_right,
                color: LoginColors.muted,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegistrationFooter extends StatelessWidget {
  const _RegistrationFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Ainda não tem um Card de Atleta?',
          style: GoogleFonts.inter(color: LoginColors.muted, fontSize: 12),
        ),
        TextButton.icon(
          onPressed: () {
            Get.toNamed('/auth/register');
          }, //controller.showIntegrationMessage('Criar conta'),
          iconAlignment: IconAlignment.end,
          icon: const Icon(Icons.arrow_forward, size: 16),
          label: Text(
            'Crie sua conta grátis',
            style: GoogleFonts.montserrat(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          style: TextButton.styleFrom(
            foregroundColor: LoginColors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
      ],
    );
  }
}

InputDecoration _inputDecoration({
  required String hint,
  required IconData icon,
  Widget? suffix,
}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: GoogleFonts.inter(
      color: LoginColors.outline.withValues(alpha: 0.78),
      fontSize: 13,
    ),
    prefixIcon: Icon(icon, color: LoginColors.muted, size: 20),
    suffixIcon: suffix,
    filled: true,
    fillColor: LoginColors.surface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    errorStyle: GoogleFonts.inter(color: LoginColors.secondary, fontSize: 11),
    enabledBorder: _fieldBorder(const Color(0xFF31353B)),
    focusedBorder: _fieldBorder(LoginColors.primaryStrong, width: 1.5),
    errorBorder: _fieldBorder(LoginColors.secondary),
    focusedErrorBorder: _fieldBorder(LoginColors.secondary, width: 1.5),
    border: _fieldBorder(const Color(0xFF31353B)),
  );
}

OutlineInputBorder _fieldBorder(Color color, {double width = 1}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.sm),
      borderSide: BorderSide(color: color, width: width),
    );

TextStyle _inputTextStyle({double letterSpacing = 0}) => GoogleFonts.inter(
  color: LoginColors.text,
  fontSize: 13,
  letterSpacing: letterSpacing,
);

TextStyle _labelStyle({required Color color}) => GoogleFonts.montserrat(
  color: color,
  fontSize: 10,
  fontWeight: FontWeight.w800,
  letterSpacing: 0.9,
);
