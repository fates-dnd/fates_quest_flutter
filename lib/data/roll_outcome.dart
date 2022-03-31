import 'package:hive/hive.dart';

part 'roll_outcome.g.dart';

@HiveType(typeId: 3)
enum RollOutcome {
  @HiveField(0)
  triumph,
  @HiveField(1)
  success,
  @HiveField(2)
  toughChoice,
  @HiveField(3)
  failure,
  @HiveField(4)
  catastrophe
}
