import 'package:fates_for_quest/character/add_item_screen.dart';
import 'package:fates_for_quest/data/character.dart';
import 'package:fates_for_quest/data/item.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final Character character;

  const ItemList({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: 12,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) => ItemRow(
              character: character,
              index: index,
              item: character.items[index],
            ),
          ),
        ),
      ],
    );
  }
}

class ItemRow extends StatelessWidget {
  final Character character;
  final int index;
  final Item? item;

  const ItemRow(
      {Key? key, required this.character, required this.index, this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddItemScreen(
                      character: character,
                      position: index,
                      item: item,
                    ))),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(item?.name ?? ""),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
              border: Border.all(color: Colors.black),
            ),
            padding: const EdgeInsets.all(5),
            child: Text(
              "${index + 1}",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
