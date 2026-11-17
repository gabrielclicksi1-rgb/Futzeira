import 'package:futzera_app/app/core/services/auth_services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void checkLogged(){
    Get.putAsync(() => AuthServices().init());
  }
}