import 'package:fates_quest_flutter/data/character.dart';
import 'package:fates_quest_flutter/data/role.dart';
import 'package:flutter/foundation.dart';

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

  Character buildCharacter() {
    final character = Character()
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
      ..hp = 10
      ..ap = 10
      ..items = []
      ..abilities = [];
    return character;
  }
}
