import 'package:fates_for_quest/data/ability.dart';
import 'package:fates_for_quest/data/item.dart';
import 'package:fates_for_quest/data/role.dart';
import 'package:hive/hive.dart';

part 'character.g.dart';

@HiveType(typeId: 1)
class Character extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String? name;

  @HiveField(2)
  late String? age;

  @HiveField(3)
  late String? height;

  @HiveField(4)
  late Role? role;

  @HiveField(5)
  late String? distinctiveFeatures;

  @HiveField(6)
  late String? wearStyle;

  @HiveField(7)
  late String? moveStyle;

  @HiveField(8)
  late String? home;

  @HiveField(9)
  late String? community;

  @HiveField(10)
  late String? dream;

  @HiveField(11, defaultValue: 10)
  late int hp;

  @HiveField(12, defaultValue: 10)
  late int maxHp;

  @HiveField(13, defaultValue: 10)
  late int ap;

  @HiveField(14, defaultValue: {})
  late Map<int, Item?> items;

  @HiveField(15, defaultValue: [])
  late List<Ability> abilities;
}
