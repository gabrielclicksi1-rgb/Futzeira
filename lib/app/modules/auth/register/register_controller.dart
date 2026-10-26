// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'package:futzera_app/app/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // final AuthRepository _authRepository;
  final RxnString selectedPosition = RxnString();
  final dominantFoot = 'Destro'.obs;
  

  void selectPosition(String position) {
    selectedPosition.value = position;
  }

   void register(String position) {
  // Envie nome, apelido, foto e `position` para o cadastro.
}

void selectDominantFoot(String foot) {
  dominantFoot.value = foot;
}
  
  //RegisterController({
  //  required AuthRepository authRepository,
//}): _authRepository = authRepository;
  
}

