import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final String user;
  final String password;
  UserModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.user,
    required this.password,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'lastName': lastName,
      'email': email,
      'user': user,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: (map['id'] ?? 0) as int,
      name: (map['name'] ?? '') as String,
      lastName: (map['lastName'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      user: (map['user'] ?? '') as String,
      password: (map['password'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
