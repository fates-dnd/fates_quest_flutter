import 'package:fates_for_quest/character/character_screen.dart';
import 'package:fates_for_quest/character_manager/character_manager_screen.dart';
import 'package:fates_for_quest/data/character.dart';
import 'package:fates_for_quest/data/role.dart';
import 'package:fates_for_quest/model/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Consumer<CharacterModel>(
              builder: (context, model, child) => ListView(
                children: [
                  Text(
                    localization.characters,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ...model.characters
                      .map((character) => CharacterRow(character: character)),
                ],
              ),
            )),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CharacterManagerScreen(),
                ));
              },
              child: Text(localization.create_new_character),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class CharacterRow extends StatelessWidget {
  final Character character;

  const CharacterRow({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CharacterScreen(
                character: character,
              ))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name ?? "",
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    character.role?.getName(context) ?? "",
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
