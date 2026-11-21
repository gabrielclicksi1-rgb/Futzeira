// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:futzera_app/app/core/utils/id_generator.dart';
import 'package:futzera_app/domain/enums/membership_status.dart';
import 'package:futzera_app/domain/enums/team_role.dart';

class TeamMembership {
  final String id;
  final String clubMembershipId;
  final String teamId;
  final TeamRole role;
  final MembershipStatus status;
  final DateTime joinedAt;
  TeamMembership({
    String? id,
    required this.clubMembershipId,
    required this.teamId,
    required this.role,
    required this.status,
    required this.joinedAt,
  }) : id = id ?? IdGenerator.generate();
}
