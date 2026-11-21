import 'package:get/get.dart';
import './torneio_controller.dart';

class TorneioBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(TorneioController());
    }
}