import 'package:futzera_app/app/core/ui/app_colors.dart';
import 'package:futzera_app/app/core/ui/widget/home_header.dart';
import 'package:futzera_app/app/modules/club/club_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class TournamentPage extends GetView<ClubController> {
  
  const TournamentPage({super.key});

    
    

    @override
    Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: AppColors.background,
      body:SafeArea(
          bottom: false,
          child: Column(
            children: [
              HomeHeader(
                topName: 'Torneios',
                playerName: 'User Name',
                level: 14,
                rating: 84,
                onProfileTap: () {
                  // TODO: navegar para a página de perfil.
                },
              ),
            ],
          ),
        ),
      );
    } 
}
