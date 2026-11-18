import 'package:futzera_app/app/modules/home/home_bindings.dart';
import 'package:futzera_app/app/modules/home/home_page.dart';
import 'package:get/get.dart';

class HomeRouter {
  HomeRouter._();

  static final routers = <GetPage>[
    GetPage(name: '/home', binding: HomeBindings(), page: () => HomePage()),
  ];
}
