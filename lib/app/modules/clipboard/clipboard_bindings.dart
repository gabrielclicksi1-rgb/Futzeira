import 'package:get/get.dart';
import './clipboard_controller.dart';

class ClipboardBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ClipboardController());
    }
}