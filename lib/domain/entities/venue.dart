// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:futzera_app/app/core/utils/id_generator.dart';

class Venue {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final String? placeId;
  Venue({
    String? id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.placeId,
  }): id = id ?? IdGenerator.generate(){
    if(latitude< -90 || latitude > 90){
      throw ArgumentError('Latitude Inválida.');
    }

    if(longitude< -180 || longitude > 180){
      throw ArgumentError('Longitude inválida');
    }
    }
}
