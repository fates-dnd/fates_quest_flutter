import 'dart:math';

import 'package:fates_quest_flutter/character/abilities_list.dart';
import 'package:fates_quest_flutter/character/items_list.dart';
import 'package:fates_quest_flutter/character/roll_overlay.dart';
import 'package:fates_quest_flutter/data/character.dart';
import 'package:fates_quest_flutter/model/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  OverlayEntry? rollOverlay;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<CharacterModel>(
          builder: (context, model, child) {
            final character = model.getCharacterByName(widget.character.name);
            return Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.name ?? "",
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32),
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
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            rollOverlay?.remove();

            rollOverlay = OverlayEntry(builder: (context) {
              final rollResult = 1 + Random().nextInt(20);
              return Positioned(
                  height: 60,
                  bottom: 72,
                  left: 32,
                  child: Material(
                    child: RollOverlay(roll: rollResult),
                  ));
            });
            Overlay.of(context)?.insert(rollOverlay!);
          },
          child: SvgPicture.asset(
            "assets/d20.svg",
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
