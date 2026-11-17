import 'package:futzera_app/app/modules/splash/splash_bindings.dart';
import 'package:futzera_app/app/modules/splash/splash_page.dart';
import 'package:get/get.dart';

class SplashRouters {
  SplashRouters._();

  static final routes = <GetPage> [
    GetPage(name:'/', binding: SplashBindings(), page: () =>  SplashPage()),
  ];
}