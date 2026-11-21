import 'package:flutter_test/flutter_test.dart';
import 'package:futzera_app/domain/entities/club_membership.dart';
import 'package:futzera_app/domain/enums/club_role.dart';
import 'package:futzera_app/domain/enums/membership_status.dart';
void main(){
  group('ClubMemberShip', (){
    test('deve gerar um UUID automáticamente', (){
      final membership = ClubMembership( 
        userId: 'user-123',
        clubId: 'club-123',
        roles: {ClubRole.athlete},
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

      final membership = ClubMembership(
        id: expectedId,
        userId: 'user-123',
        clubId: 'club-123',
        roles: {ClubRole.coach},
        status: MembershipStatus.active,
        joinedAt: DateTime(2026, 11, 20),
      );

      expect(membership.id, expectedId);
    });



    test('dois vínculos devem receber UUIDs diferentes', () {
      final membership1 = ClubMembership(
        userId: 'user-123',
        clubId: 'club-123',
        roles: {ClubRole.athlete},
        status: MembershipStatus.active,
        joinedAt: DateTime(2026, 11, 20),
      );

      final membership2 = ClubMembership(
        userId: 'user-456',
        clubId: 'club-123',
        roles: {ClubRole.coach},
        status: MembershipStatus.pending,
        joinedAt: DateTime(2026, 11, 20),
      );

      expect(membership1.id, isNot(membership2.id));
    });



      test('deve preservar os papéis e o status do vínculo', () {
      final membership = ClubMembership(
        userId: 'user-123',
        clubId: 'club-123',
        roles: {
          ClubRole.coach,
          ClubRole.president,
        },
        status: MembershipStatus.active,
        joinedAt: DateTime(2026, 11, 20),
      );

      expect(membership.roles, {
        ClubRole.coach,
        ClubRole.president,
      });

      expect(membership.status, MembershipStatus.active);
    });

  });
}