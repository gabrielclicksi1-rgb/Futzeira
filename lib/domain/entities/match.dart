import 'package:futzera_app/app/core/utils/id_generator.dart';
import 'package:futzera_app/domain/enums/match_status.dart';
import 'package:futzera_app/domain/enums/match_type.dart';

class Match{
  final String id;
  final MatchType type;
  final String? homeTeamId;
  final String? awayTeamId;
  final String createdby;
  final DateTime scheduledAt;
  final String location;
  final int? maxParticipants;
  final MatchStatus status;
  final DateTime createdAt;

  Match({
    String? id,
    required this.type,
     this.homeTeamId,
    this.awayTeamId,
    required this.createdby,
    required this.scheduledAt,
    required this.location,
    this.maxParticipants,
    required this.status,
    required this.createdAt,
  }): id = id ?? IdGenerator.generate();
}