import 'package:flutter_test/flutter_test.dart';
import 'package:futzera_app/domain/entities/user.dart';

void main() {
  group('User', () {
    test('deve gerar um UUID automaticamente', () {
      final user = User(
        name: 'Gabriel',
        userName: 'gabriel51',
        email: 'gabriel@email.com',
      );

      expect(
        user.id,
        matches(
          RegExp(
            r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
          ),
        ),
      );
    });

    test('deve preservar o UUID informado', () {
      const expectedId = '550e8400-e29b-41d4-a716-446655440000';

      final user = User(
        id: expectedId,
        name: 'Gabriel',
        userName: 'gabriel51',
        email: 'gabriel@email.com',
      );

      expect(user.id, expectedId);
    });

    test('dois usuários devem receber UUIDs diferentes', () {
      final user1 = User(
        name: 'Gabriel',
        userName: 'gabriel51',
        email: 'gabriel@email.com',
      );

      final user2 = User(
        name: 'João',
        userName: 'joao123',
        email: 'joao@email.com',
      );

      expect(user1.id, isNot(user2.id));
    });

    test('deve preservar os dados do usuário', () {
      final user = User(
        name: 'Gabriel',
        userName: 'gabriel51',
        email: 'gabriel@email.com',
      );

      expect(user.name, 'Gabriel');
      expect(user.userName, 'gabriel51');
      expect(user.email, 'gabriel@email.com');
    });
  });
}