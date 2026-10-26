import 'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:futzera_app/app/modules/auth/register/register_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
class PositionSelector extends StatelessWidget {
  const PositionSelector({
    super.key,
    required this.controller, 
  });

  final RegisterController controller;

  static const positions = [
    ('GOL', 'Goleiro'),
    ('ZAG', 'Zagueiro'),
    ('LAT', 'Lateral'),
    ('VOL', 'Volante'),
    ('MEI', 'Meia'),
    ('ATA', 'Atacante'),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*Row(
          children: [
            const Icon(Icons.sports_soccer, size: 14, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(
              'POSIÇÃO DE DESTAQUE',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),*/
        
        Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var i = 0; i < positions.length; i++) ...[
                  _PositionOption(
                    code: positions[i].$1,
                    name: positions[i].$2,
                    selected: controller.selectedPosition.value == positions[i].$1,
                    onTap: () => controller.selectPosition(positions[i].$1),
                  ),
                  if (i < positions.length - 1) const SizedBox(width: 6),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PositionOption extends StatelessWidget {
  const _PositionOption({
    required this.code,
    required this.name,
    required this.selected,
    required this.onTap,
  });

  final String code;
  final String name;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 59,
      height: 47,
      child: Material(
        color: selected ? AppColors.primaryContainer: AppColors.surfaceHigh,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                code,
                style: TextStyle(
                  color: selected ? AppColors.onPrimary : AppColors.foreground,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: selected ? AppColors.onPrimary : AppColors.foregroundMuted,
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}