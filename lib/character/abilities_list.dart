import 'package:fates_quest_flutter/character/manage_ability_screen.dart';
import 'package:fates_quest_flutter/data/ability.dart';
import 'package:fates_quest_flutter/data/character.dart';
import 'package:fates_quest_flutter/model/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AbilitiesList extends StatelessWidget {
  final Character character;

  const AbilitiesList({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Column(
      children: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ManagerAbilityScreen(character: character))),
          child: Text(localization.add_new_ability),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            itemCount: character.abilities.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) => AbilityItem(
              character: character,
              index: index,
              ability: character.abilities[index],
            ),
          ),
        ),
      ],
    );
  }
}

class AbilityItem extends StatelessWidget {
  final Character character;
  final int index;
  final Ability ability;

  const AbilityItem(
      {Key? key,
      required this.character,
      required this.index,
      required this.ability})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ManagerAbilityScreen(
                character: character,
                index: index,
                ability: ability,
              ))),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ApCost(apCost: ability.cost),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    ability.name ?? "",
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Provider.of<CharacterModel>(context, listen: false)
                          .removeAbilityFromCharacter(
                        character,
                        ability,
                      );
                    },
                    icon: const Icon(Icons.delete)),
              ],
            ),
            const SizedBox(height: 24),
            Text(ability.description ?? "",
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class ApCost extends StatelessWidget {
  final int? apCost;

  const ApCost({Key? key, required this.apCost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.grey),
      child: Text(
        apCost.toString(),
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }
}
