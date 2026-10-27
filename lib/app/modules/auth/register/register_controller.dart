// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'package:futzera_app/app/repositories/auth/auth_repository.dart';
import 'package:futzera_app/app/core/mixins/loader_mixin.dart';
import 'package:futzera_app/app/core/mixins/messages_mixin.dart';
import 'package:futzera_app/app/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;
  final RxnString selectedPosition = RxnString();
  final dominantFoot = 'Destro'.obs;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  void selectPosition(String position) {
    selectedPosition.value = position;
  }

  void register(String position) {
    // Envie nome, apelido, foto e `position` para o cadastro.
  }

  void selectDominantFoot(String foot) {
    dominantFoot.value = foot;
  }

  RegisterController({required AuthRepository authRepository})
    : _authRepository = authRepository;

  @override
  void onInit() {
    messageListener(message);
    loaderListener(loading);
    super.onInit();
    // TO
  }
}
