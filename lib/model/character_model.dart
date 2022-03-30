import 'package:fates_quest_flutter/data/character.dart';
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
}
