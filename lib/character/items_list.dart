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
        Expanded(
          child: ListView.separated(
            itemCount: 12,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) =>
                ItemRow(item: character.items[index]),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class ItemRow extends StatelessWidget {
  final Item? item;

  const ItemRow({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text(item?.name ?? ""),
        ],
      ),
    );
  }
}
