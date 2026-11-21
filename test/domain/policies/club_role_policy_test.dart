import 'package:flutter_test/flutter_test.dart';
import 'package:futzera_app/domain/enums/club_role.dart';
import 'package:futzera_app/domain/poilicies/club_role_policy.dart';

void main(){
  group('ClubRolePolicy', () {
    test('Não deve permitir nenhum papel', (){
      expect(ClubRolePolicy.isValid({}), isFalse,);
    });


  test('deve permitir atleta isolado', () {
    expect(ClubRolePolicy.isValid({ClubRole.athlete}), isTrue);
  });


  test('deve permitir treinador isolado', (){
    expect(ClubRolePolicy.isValid({ClubRole.coach}), isTrue);
  });

  test('deve permitir presindente isolado', (){
    expect(ClubRolePolicy.isValid({ClubRole.president}), isTrue);
  });

  test('deve permitir treinador e presidente',(){
    expect(ClubRolePolicy.isValid({ClubRole.coach,ClubRole.president}), isTrue);
  });

  test('Não deve permitir atleta e treinador ', (){
    expect(ClubRolePolicy.isValid({ClubRole.athlete,ClubRole.coach}), isFalse);
  });

  test('não deve permitir atleta e presidente',(){
    expect(ClubRolePolicy.isValid({ClubRole.athlete,ClubRole.president}), isFalse);
  });

  test('não deve permitir os três papéis juntos',(){
    expect(ClubRolePolicy.isValid({ClubRole.athlete,ClubRole.coach,ClubRole.president}), isFalse);
  });
  
  });
  }