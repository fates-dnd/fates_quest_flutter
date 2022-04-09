import 'package:fates_for_quest/character/abilities_list.dart';
import 'package:fates_for_quest/character/ap_dialog.dart';
import 'package:fates_for_quest/character/hp_dialog.dart';
import 'package:fates_for_quest/character/items_list.dart';
import 'package:fates_for_quest/character/roll_result_row.dart';
import 'package:fates_for_quest/character_manager/character_manager_screen.dart';
import 'package:fates_for_quest/data/character.dart';
import 'package:fates_for_quest/model/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CharacterScreen extends StatefulWidget {
  final Character character;

  const CharacterScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  State createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<CharacterModel>(
          builder: (context, model, child) {
            final character = model.getCharacterById(widget.character.id);
            return Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              character.name ?? "",
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CharacterManagerScreen(
                                            character: character))),
                            icon: const Icon(Icons.edit),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          HpPin(character: widget.character),
                          const SizedBox(width: 8),
                          ApPin(character: widget.character),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TabBar(
                        labelColor: Colors.black,
                        labelStyle: const TextStyle(fontSize: 18),
                        tabs: [
                          Tab(
                            text: localization.items,
                          ),
                          Tab(
                            text: localization.abilities,
                          )
                        ],
                      ),
                      const SizedBox(height: 32),
                      Expanded(
                        child: TabBarView(
                          children: [
                            ItemList(
                              character: character,
                            ),
                            AbilitiesList(
                              character: character,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
                const SizedBox(height: 8),
                const RollResultRow(),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}

class HpPin extends StatelessWidget {
  final Character character;

  const HpPin({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
              insetPadding: const EdgeInsets.all(0),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HpDialog(characterId: character.id),
                ],
              ))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            const SizedBox(width: 8),
            Text("${character.hp}/${character.maxHp}"),
          ],
        ),
      ),
    );
  }
}

class ApPin extends StatelessWidget {
  final Character character;

  const ApPin({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
              insetPadding: const EdgeInsets.all(0),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ApDialog(characterId: character.id),
                ],
              ))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Icon(
              Icons.radio_button_checked,
              color: Colors.blue,
            ),
            const SizedBox(width: 8),
            Text("${character.ap}"),
          ],
        ),
      ),
    );
  }
}
