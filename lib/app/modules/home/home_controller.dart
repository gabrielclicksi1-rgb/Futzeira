import 'package:flutter/widgets.dart';
import 'package:futzera_app/app/core/services/auth_services.dart';
import 'package:futzera_app/app/modules/home/home_page.dart';
import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

class HomeController extends GetxController {
   
  static const NAVIGATOR_KEY = 1;

  final _tabIndex = 0.obs;
  
  int get tabIndex => _tabIndex.value;

  static final _tabs = ['/match', '/club','/clipboard','/tournament'];

  set tabIndex(int index){
    _tabIndex(index);
    if(_tabs[index] == '/exit'){
      Get.find<AuthServices>().logout();
    }else{
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGeneratedRouter(RouteSettings settings){

    if(settings.name == '/menu'){
      return GetPageRoute(
        settings: settings,
       // page () => const MenuPage(),
       //binding:MenuBinding(),
       transition: Transition.fadeIn,
      );

    }
   }

}