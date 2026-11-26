import 'package:flutter/widgets.dart';
import 'package:futzera_app/app/core/services/auth_services.dart';
import 'package:futzera_app/app/modules/athlete/athlete_page.dart';
import 'package:futzera_app/app/modules/clipboard/clipboard_page.dart';
import 'package:futzera_app/app/modules/club/club_page.dart';
import 'package:futzera_app/app/modules/match/match_bindings.dart';
import 'package:futzera_app/app/modules/match/match_page.dart';
import 'package:futzera_app/app/modules/tournament/tournament_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
   
  static const NAVIGATOR_KEY = 1;

  final _tabIndex = 0.obs;
  
  int get tabIndex => _tabIndex.value;

  static final _tabs = ['/match','/athlete', '/club','/clipboard','/tournament'];

  set tabIndex(int index){
    _tabIndex(index);
    // if(_tabs[index] == '/exit'){
    //   Get.find<AuthServices>().logout();
    // }else{
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    //}
  }

  Route? onGeneratedRouter(RouteSettings settings){

    if(settings.name == '/match'){
      return GetPageRoute(
        settings: settings,
        page: () => const MatchPage(),
       binding:MatchBindings(),
       transition: Transition.fadeIn,
      );
    }

    if(settings.name == '/athlete'){
      return GetPageRoute(
        settings: settings,
        page: () => const AthletePage(),
       binding:MatchBindings(),
       transition: Transition.fadeIn,
      );
    }

    if(settings.name == '/club'){
      return GetPageRoute(
        settings: settings,
        page: () => const ClubPage(),
       binding:MatchBindings(),
       transition: Transition.fadeIn,
      );
    }

    if(settings.name == '/clipboard'){
      return GetPageRoute(
        settings: settings,
        page: () => const ClipboardPage(),
       binding:MatchBindings(),
       transition: Transition.fadeIn,
      );
    }


      if(settings.name == '/tournament'){
      return GetPageRoute(
        settings: settings,
        page: () => const TournamentPage(),
       binding:MatchBindings(),
       transition: Transition.fadeIn,
      );
    }
   }

}