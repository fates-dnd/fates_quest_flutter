import 'package:fates_quest_flutter/character/add_ability_screen.dart';
import 'package:fates_quest_flutter/data/ability.dart';
import 'package:fates_quest_flutter/data/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              builder: (context) => AddAbilityScreen(character: character))),
          child: Text(localization.add_new_ability),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
        ),
        Expanded(
          child: ListView(
            children: character.abilities
                .map((item) => AbilityRow(
                      ability: item,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class AbilityRow extends StatelessWidget {
  final Ability ability;

  const AbilityRow({Key? key, required this.ability}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(ability.name ?? ""),
        ],
      ),
    );
  }
}
