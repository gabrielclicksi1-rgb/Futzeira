import 'dart:async';

import 'package:futzera_app/app/core/services/auth_services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController { 

final progress = 84.obs;
  Timer? _timer;

  String get status {
    if (progress.value >= 100) return 'PRONTO PARA O JOGO';
    if (progress.value >= 99) return 'ENTRANDO EM CAMPO...';
    if (progress.value >= 94) return 'PREPARANDO TÚNEL DE ACESSO...';
    if (progress.value >= 88) return 'CALIBRANDO ATRIBUTOS FUT...';
    return 'SINCRONIZANDO DADOS...';
  }

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(milliseconds: 240), (timer) {
      if (progress.value >= 100) {
        timer.cancel();
      } else {
        progress.value++;
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }


  void checkLogged (){
  Get.putAsync(() => AuthServices().init());
}
}