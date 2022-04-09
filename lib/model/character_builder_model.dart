import 'package:fates_quest_flutter/data/ability.dart';
import 'package:fates_quest_flutter/data/character.dart';
import 'package:fates_quest_flutter/data/item.dart';
import 'package:fates_quest_flutter/data/role.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class CharacterBuilderModel extends ChangeNotifier {
  String? name;
  String? age;
  String? height;
  Role? role;
  String? distinctiveFeatures;
  String? wearStyle;
  String? moveStyle;
  String? home;
  String? community;
  String? dream;

  int hp = 10;
  int maxHp = 10;
  int ap = 10;
  Map<int, Item?> items = {};
  List<Ability> abilities = [];

  void setCharacter(Character character) {
    name = character.name;
    age = character.age;
    height = character.height;
    role = character.role;
    distinctiveFeatures = character.distinctiveFeatures;
    wearStyle = character.wearStyle;
    moveStyle = character.moveStyle;
    home = character.home;
    community = character.community;
    dream = character.dream;

    hp = character.hp;
    maxHp = character.maxHp;
    ap = character.ap;
    items = character.items;
    abilities = character.abilities;
  }

  void clearInfo() {
    name = null;
    age = null;
    height = null;
    role = null;
    distinctiveFeatures = null;
    wearStyle = null;
    moveStyle = null;
    home = null;
    community = null;
    dream = null;
  }

  void setName(String name) {
    this.name = name;

    notifyListeners();
  }

  void setAgeAndHeight(String age, String height) {
    this.age = age;
    this.height = height;

    notifyListeners();
  }

  void setRole(Role role) {
    this.role = role;

    notifyListeners();
  }

  void setDistinctiveFeatures(String distinctiveFeatures) {
    this.distinctiveFeatures = distinctiveFeatures;

    notifyListeners();
  }

  void setStyle(String wearStyle, String moveStyle) {
    this.wearStyle = wearStyle;
    this.moveStyle = moveStyle;

    notifyListeners();
  }

  void setHomeAndCommunity(String home, String community) {
    this.home = home;
    this.community = community;

    notifyListeners();
  }

  void setDream(String dream) {
    this.dream = dream;

    notifyListeners();
  }

  Character buildCharacter({String? id}) {
    final character = Character()
      ..id = id ?? const Uuid().v1()
      ..name = name
      ..age = age
      ..height = height
      ..role = role
      ..distinctiveFeatures = distinctiveFeatures
      ..wearStyle = wearStyle
      ..moveStyle = moveStyle
      ..home = home
      ..community = community
      ..dream = dream
      ..hp = hp
      ..maxHp = maxHp
      ..ap = ap
      ..items = items
      ..abilities = abilities;
    return character;
  }
}
