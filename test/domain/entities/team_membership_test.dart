import 'package:flutter_test/flutter_test.dart';
import 'package:futzera_app/domain/entities/team_membership.dart';
import 'package:futzera_app/domain/enums/membership_status.dart';
import 'package:futzera_app/domain/enums/team_role.dart';

void main() {
  group('TeamMembership', () {
    test('deve gerar um UUID automaticamente', () {
      final membership = TeamMembership(
        clubMembershipId: 'club-membership-123',
        teamId: 'team-123',
        role: TeamRole.athlete,
        status: MembershipStatus.active,
        joinedAt: DateTime(2026, 11, 20),
      );

      expect(
        membership.id,
        matches(
          RegExp(
            r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
          ),
        ),
      );
    });

    test('deve preservar o UUID informado', () {
      const expectedId = '550e8400-e29b-41d4-a716-446655440000';

      final membership = TeamMembership(
        id: expectedId,
        clubMembershipId: 'club-membership-123',
        teamId: 'team-123',
        role: TeamRole.coach,
        status: MembershipStatus.active,
        joinedAt: DateTime(2026, 11, 20),
      );

      expect(membership.id, expectedId);
    });

    test('dois vínculos devem receber UUIDs diferentes', () {
      final membership1 = TeamMembership(
        clubMembershipId: 'club-membership-123',
        teamId: 'team-123',
        role: TeamRole.athlete,
        status: MembershipStatus.active,
        joinedAt: DateTime(2026, 11, 20),
      );

      final membership2 = TeamMembership(
        clubMembershipId: 'club-membership-123',
        teamId: 'team-456',
        role: TeamRole.athlete,
        status: MembershipStatus.active,
        joinedAt: DateTime(2026, 11, 20),
      );

      expect(membership1.id, isNot(membership2.id));
    });

    test('deve preservar os relacionamentos e o status', () {
      final membership = TeamMembership(
        clubMembershipId: 'club-membership-123',
        teamId: 'team-123',
        role: TeamRole.athlete,
        status: MembershipStatus.active,
        joinedAt: DateTime(2026, 11, 20),
      );

      expect(membership.clubMembershipId, 'club-membership-123');
      expect(membership.teamId, 'team-123');
      expect(membership.role, TeamRole.athlete);
      expect(membership.status, MembershipStatus.active);
    });
  });
}