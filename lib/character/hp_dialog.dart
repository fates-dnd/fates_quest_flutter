import 'package:fates_quest_flutter/data/character.dart';
import 'package:fates_quest_flutter/model/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HpDialog extends StatelessWidget {
  final String characterId;

  const HpDialog({Key? key, required this.characterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Material(
      child: Consumer<CharacterModel>(
        builder: (context, model, child) {
          final character = model.characters
              .firstWhere((element) => element.id == characterId);
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        localization.hp,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: List.generate(
                    5,
                    (index) => HpButton(
                          character: character,
                          isActive: character.hp > index,
                          hpValue: index + 1,
                        )),
              ),
              Row(
                children: List.generate(
                    5,
                    (index) => HpButton(
                          character: character,
                          isActive: character.hp > 5 + index,
                          hpValue: index + 6,
                        )),
              ),
            ],
          );
        },
      ),
    );
  }
}

class HpButton extends StatelessWidget {
  final Character character;
  final bool isActive;
  final int hpValue;

  const HpButton({
    Key? key,
    required this.character,
    required this.isActive,
    required this.hpValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<CharacterModel>(context, listen: false)
            .setHp(character, hpValue);
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: HpIcon(isActive: isActive),
      ),
    );
  }
}

class HpIcon extends StatelessWidget {
  final bool isActive;

  const HpIcon({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return const Icon(
        Icons.favorite,
        color: Colors.red,
      );
    } else {
      return const Icon(
        Icons.favorite,
        color: Colors.grey,
      );
    }
  }
}
