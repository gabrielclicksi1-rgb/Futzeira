import 'package:futzera_app/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        initialRoute: '/match',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGeneratedRouter,
    
      ),
      bottomNavigationBar:Obx(() { 
              return BottomNavigationBar (
              onTap: (value) => controller.tabIndex = value,
              currentIndex: controller.tabIndex,
              items: [
                const BottomNavigationBarItem(icon: Icon(Icons.sports_soccer),label: 'Partidas'),
                const BottomNavigationBarItem(icon: Icon(Icons.badge_outlined), label: 'Atleta'),
                const BottomNavigationBarItem(icon: Icon(Icons.shield_outlined), label: 'Clube'),
                const BottomNavigationBarItem(icon: Icon(Icons.schema), label: 'Prancheta'),
                const BottomNavigationBarItem(icon: Icon(Icons.emoji_events_outlined), label: 'Torneios'),
              ],
            );
          }
        )
    );
  }
}

