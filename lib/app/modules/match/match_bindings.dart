import 'package:get/get.dart';
import './match_controller.dart';

class MatchBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(MatchController());
    }
}