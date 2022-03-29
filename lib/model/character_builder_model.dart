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

  void setAge(String age) {
    this.age = age;
  }

  void setHeight(String height) {
    this.height = height;
  }

  void setRole(Role role) {
    this.role = role;
  }

  void setDistinctiveFeatures(String distinctiveFeatures) {
    this.distinctiveFeatures = distinctiveFeatures;
  }

  void setWearStyle(String wearStyle) {
    this.wearStyle = wearStyle;
  }

  void setMoveStyle(String moveStyle) {
    this.moveStyle = moveStyle;
  }

  void setHome(String home) {
    this.home = home;
  }

  void setCommunity(String community) {
    this.community = community;
  }

  void setDream(String dream) {
    this.dream = dream;
  }
}
