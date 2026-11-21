import 'package:futzera_app/domain/enums/dominant_foot.dart';

class AthleteProfile {
  final String userId;
  final String position;
  final DominantFoot dominantFoot;
  

  const AthleteProfile({
    required this.userId,
    required this.position,
    required this.dominantFoot
  });
}