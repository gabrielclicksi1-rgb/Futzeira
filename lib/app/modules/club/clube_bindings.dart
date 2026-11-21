import 'package:get/get.dart';
import './clube_controller.dart';

class ClubeBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ClubeController());
    }
}