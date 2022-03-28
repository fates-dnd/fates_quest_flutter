import 'package:fates_quest_flutter/data/role.dart';
import 'package:hive/hive.dart';

part 'character.g.dart';

@HiveType(typeId: 1)
class Character extends HiveObject {

  @HiveField(0)
  late String name;

  @HiveField(1)
  late String age;

  @HiveField(2)
  late String height;

  @HiveField(3)
  late Role role;

  @HiveField(4)
  late String wearStyle;

  @HiveField(5)
  late String moveStyle;

  @HiveField(6)
  late String home;

  @HiveField(7)
  late String community;

  @HiveField(8)
  late String dream;

  @HiveField(9, defaultValue: 10)
  late int hp;

  @HiveField(10, defaultValue: 10)
  late int ap;
}
