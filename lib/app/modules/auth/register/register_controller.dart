// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'package:futzera_app/app/repositories/auth/auth_repository.dart';
import 'dart:developer';

import 'package:futzera_app/app/core/mixins/loader_mixin.dart';
import 'package:futzera_app/app/core/mixins/messages_mixin.dart';
import 'package:futzera_app/app/core/rest_client/rest_client.dart';
import 'package:futzera_app/app/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;
  final RxnString selectedPosition = RxnString();
  final dominantFoot = 'Destro'.obs;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  void selectPosition(String position) {
    selectedPosition.value = position;
  }

  Future<void> register({
    required String name,
    required String userName,
    required String email,
    required String password,
    required String position,
    String option = 'destro',
  }) async {
    _loading.toggle();

    final UserModel = await _authRepository.register(
      name,
      userName,
      email,
      password,
      position,
      option,
    ); // Envie nome, apelido, foto e `position` para o cadastro.
    try {
      _loading.toggle();
      _message(
        MessageModel(
          title: 'Sucesso',
          message: "Cadastro realizado com sucesso",
          type: MessageType.info,
        ),
      );
    } on RestClientException catch (e, s) {
      _loading.toggle();
      Get.back();
      // TODO: Voltar quando fizer o Login
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao registrar login', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao registrar usuário',
          type: MessageType.error,
        ),
      );
    }
  }

  void selectDominantFoot(String foot) {
    dominantFoot.value = foot;
  }

  RegisterController({required AuthRepository authRepository})
    : _authRepository = authRepository;

  @override
  void onInit() {
    messageListener(_message);
    loaderListener(_loading);
    super.onInit();
    // TO
  }
}
