import 'package:fates_quest_flutter/data/roll_outcome.dart';
import 'package:hive/hive.dart';

part 'ability.g.dart';

@HiveType(typeId: 5)
class Ability extends HiveObject {
  @HiveField(0)
  late String? name;
  @HiveField(1)
  late String? description;
  @HiveField(2)
  late int? cost;
  @HiveField(3)
  late Map<RollOutcome, String>? variableOutcome;
}
