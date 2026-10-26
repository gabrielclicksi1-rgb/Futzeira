
import 'package:futzera_app/app/core/exceptions/user_notfound_exception.dart';
import 'package:futzera_app/app/core/rest_client/rest_client.dart';
import 'package:futzera_app/app/models/user_model.dart';
import 'package:futzera_app/app/repositories/auth/auth_repository.dart';
import 'dart:developer';
class AuthRepositoryImpl implements AuthRepository{
  final RestClient _restClient;

  AuthRepositoryImpl({
    required RestClient restClient
  }): _restClient = restClient;

  @override

   Future<UserModel> register(String name,String lastName, String email, String password) async {
    final result = await _restClient.post('/auth/register', {
      'name': name,
      'lastname': lastName,
      'email': email,
      'password': password,
    });

  if(result.hasError){
    var message = 'Erro ao registrar usuário';
    if(result.statusCode == 400) {
      message = result.body['error'];
    }
    log(message, error: result.statusText, stackTrace: StackTrace.current);

    throw RestClientException(message);
  }
  return login(email, password);
}

  @override
  Future<UserModel> login(String email, String password) async {
   final result = await _restClient.post('/auth/', {
    'email': email,
    'password': password,
   });

    if(result.hasError){
      if(result.statusCode == 403){
        log('Usuário ou senha inválidos',error: result.statusText,
        stackTrace: StackTrace.current
        );
        throw UserNotfoundException();
      }
      log('erro ao autenticar o usuário (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,

      );
      throw RestClientException('Erro ao autenticar usuário');
    }

    return UserModel.fromMap(result.body);
  }}
