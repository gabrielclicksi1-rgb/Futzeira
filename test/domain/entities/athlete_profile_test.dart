import 'package:flutter_test/flutter_test.dart';
import 'package:futzera_app/domain/entities/athlete_profile.dart';
import 'package:futzera_app/domain/enums/dominant_foot.dart';

void main() {
  group('AthleteProfile', () {
    test('deve criar um perfil de atleta corretamente', () {
      const profile = AthleteProfile(
        userId: 'user-123',
        position: 'Meia-atacante',
        dominantFoot: DominantFoot.right,
      );

      expect(profile.userId, 'user-123');
      expect(profile.position, 'Meia-atacante');
      expect(profile.dominantFoot, DominantFoot.right);
    });

    test('deve aceitar pé dominante esquerdo', () {
      const profile = AthleteProfile(
        userId: 'user-456',
        position: 'Atacante',
        dominantFoot: DominantFoot.left,
      );

      expect(profile.dominantFoot, DominantFoot.left);
    });

    test('deve aceitar ambidestria', () {
      const profile = AthleteProfile(
        userId: 'user-789',
        position: 'Volante',
        dominantFoot: DominantFoot.both,
      );

      expect(profile.dominantFoot, DominantFoot.both);
    });
  });
}