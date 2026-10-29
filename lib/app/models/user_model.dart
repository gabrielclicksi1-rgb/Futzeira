import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final int? id;
  final String name;
  final String userName;
  final String email;
  final String position;
  final String password;
  final String option;
  UserModel({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.position,
    required this.password,
    required this.option,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'userName': userName,
      'email': email,
      'position': position,
      'password': password,
      'option': option,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: (map['id'] ?? 0) as int,
      name: (map['name'] ?? '') as String,
      userName: (map['UserName'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      position: (map['position'] ?? '') as String,
      password: (map['password'] ?? '') as String,
      option: (map['option'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
