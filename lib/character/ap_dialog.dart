import 'package:fates_quest_flutter/model/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ApDialog extends StatefulWidget {
  final String characterId;

  const ApDialog({Key? key, required this.characterId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ApDialogState();
}

class ApDialogState extends State<ApDialog> {
  late int totalAp;

  @override
  void initState() {
    totalAp = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Material(
      child: Consumer<CharacterModel>(
        builder: (context, model, child) {
          final character = model.characters
              .firstWhere((element) => element.id == widget.characterId);
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
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
                Text(
                  totalAp.toString(),
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => setState(() {
                    totalAp += 1;
                  }),
                  style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                  child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.radio_button_checked)),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CharacterModel>(context, listen: false)
                        .addAp(character, totalAp);
                    Navigator.of(context).pop();
                  },
                  child: Text(localization.earn_ap),
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<CharacterModel>(context, listen: false)
                        .removeAp(character, totalAp);
                    Navigator.of(context).pop();
                  },
                  child: Text(localization.spend_ap),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
