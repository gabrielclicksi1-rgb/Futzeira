import 'package:futzera_app/app/core/utils/id_generator.dart';

class User {
  final String id;
  final String name;
  final String userName;
  final String email;

  User({
    String? id,
    required this.name,
    required this.userName,
    required this.email,
  }) : id = id ?? IdGenerator.generate();
}