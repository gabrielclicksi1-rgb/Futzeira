// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:futzera_app/app/core/utils/id_generator.dart';

class Team {
  final String id;
  final String clubId;
  final String name;
  final String category;
  final bool isActive;
  final DateTime createdAt;
  Team({
    String? id,
    required this.clubId,
    required this.name,
    required this.category,
    required this.isActive,
    required this.createdAt,
  }) : id = id ?? IdGenerator.generate();
}
