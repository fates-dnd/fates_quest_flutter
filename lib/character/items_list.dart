import 'package:fates_quest_flutter/character/add_item_screen.dart';
import 'package:fates_quest_flutter/data/character.dart';
import 'package:fates_quest_flutter/data/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ItemList extends StatelessWidget {
  final Character character;

  const ItemList({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Column(
      children: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddItemScreen(
                    character: character,
                  ))),
          child: Text(localization.add_new_item),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
        ),
        Expanded(
          child: ListView(
              children:
                  character.items.map((item) => ItemRow(item: item)).toList()),
        )
      ],
    );
  }
}

class ItemRow extends StatelessWidget {
  final Item item;

  const ItemRow({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(item.name ?? ""),
        ],
      ),
    );
  }
}
