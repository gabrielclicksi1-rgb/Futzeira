import 'package:flutter_test/flutter_test.dart';
import 'package:futzera_app/domain/entities/club.dart';

void main(){
  group('Club', (){
    test('deve gerar um UUID automáticamente', () {
      final club = Club(name: 'Vila Souza FC', createdBy:'user-123', createdAt: DateTime(2026, 11, 20),
      );
      expect(club.id, isNotEmpty);
      expect(club.id,    matches(
          RegExp(
            r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
          ),
        ),
      );
    });

    test('deve preservar o UUID informado', (){
      const expectedId = '550e8400-e29b-41d4-a716-446655440000';

      final club = Club( id: expectedId,   name: 'Vila Souza FC', createdBy: 'user-123', createdAt: DateTime(2026, 11, 20),
      );
      expect(club.id, expectedId);
    });

    test('dois clubes devem receber UUIDs diferentes', (){
      final club1 = Club(
        name: 'Vila Souza FC',
        createdBy: 'user-123',
         createdAt: DateTime(2026, 11, 20),
      );

         final club2 = Club(
        name: 'Estrela FC',
        createdBy: 'user-456',
        createdAt: DateTime(2026, 11, 20),
      );

       expect(club1.id, isNot(club2.id));
    });
    
  });
}