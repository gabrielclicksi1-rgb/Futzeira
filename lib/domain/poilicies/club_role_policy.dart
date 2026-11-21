import 'package:futzera_app/domain/enums/club_role.dart';

class ClubRolePolicy {
  static bool isValid(Set<ClubRole> roles){
      if(roles.isEmpty){
        return false;
      }


      if(roles.length == 1){
        return true;
      }


      return roles.length == 2 && 
      roles.contains(ClubRole.coach) &&
      roles.contains(ClubRole.president);  
  }
}