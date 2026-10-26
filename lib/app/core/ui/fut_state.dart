import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class FutState<S extends StatefulWidget, C extends GetxController>
    extends State<S> {
  C get controller => Get.find();
}
