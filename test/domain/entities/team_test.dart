import 'package:flutter_test/flutter_test.dart';
import 'package:futzera_app/domain/entities/team.dart';

void main() {
  group('Team', () {
    test('deve criar um time corretamente', () {
      final team = Team(
        id: '1',
        clubId: '10',
        name: 'Vila Souza Principal',
        category: 'Adulto',
        isActive: true,
        createdAt: DateTime(2026, 11, 20),
      );

      expect(team.id, '1');
      expect(team.clubId, '10');
      expect(team.name, 'Vila Souza Principal');
      expect(team.category, 'Adulto');
      expect(team.isActive, true);
    });

    test('deve gerar um UUID automaticamente', () {
      final team = Team(
        clubId: 'club-123',
        name: 'Vila Souza Principal',
        category: 'Adulto',
        isActive: true,
        createdAt: DateTime(2026, 11, 20),
      );

      expect(
        team.id,
        matches(
          RegExp(
            r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
          ),
        ),
      );
    });

    test('deve preservar o UUID informado', () {
      const expectedId = '550e8400-e29b-41d4-a716-446655440000';

      final team = Team(
        id: expectedId,
        clubId: 'club-123',
        name: 'Vila Souza Principal',
        category: 'Adulto',
        isActive: true,
        createdAt: DateTime(2026, 11, 20),
      );

      expect(team.id, expectedId);
    });

    test('dois times devem receber UUIDs diferentes', () {
      final team1 = Team(
        clubId: 'club-123',
        name: 'Vila Souza Principal',
        category: 'Adulto',
        isActive: true,
        createdAt: DateTime(2026, 11, 20),
      );

      final team2 = Team(
        clubId: 'club-123',
        name: 'Vila Souza Sub-20',
        category: 'Sub-20',
        isActive: true,
        createdAt: DateTime(2026, 11, 20),
      );

      expect(team1.id, isNot(team2.id));
    });
  });
}