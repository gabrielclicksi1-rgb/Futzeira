// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:futzera_app/app/core/utils/id_generator.dart';

class Club {
  final String id;
  final String name;
  final String? description;
  final String createdBy;
  final DateTime createdAt;
  Club({
    String? id,
    required this.name,
    required this.createdBy,
    required this.createdAt,
    this.description,
  }) : id = id ?? IdGenerator.generate();
  
  

  
}
