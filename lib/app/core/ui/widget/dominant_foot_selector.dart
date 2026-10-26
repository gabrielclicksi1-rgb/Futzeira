// ignore: file_names
import 'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:futzera_app/app/modules/auth/register/register_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DominantFootSelector extends StatelessWidget {
  const DominantFootSelector({
    super.key,
    required this.controller,
  });

  final RegisterController controller;

  static const options = ['Destro', 'Canhoto', 'Ambidestro'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Obx(
          () => Container(
            height: 36,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: AppColors.surfaceHigh,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Row(
              children: [
                for (final foot in options)
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.selectDominantFoot(foot),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 160),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: controller.dominantFoot.value == foot
                              ?  AppColors.primaryContainer
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          foot,
                          style: TextStyle(
                            color: controller.dominantFoot.value == foot
                                ? AppColors.surfaceHigh
                                : AppColors.foregroundMuted,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}