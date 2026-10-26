import 'dart:async';
import 'dart:math' as math;
import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:futzera_app/app/core/ui/widget/primary_button.dart';
import 'package:futzera_app/app/modules/splash/futzeira_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FutzeiraApp extends StatelessWidget {
  const FutzeiraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FUTZEIRA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: FutzeiraColors.background,
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}


class SplashController extends GetxController {
  final progress = 84.obs;
  Timer? _timer;

  String get status {
    if (progress.value >= 100) return 'PRONTO PARA O JOGO';
    if (progress.value >= 99) return 'ENTRANDO EM CAMPO...';
    if (progress.value >= 94) return 'PREPARANDO TÚNEL DE ACESSO...';
    if (progress.value >= 88) return 'CALIBRANDO ATRIBUTOS FUT...';
    return 'SINCRONIZANDO DADOS...';
  }

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(milliseconds: 240), (timer) {
      if (progress.value >= 100) {
        timer.cancel();
      } else {
        progress.value++;
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              const _Atmosphere(),
              const CustomPaint(painter: PitchPainter()),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                  child: Column(
                    children: [
                      const _VersionBadge(),
                      const Spacer(),
                      const HeroBrand(),
                      Bandol(),
                      const Spacer(),
                      Vlads(),
                      const Spacer(),
                     PrimaryButton(widgetfinaly: ElevatedButton(  onPressed: () {
                        Get.toNamed('/auth/login');
                      }, child: Text('Teste'))  ),
                      const Spacer(),
                      _LoadingHud(controller: controller),
                      const SizedBox(height: 14),
                      const _CommunitySeal(),
                    ],
                  ),
                ),
              ),
              const IgnorePointer(child: CustomPaint(painter: SparksPainter())),
            ],
          );
        },
      ),
    );
  }
}

class _Atmosphere extends StatelessWidget {
  const _Atmosphere();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: FutzeiraColors.background,
        gradient: RadialGradient(
          center: Alignment(0, -0.8),
          radius: 1.1,
          colors: [Color(0xFF11251C), FutzeiraColors.background],
          stops: [0, 1],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment(-1.2, -0.2),
            child: _Glow(color: Color(0x1A51D7FF), size: 220),
          ),
          Align(
            alignment: Alignment(1.2, 0.05),
            child: _Glow(color: Color(0x1AFFE16D), size: 250),
          ),
        ],
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({required this.color, required this.size});
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: color, blurRadius: 90, spreadRadius: 32)],
        ),
      );
}

class PitchPainter extends CustomPainter {
  const PitchPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / 400;
    final scaleY = size.height / 800;
    canvas.save();
    canvas.scale(scaleX, scaleY);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0x5575FF9E), Color(0x2275FF9E), Color(0x0075FF9E)],
      ).createShader(const Rect.fromLTWH(0, 0, 400, 800));
    canvas.drawLine(const Offset(20, 400), const Offset(380, 400), paint);
    canvas.drawCircle(const Offset(200, 400), 72, paint);
    canvas.drawCircle(
      const Offset(200, 400),
      4,
      Paint()..color = const Color(0x8875FF9E),
    );
    final topBox = Path()
      ..moveTo(90, 200)
      ..lineTo(310, 200)
      ..lineTo(330, 20)
      ..lineTo(70, 20)
      ..close();
    final bottomBox = Path()
      ..moveTo(90, 600)
      ..lineTo(310, 600)
      ..lineTo(330, 780)
      ..lineTo(70, 780)
      ..close();
    canvas.drawPath(topBox, paint);
    canvas.drawPath(bottomBox, paint);
    final point = Paint()..color = const Color(0x9975FF9E);
    for (final p in const [
      Offset(100, 300),
      Offset(300, 300),
      Offset(100, 500),
      Offset(300, 500),
    ]) {
      canvas.drawCircle(p, 1.7, point);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant PitchPainter oldDelegate) => false;
}

class SparksPainter extends CustomPainter {
  const SparksPainter();

  @override
  void paint(Canvas canvas, Size size) {
    // Pontos sutis e determinísticos para manter o efeito leve e sem dependências.
    for (var i = 0; i < 30; i++) {
      final x = ((i * 73 + 19) % 397) / 397 * size.width;
      final y = ((i * 137 + 41) % 797) / 797 * size.height;
      final radius = 0.7 + (i % 4) * 0.35;
      final color = i % 3 == 0 ? FutzeiraColors.gold : FutzeiraColors.green;
      canvas.drawCircle(
        Offset(x, y),
        radius,
        Paint()..color = color.withValues(alpha: i % 2 == 0 ? 0.48 : 0.25),
      );
    }
  }

  @override
  bool shouldRepaint(covariant SparksPainter oldDelegate) => false;
}

class _VersionBadge extends StatelessWidget {
  const _VersionBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: FutzeiraColors.surfaceHigh.withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PulseDot(),
          SizedBox(width: 8),
          Text('V 0.0', style: _TacticalStyle(color: FutzeiraColors.green)),
          SizedBox(width: 8),
          Text('•', style: TextStyle(color: Color(0xFF58675A))),
          SizedBox(width: 8),
          Text('POWERED BY TACTICAL', style: _TacticalStyle()),
        ],
      ),
    );
  }
}

class HeroBrand extends StatelessWidget {
  const HeroBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 200,
          height: 210,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: FutzeiraColors.greenDeep.withValues(alpha: 0.22),
                      blurRadius: 54,
                      spreadRadius: 10,
                    ),
                    BoxShadow(
                      color: FutzeiraColors.gold.withValues(alpha: 0.10),
                      blurRadius: 35,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              const CustomPaint(
                size: Size(160, 180),
                painter: ShieldPainter(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
           // Text('FUT', style: _BrandStyle(color: FutzeiraColors.foreground, italic: false)),
            SizedBox(width: 5),
           // Text('ZEIRA', style: _BrandStyle(color: FutzeiraColors.green, italic: true)),
          ],
        ),
       
      ],
    );
  }
}

class Bandol extends StatelessWidget {
  const Bandol({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: const Text(
          'SUA CARREIRA • SEU CLUBE • SEU JOGO',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: FutzeiraColors.muted,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.1,
          ),
        ),    
    );
      
  }
}

  class Vlads extends StatelessWidget {
  const Vlads({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [
            _FeatureChip(icon: Icons.sports_soccer, label: 'FUT CARDS'),
            _FeatureChip(icon: Icons.military_tech, label: 'RANKING NACIONAL', color: FutzeiraColors.gold),
            _FeatureChip(icon: Icons.query_stats, label: 'RADAR 360°', color: FutzeiraColors.blue),
          ],
        );
  }
}

class ShieldPainter extends CustomPainter {
  const ShieldPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 160, size.height / 180);
    final shield = Path()
      ..moveTo(80, 4)
      ..lineTo(148, 28)
      ..lineTo(136, 122)
      ..lineTo(80, 174)
      ..lineTo(24, 122)
      ..lineTo(12, 28)
      ..close();
    final plate = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF242B33), Color(0xFF151C24), Color(0xFF080F16)],
      ).createShader(const Rect.fromLTWH(0, 0, 160, 180));
    canvas.drawPath(shield, plate);
    final goldStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [FutzeiraColors.gold, Color(0xFFE9C400), Color(0xFF725F00)],
      ).createShader(const Rect.fromLTWH(0, 0, 160, 100));
    canvas.drawPath(shield, goldStroke);

    final neonStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.4
      ..strokeCap = StrokeCap.round
      ..color = FutzeiraColors.greenDeep
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 2.5);
    final leftEdge = Path()
      ..moveTo(80, 14)
      ..lineTo(22, 34)
      ..lineTo(34, 114)
      ..lineTo(80, 158);
    final rightEdge = Path()
      ..moveTo(80, 14)
      ..lineTo(138, 34)
      ..lineTo(126, 114)
      ..lineTo(80, 158);
    canvas.drawPath(leftEdge, neonStroke);
    canvas.drawPath(rightEdge, neonStroke);

    canvas.drawCircle(const Offset(80, 88), 34,
        Paint()..color = const Color(0xFF0D141C));
    canvas.drawCircle(
      const Offset(80, 88),
      34,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5
        ..color = FutzeiraColors.greenDeep,
    );
    final pentagon = Path()
      ..moveTo(80, 74)
      ..lineTo(93, 84)
      ..lineTo(88, 100)
      ..lineTo(72, 100)
      ..lineTo(67, 84)
      ..close();
    canvas.drawPath(pentagon, Paint()..color = FutzeiraColors.green);
    final seams = Paint()
      ..color = FutzeiraColors.foreground.withValues(alpha: 0.78)
      ..strokeWidth = 1.8;
    for (final pair in const [
      [Offset(80, 74), Offset(80, 56)],
      [Offset(93, 84), Offset(108, 76)],
      [Offset(88, 100), Offset(100, 116)],
      [Offset(72, 100), Offset(60, 116)],
      [Offset(67, 84), Offset(52, 76)],
    ]) {
      canvas.drawLine(pair[0], pair[1], seams);
    }
    final ring = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = FutzeiraColors.gold
      ..strokeCap = StrokeCap.round;
    for (var i = 0; i < 24; i += 2) {
      final a = -math.pi / 2 + i * math.pi / 12;
      final b = a + math.pi / 12;
      canvas.drawLine(
        Offset(80 + 26 * math.cos(a), 88 + 26 * math.sin(a)),
        Offset(80 + 26 * math.cos(b), 88 + 26 * math.sin(b)),
        ring,
      );
    }
    final star = Path()
      ..moveTo(80, 18)
      ..lineTo(83, 26)
      ..lineTo(91, 26)
      ..lineTo(84, 31)
      ..lineTo(87, 39)
      ..lineTo(80, 34)
      ..lineTo(73, 39)
      ..lineTo(76, 31)
      ..lineTo(69, 26)
      ..lineTo(77, 26)
      ..close();
    canvas.drawPath(star, Paint()..color = FutzeiraColors.gold);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant ShieldPainter oldDelegate) => false;
}

class _FeatureChip extends StatelessWidget {
  const _FeatureChip({
    required this.icon,
    required this.label,
    this.color = FutzeiraColors.green,
  });
  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
        decoration: BoxDecoration(
          color: FutzeiraColors.surfaceHigh.withValues(alpha: 0.72),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 5),
            Text(label, style: const _TacticalStyle(fontSize: 9)),
          ],
        ),
      );
}

class _LoadingHud extends StatelessWidget {
  const _LoadingHud({required this.controller});
  final SplashController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final value = controller.progress.value;
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: FutzeiraColors.surface.withValues(alpha: 0.88),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withValues(alpha: 0.04)),
          boxShadow: const [
            BoxShadow(color: Colors.black45, blurRadius: 24, offset: Offset(0, 12)),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                const _PulseDot(),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    controller.status,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const _TacticalStyle(fontSize: 10),
                  ),
                ),
                const SizedBox(width: 8),
                Text('$value%',
                    style: const TextStyle(
                      color: FutzeiraColors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    )),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: LinearProgressIndicator(
                value: value / 100,
                minHeight: 8,
                backgroundColor: const Color(0xFF2E353E),
                valueColor: const AlwaysStoppedAnimation(AppColors.primary), 
              ),
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Telemetry(icon: Icons.sensors, label: 'Server:', value: 'SA-EAST-1 (SP)'),
                _Telemetry(icon: Icons.bolt, label: 'Latência:', value: '14ms', color: FutzeiraColors.gold),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class _Telemetry extends StatelessWidget {
  const _Telemetry({
    required this.icon,
    required this.label,
    required this.value,
    this.color = FutzeiraColors.green,
  });
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) => Flexible(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 13, color: color),
            const SizedBox(width: 4),
            Text('$label ', style: const TextStyle(color: FutzeiraColors.muted, fontSize: 10)),
            Flexible(
              child: Text(value,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: FutzeiraColors.foreground,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ],
        ),
      );
}

class _CommunitySeal extends StatelessWidget {
  const _CommunitySeal();

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.verified, size: 16, color: FutzeiraColors.muted.withValues(alpha: 0.72)),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              'COMUNIDADE OFICIAL DO FUTEBOL AMADOR & SOCIETY',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: FutzeiraColors.muted.withValues(alpha: 0.72),
                fontSize: 9,
                letterSpacing: 0.4,
              ),
            ),
          ),
        ],
      );
}

class _PulseDot extends StatelessWidget {
  const _PulseDot();

  @override
  Widget build(BuildContext context) => Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: FutzeiraColors.green,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: FutzeiraColors.green, blurRadius: 8)],
        ),
      );
}

class _TacticalStyle extends TextStyle {
  const _TacticalStyle({Color color = FutzeiraColors.muted, double fontSize = 9})
      : super(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.0,
        );
}

/*class _BrandStyle extends TextStyle {
  const _BrandStyle({required Color color, bool italic = false})
      : super(
          color: color,
          fontSize: 31,
          fontWeight: FontWeight.w900,
          letterSpacing: -1.2,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
         // shadows: [Shadow(color: Colors.black54, blurRadius: 10, offset: Offset(0, 3))],
        );
}*/
