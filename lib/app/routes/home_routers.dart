import 'package:futzera_app/app/modules/auth/home/home_bindings.dart';
import 'package:futzera_app/app/modules/auth/home/home_page.dart';
import 'package:get/get.dart';

class HomeRouters {
  HomeRouters._();

  static final routers = <GetPage>[
    GetPage(name: '/home',binding: HomeBindings(), page: () => const HomePage()),
  ];
}