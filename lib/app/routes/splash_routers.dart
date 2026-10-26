import 'package:futzera_app/app/modules/splash/splash_page.dart';
import 'package:get/get.dart';

class SplashRouters {
  SplashRouters._();

  static final routes = <GetPage> [
    GetPage(name:'/', page: () =>  SplashPage()),
  ];
}