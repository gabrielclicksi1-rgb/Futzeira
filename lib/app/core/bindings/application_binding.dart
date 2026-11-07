import 'package:futzera_app/app/core/rest_client/rest_client.dart';
import 'package:get/get.dart';

import '../rest_client/rest_client.dart';

class ApplicationBinding implements Bindings{
  @override
 void dependencies(){
  Get.lazyPut(() => RestClient(),fenix: true,);
 }
} 