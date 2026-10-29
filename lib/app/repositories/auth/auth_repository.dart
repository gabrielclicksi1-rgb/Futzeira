import 'package:futzera_app/app/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(
    String name,
    String userName,
    String email,
    String password,
    String position,
    String option,
  );
}
