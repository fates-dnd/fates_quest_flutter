import 'dart:math';

import 'package:fates_quest_flutter/character/roll_overlay.dart';
import 'package:fates_quest_flutter/data/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Text(
                  widget.character.name ?? "",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )),
        ],
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
    );
  }
}
