import 'package:get/get.dart';
import './partidas_controller.dart';

class PartidasBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(PartidasController());
    }
}