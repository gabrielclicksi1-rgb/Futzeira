import 'package:get/get.dart';
import './tournament_controller.dart';

class TournamentBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(TournamentController());
    }
}