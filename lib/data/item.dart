import 'package:fates_for_quest/data/roll_outcome.dart';
import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 4)
class Item extends HiveObject {
  @HiveField(0)
  late String? name;
  @HiveField(1)
  late String? description;
  @HiveField(2)
  late Map<RollOutcome, String>? variableOutcome;
}
