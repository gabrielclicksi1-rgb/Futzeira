import 'package:get/get.dart';
import './athlete_controller.dart';

class AthleteBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(AthleteController());
    }
}