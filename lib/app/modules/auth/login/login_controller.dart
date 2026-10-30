import 'package:futzera_app/app/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository;

  LoginController({required AuthRepository authRepository})
    : _authRepository = authRepository;
}
