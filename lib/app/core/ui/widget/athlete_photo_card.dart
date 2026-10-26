import 'package:flutter/material.dart';
import 'package:futzera_app/app/core/ui/app_colors.dart';

class AthletePhotoCard extends StatelessWidget {
  const AthletePhotoCard({
    super.key,
    this.onAdd, //required
    this.photo,
  });

  final VoidCallback? onAdd;
  final ImageProvider? photo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 150,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color:  AppColors.surfaceHigh,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white12),
              boxShadow:[BoxShadow(color: AppColors.primary, blurRadius: 7), BoxShadow(color: AppColors.inversePrimary, blurRadius: 7)],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8, 7, 8, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.account_circle_outlined, color:AppColors.primaryStrong, size: 14),
                        Text(
                          'FUT',
                          style: TextStyle(
                            color: AppColors.primaryStrong,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: photo == null
                          ? const Icon(
                              Icons.add_a_photo_outlined,
                              color:AppColors.primaryStrong,
                              size: 24,
                            )
                          : Image(image: photo!, fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 20,
                    alignment: Alignment.center,
                    color: AppColors.surface,
                    child: const Text(
                      'FOTO CARD',
                      style: TextStyle(
                        color: Color(0xFF75FF9E),
                        fontSize: 8,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: -8,
            bottom: 3,
            child: Material(
              color: const Color(0xFF00E676),
              shape: const CircleBorder(),
              child: InkWell(
                onTap: onAdd,
                customBorder: const CircleBorder(),
                child: const SizedBox(
                  width: 28,
                  height: 28,
                  child: Icon(Icons.add, color: Color(0xFF003918), size: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}