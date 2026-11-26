import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:futzera_app/app/core/ui/fut_state.dart';
import 'package:futzera_app/app/core/ui/widget/brand_name.dart';
import 'package:futzera_app/app/core/ui/widget/home_header.dart';
import 'package:futzera_app/app/modules/athlete/athlete_controller.dart';
import 'package:material_ui/material_ui.dart';
import 'package:futzera_app/app/core/services/auth_services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

/// HomePage inicial do Futzeira.
///
/// Esta versão é autocontida para facilitar o primeiro teste.
/// Depois, você pode separar cada widget em arquivos próprios
/// (components/, widgets/ e pages/).
class AthletePage extends StatefulWidget {
  const AthletePage({super.key});

  @override
  State<AthletePage> createState() => _AthletePageState();
}

class _AthletePageState extends FutState<AthletePage, AthleteController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FutzeiraColors.background,
      body:SafeArea(
          bottom: false,
          child: Column(
            children: [
              HomeHeader(
                topName: 'Atleta',
                playerName: 'User Name',
                level: 14,
                rating: 84,
                onProfileTap: () {
                  // TODO: navegar para a página de perfil.
                },
              ),
              Expanded(
                child: _AthleteHomeContent(),
              ),
            ],
          ),
        ),
      );
  }
}


class FutzeiraColors {
  static const background = Color(0xFF101419);
  static const surface = Color(0xFF1C2025);
  static const surfaceLow = Color(0xFF181C21);
  static const surfaceHigh = Color(0xFF262A30);
  static const surfaceHighest = Color(0xFF31353B);
  static const primary = Color(0xFF00E676);
  static const primaryLight = Color(0xFF75FF9E);
  static const gold = Color(0xFFFFE082);
  static const goldDark = Color(0xFFEEC200);
  static const text = Color(0xFFE0E2EA);
  static const muted = Color(0xFFBACBB9);
  static const outline = Color(0xFF859585);
  static const cyan = Color(0xFF87F5FF);
}





class _AthleteHomeContent extends StatelessWidget {
  const _AthleteHomeContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _SeasonStatus(),
          SizedBox(height: 16),
          _AthletePlayerCard(),
          SizedBox(height: 10),
          _ShareCardButton(),
          SizedBox(height: 18),
          _RadarSection(),
          SizedBox(height: 18),
          _SeasonStatsSection(),
          SizedBox(height: 18),
          _EquipmentSection(),
        ],
      ),
    );
  }
}

class _SeasonStatus extends StatelessWidget {
  const _SeasonStatus();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
      decoration: BoxDecoration(
        color: FutzeiraColors.surfaceHigh,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Container(
            width: 31,
            height: 31,
            decoration: BoxDecoration(
              color: FutzeiraColors.primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.workspace_premium,
              color: FutzeiraColors.primary,
              size: 19,
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CARD DE ATLETA',
                  style: TextStyle(
                    color: FutzeiraColors.primaryLight,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.3,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Temporada 2026 • Futebol amador',
                  style: TextStyle(color: FutzeiraColors.muted, fontSize: 11),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
            decoration: BoxDecoration(
              color: FutzeiraColors.background,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: FutzeiraColors.gold.withValues(alpha: 0.25),
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.circle, color: FutzeiraColors.primary, size: 7),
                SizedBox(width: 5),
                Text(
                  'ATIVO',
                  style: TextStyle(
                    color: FutzeiraColors.gold,
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AthletePlayerCard extends StatelessWidget {
  const _AthletePlayerCard();

  static const attributes = [
    _AttributeData('PAC', 87),
    _AttributeData('DRI', 86),
    _AttributeData('SHO', 82),
    _AttributeData('DEF', 68),
    _AttributeData('PAS', 89),
    _AttributeData('PHY', 78),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 390),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            FutzeiraColors.gold,
            FutzeiraColors.primary,
            Color(0xFF18231C),
            FutzeiraColors.goldDark,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.55),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xFF0D1511),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF18231C), Color(0xFF0A0E12)],
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  children: [
                    Text(
                      '84',
                      style: TextStyle(
                        color: FutzeiraColors.gold,
                        fontSize: 43,
                        height: 1,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -2,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'MEI',
                      style: TextStyle(
                        color: FutzeiraColors.text,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: 28,
                      child: Divider(
                        color: FutzeiraColors.gold,
                        thickness: 2,
                        height: 2,
                      ),
                    ),
                    SizedBox(height: 9),
                    Text('🇧🇷', style: TextStyle(fontSize: 19)),
                    SizedBox(height: 7),
                    Icon(Icons.shield, color: FutzeiraColors.primary, size: 25),
                  ],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 188,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: FutzeiraColors.primary.withValues(
                              alpha: 0.07,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: FutzeiraColors.primary.withValues(
                                  alpha: 0.12,
                                ),
                                blurRadius: 38,
                                spreadRadius: 12,
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.person,
                          size: 145,
                          color: Color(0xFF9CB5A2),
                        ),
                        const Positioned(
                          bottom: 2,
                          child: Text(
                            'FOTO DO ATLETA',
                            style: TextStyle(
                              color: FutzeiraColors.muted,
                              fontSize: 8,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    FutzeiraColors.gold.withValues(alpha: 0.13),
                    Colors.transparent,
                  ],
                ),
              ),
              child: const Column(
                children: [
                  Text(
                    'GABRIEL MATTOS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: FutzeiraColors.gold,
                      fontSize: 21,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.4,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'FUTZEIRA FC  •  #10 ARMADOR',
                    style: TextStyle(
                      color: FutzeiraColors.primaryLight,
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: FutzeiraColors.surfaceHigh.withValues(alpha: 0.75),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _AttributeBar(data: attributes[0])),
                      SizedBox(width: 14),
                      Expanded(child: _AttributeBar(data: attributes[1])),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(child: _AttributeBar(data: attributes[2])),
                      SizedBox(width: 14),
                      Expanded(child: _AttributeBar(data: attributes[3])),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: _AttributeBar(
                          data: attributes[4],
                          highlighted: true,
                        ),
                      ),
                      SizedBox(width: 14),
                      Expanded(child: _AttributeBar(data: attributes[5])),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.verified, color: FutzeiraColors.gold, size: 13),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    'CARD DO ATLETA • FUTZEIRA',
                    style: TextStyle(
                      color: FutzeiraColors.gold,
                      fontSize: 8,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                Text(
                  'BR-2026-001',
                  style: TextStyle(
                    color: FutzeiraColors.muted,
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AttributeData {
  const _AttributeData(this.label, this.value);

  final String label;
  final int value;
}

class _AttributeBar extends StatelessWidget {
  const _AttributeBar({required this.data, this.highlighted = false});

  final _AttributeData data;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final color = highlighted
        ? FutzeiraColors.primary
        : (data.label == 'SHO' ? FutzeiraColors.goldDark : FutzeiraColors.text);

    return Row(
      children: [
        SizedBox(
          width: 29,
          child: Text(
            data.label,
            style: TextStyle(
              color: highlighted
                  ? FutzeiraColors.primary
                  : FutzeiraColors.muted,
              fontSize: 9,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(
          width: 23,
          child: Text(
            '${data.value}',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: highlighted ? FutzeiraColors.primary : FutzeiraColors.text,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: data.value / 100,
              minHeight: 5,
              backgroundColor: FutzeiraColors.background,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ),
      ],
    );
  }
}

class _ShareCardButton extends StatelessWidget {
  const _ShareCardButton();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Compartilhamento será implementado depois.'),
          ),
        );
      },
      icon: const Icon(Icons.share, color: FutzeiraColors.primary),
      label: const Text(
        'COMPARTILHAR CARD',
        style: TextStyle(
          color: FutzeiraColors.text,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: FutzeiraColors.surfaceHigh,
        side: BorderSide(color: Colors.white.withValues(alpha: 0.04)),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.child,
  }) : padding = const EdgeInsets.all(14);

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: FutzeiraColors.surface,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.16),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _RadarSection extends StatelessWidget {
  const _RadarSection();

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeading(
            eyebrow: 'BIOMETRIA TÁTICA',
            title: 'Polígono de atributos',
            eyebrowColor: FutzeiraColors.primary,
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LegendDot(color: FutzeiraColors.primary, label: 'Atleta (84)'),
              SizedBox(width: 16),
              _LegendDot(color: FutzeiraColors.outline, label: 'Média (74)'),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 260,
            width: double.infinity,
            child: CustomPaint(
              painter: _RadarChartPainter(
                values: const [87, 86, 82, 68, 78, 89],
                comparisonValues: const [74, 74, 74, 74, 74, 74],
              ),
              child: const SizedBox.expand(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: FutzeiraColors.surfaceHigh,
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Row(
              children: [
                Icon(Icons.insights, color: FutzeiraColors.primary, size: 21),
                SizedBox(width: 9),
                Expanded(
                  child: Text(
                    'Seus atributos ajudam a construir uma visão mais completa do seu estilo de jogo.',
                    style: TextStyle(
                      color: FutzeiraColors.text,
                      fontSize: 11,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RadarChartPainter extends CustomPainter {
  const _RadarChartPainter({
    required this.values,
    required this.comparisonValues,
  });

  final List<double> values;
  final List<double> comparisonValues;

  @override
  void paint(Canvas canvas, Size size) {
    const count = 6;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.height * 0.34;

    Offset pointFor(int index, double value) {
      final angle = (-math.pi / 2) + (2 * math.pi * index / count);
      final distance = radius * (value / 100);
      return Offset(
        center.dx + math.cos(angle) * distance,
        center.dy + math.sin(angle) * distance,
      );
    }

    final gridPaint = Paint()
      ..color = const Color(0xFF39414A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (var level = 1; level <= 4; level++) {
      final path = Path();
      for (var i = 0; i < count; i++) {
        final p = pointFor(i, level * 25.0);
        if (i == 0) {
          path.moveTo(p.dx, p.dy);
        } else {
          path.lineTo(p.dx, p.dy);
        }
      }
      path.close();
      canvas.drawPath(path, gridPaint);
    }

    for (var i = 0; i < count; i++) {
      final p = pointFor(i, 100);
      canvas.drawLine(center, p, gridPaint);
    }

    void drawValues(List<double> data, Color color, double fillOpacity) {
      final path = Path();
      final points = <Offset>[];
      for (var i = 0; i < count; i++) {
        final p = pointFor(i, data[i]);
        points.add(p);
        if (i == 0) {
          path.moveTo(p.dx, p.dy);
        } else {
          path.lineTo(p.dx, p.dy);
        }
      }
      path.close();

      canvas.drawPath(
        path,
        Paint()
          ..color = color.withValues(alpha: fillOpacity)
          ..style = PaintingStyle.fill,
      );
      canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );

      for (final p in points) {
        canvas.drawCircle(p, 3.5, Paint()..color = color);
      }
    }

    drawValues(comparisonValues, FutzeiraColors.outline, 0.12);
    drawValues(values, FutzeiraColors.primary, 0.20);

    const labels = ['PAC', 'DRI', 'SHO', 'DEF', 'PHY', 'PAS'];
    final labelStyle = const TextStyle(
      color: FutzeiraColors.text,
      fontSize: 10,
      fontWeight: FontWeight.w800,
    );

    for (var i = 0; i < count; i++) {
      final p = pointFor(i, 116);
      final text = TextPainter(
        text: TextSpan(text: labels[i], style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      canvas.drawParagraph(
        _paragraphFor(
          '${labels[i]} (${values[i].round()})',
          const TextStyle(
            color: FutzeiraColors.text,
            fontSize: 9,
            fontWeight: FontWeight.w800,
          ),
          textDirection: TextDirection.ltr,
          maxWidth: 75,
        ),
        Offset(
          (p.dx - text.width / 2)
              .clamp(0.0, size.width - text.width)
              .toDouble(),
          (p.dy - text.height / 2)
              .clamp(0.0, size.height - text.height)
              .toDouble(),
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _RadarChartPainter oldDelegate) {
    return oldDelegate.values != values ||
        oldDelegate.comparisonValues != comparisonValues;
  }
}

ui.Paragraph _paragraphFor(
  String text,
  TextStyle style, {
  required TextDirection textDirection,
  required double maxWidth,
}) {
  final builder =
      ui.ParagraphBuilder(ui.ParagraphStyle(textDirection: textDirection))
        ..pushStyle(
          ui.TextStyle(
            color: style.color,
            fontSize: style.fontSize,
            fontWeight: style.fontWeight,
          ),
        )
        ..addText(text);

  return builder.build()..layout(ui.ParagraphConstraints(width: maxWidth));
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            color: FutzeiraColors.muted,
            fontSize: 9,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _SeasonStatsSection extends StatelessWidget {
  const _SeasonStatsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Estatísticas da temporada',
              style: TextStyle(
                color: FutzeiraColors.text,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              '2026',
              style: TextStyle(
                color: FutzeiraColors.gold,
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            Expanded(
              child: _StatTile(value: '24', label: 'JOGOS'),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _StatTile(
                value: '18',
                label: 'GOLS',
                valueColor: FutzeiraColors.primary,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _StatTile(
                value: '14',
                label: 'ASSIST.',
                valueColor: FutzeiraColors.cyan,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            Expanded(
              child: _SmallMetric(
                icon: Icons.star,
                value: '6x',
                label: 'Craque da partida',
                iconColor: FutzeiraColors.gold,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _SmallMetric(
                icon: Icons.thumb_up,
                value: '8.7',
                label: 'Nota da comunidade',
                iconColor: FutzeiraColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.value,
    required this.label,
    this.valueColor = FutzeiraColors.text,
  });

  final String value;
  final String label;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 5),
      decoration: BoxDecoration(
        color: FutzeiraColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 26,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              color: FutzeiraColors.muted,
              fontSize: 9,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallMetric extends StatelessWidget {
  const _SmallMetric({
    required this.icon,
    required this.value,
    required this.label,
    required this.iconColor,
  });

  final IconData icon;
  final String value;
  final String label;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: FutzeiraColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: FutzeiraColors.text,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: FutzeiraColors.muted,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EquipmentSection extends StatelessWidget {
  const _EquipmentSection();

  static const items = [
    _EquipmentData(
      icon: Icons.checkroom,
      title: 'Manto titular',
      subtitle: 'Uniforme equipado',
      tag: 'EQUIPADO',
      tagColor: FutzeiraColors.primary,
    ),
    _EquipmentData(
      icon: Icons.sports_soccer,
      title: 'Chuteira',
      subtitle: 'Equipamento',
      tag: '+2 RIT',
      tagColor: FutzeiraColors.primary,
    ),
    _EquipmentData(
      icon: Icons.military_tech,
      title: 'Braçadeira',
      subtitle: 'Capitão',
      tag: 'LÍDER',
      tagColor: FutzeiraColors.gold,
    ),
    _EquipmentData(
      icon: Icons.celebration,
      title: 'Comemoração',
      subtitle: 'Estilo pessoal',
      tag: 'RARO',
      tagColor: FutzeiraColors.cyan,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: _SectionHeading(
                  eyebrow: 'ARSENAL DO ATLETA',
                  title: 'Equipamento & estilo',
                  eyebrowColor: FutzeiraColors.gold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.find<AuthServices>().logout();
                  Get.toNamed('/auth/login');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Personalização em desenvolvimento.'),
                    ),
                  );
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: FutzeiraColors.primary,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 142,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (_, _) => const SizedBox(width: 9),
              itemBuilder: (context, index) =>
                  _EquipmentTile(data: items[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _EquipmentData {
  const _EquipmentData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.tagColor,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String tag;
  final Color tagColor;
}

class _EquipmentTile extends StatelessWidget {
  const _EquipmentTile({required this.data});

  final _EquipmentData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 126,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: FutzeiraColors.surfaceHigh,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FutzeiraColors.background,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Icon(data.icon, color: data.tagColor, size: 38),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: FutzeiraColors.background,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      data.tag,
                      style: TextStyle(
                        color: data.tagColor,
                        fontSize: 7,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 7),
          Text(
            data.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: FutzeiraColors.text,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            data.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: FutzeiraColors.muted, fontSize: 9),
          ),
        ],
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({
    required this.eyebrow,
    required this.title,
    required this.eyebrowColor,
  });

  final String eyebrow;
  final String title;
  final Color eyebrowColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: TextStyle(
            color: eyebrowColor,
            fontSize: 9,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.3,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            color: FutzeiraColors.text,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _FutzeiraBottomNavigation extends StatelessWidget {
  const _FutzeiraBottomNavigation({
    required this.tabs,
    required this.selectedIndex,
    required this.onSelected,
  });

  final String tabs;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0A0E14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.45),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 66,
          child: Row(
            children: List.generate(tabs.length, (index) {
              final selected = index == selectedIndex;
              final tab = tabs[index];

              return Expanded(
                child: InkWell(
                  onTap: () => onSelected(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                      color: selected
                          ? FutzeiraColors.primary.withValues(alpha: 0.06)
                          : Colors.transparent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.abc,
                          size: 22,
                          color: selected
                              ? FutzeiraColors.primary
                              : FutzeiraColors.muted,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: selected
                                ? FutzeiraColors.primary
                                : FutzeiraColors.muted,
                            fontSize: 8,
                            fontWeight: selected
                                ? FontWeight.w900
                                : FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class TabItem {
  const TabItem({required this.label, required this.icon});

  final String label;
  final IconData icon;
}

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$title em desenvolvimento',
        style: const TextStyle(
          color: FutzeiraColors.muted,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
