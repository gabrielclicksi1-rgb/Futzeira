import 'package:get/get.dart';
import './club_controller.dart';

class ClubBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ClubController());
    }
}