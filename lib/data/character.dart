import 'package:fates_quest_flutter/data/ability.dart';
import 'package:fates_quest_flutter/data/item.dart';
import 'package:fates_quest_flutter/data/role.dart';
import 'package:hive/hive.dart';

part 'character.g.dart';

@HiveType(typeId: 1)
class Character extends HiveObject {
  @HiveField(0)
  late String? name;

  @HiveField(1)
  late String? age;

  @HiveField(2)
  late String? height;

  @HiveField(3)
  late Role? role;

  @HiveField(4)
  late String? distinctiveFeatures;

  @HiveField(5)
  late String? wearStyle;

  @HiveField(6)
  late String? moveStyle;

  @HiveField(7)
  late String? home;

  @HiveField(8)
  late String? community;

  @HiveField(9)
  late String? dream;

  @HiveField(10, defaultValue: 10)
  late int hp;

  @HiveField(11, defaultValue: 10)
  late int ap;

  @HiveField(12, defaultValue: {})
  late Map<int, Item?> items;

  @HiveField(13, defaultValue: [])
  late List<Ability> abilities;
}
