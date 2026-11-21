// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:futzera_app/app/core/utils/id_generator.dart';
import 'package:futzera_app/domain/enums/club_role.dart';
import 'package:futzera_app/domain/enums/membership_status.dart';

class ClubMembership {
  final String id;
  final String userId;
  final String clubId;
  final Set<ClubRole> roles;
  final MembershipStatus status;
  final DateTime joinedAt;
  ClubMembership({
    String? id,
    required this.userId,
    required this.clubId,
    required this.roles,
    required this.status,
    required this.joinedAt,
  }): id = id ?? IdGenerator.generate();

}
