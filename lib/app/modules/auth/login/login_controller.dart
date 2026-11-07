import 'package:futzera_app/app/core/constants/constants.dart';
import 'package:futzera_app/app/core/exceptions/user_notfound_exception.dart';
import 'package:futzera_app/app/core/mixins/loader_mixin.dart';
import 'package:futzera_app/app/core/mixins/messages_mixin.dart';
import 'package:futzera_app/app/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:developer';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  LoginController({required AuthRepository authRepository})
    : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> login({required String email, required String password}) async {
    try {
      _loading.toggle();
      final userLogged = await _authRepository.login(email, password);
      final storage = GetStorage();
      storage.write(Constants.USER_KEY, userLogged.id);

      _loading.toggle();
    } on UserNotfoundException catch (e, s) {
      _loading.toggle();
      log('login ou senha inválidos', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'erro',
          message: 'Login ou senha inválidos',
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao realizar Login', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'erro',
          message: 'Erro ao realizar login',
          type: MessageType.error,
        ),
      );
    }
  }
}
