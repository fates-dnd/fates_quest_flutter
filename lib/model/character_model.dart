import 'package:fates_quest_flutter/data/ability.dart';
import 'package:fates_quest_flutter/data/character.dart';
import 'package:fates_quest_flutter/data/item.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class CharacterModel extends ChangeNotifier {
  final Box<List> box;

  List<Character> characters = [];

  CharacterModel(this.box) {
    characters = box.get("characters")?.cast<Character>() ?? [];
  }

  void addCharacter(Character character) {
    characters.add(character);
    box.put("characters", characters);

    notifyListeners();
  }

  void setItemAt(Character character, int index, Item item) {
    character.items[index] = item;
    box.put("characters", characters);

    notifyListeners();
  }

  void addAbilityToCharacter(Character character, Ability ability) {
    character.abilities.add(ability);
    box.put("characters", characters);

    notifyListeners();
  }

  void setAbilityAt(Character character, int index, Ability ability) {
    character.abilities[index] = ability;
    box.put("characters", characters);

    notifyListeners();
  }

  void setHp(Character character, int hpValue) {
    character.hp = hpValue;
    box.put("characters", characters);

    notifyListeners();
  }

  void addAp(Character character, int apValue) {
    character.ap = character.ap += apValue;
    box.put("characters", characters);

    notifyListeners();
  }

  void removeAp(Character character, int apValue) {
    character.ap = character.ap -= apValue;
    if (character.ap < 0) {
      character.ap = 0;
    }
    box.put("characters", characters);

    notifyListeners();
  }

  Character getCharacterByName(String? name) {
    return characters.firstWhere((element) => element.name == name);
  }
}
