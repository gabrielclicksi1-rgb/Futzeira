import 'package:futzera_app/app/modules/auth/login/login.dart';
import 'package:futzera_app/app/modules/auth/register/register_page.dart';
import 'package:get/get.dart';

class AuthRouters {
  AuthRouters._();

  static final routes = <GetPage>[
    GetPage(name: '/auth/register', page: () => RegisterPage()),
    GetPage(name:'/auth/login' , page: () =>  LoginPage()),
    
  ];
}