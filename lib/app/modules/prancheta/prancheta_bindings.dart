import 'package:get/get.dart';
import './prancheta_controller.dart';

class PranchetaBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(PranchetaController());
    }
}