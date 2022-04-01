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

  void addItemToCharacter(Character character, Item item) {
    character.items.add(item);
    box.put("characters", characters);

    notifyListeners();
  }

  void addAbilityToCharacter(Character character, Ability ability) {
    character.abilities.add(ability);
    box.put("characters", characters);

    notifyListeners();
  }

  Character getCharacterByName(String? name) {
    return characters.firstWhere((element) => element.name == name);
  }
}
