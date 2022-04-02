import 'package:fates_quest_flutter/character/roll_outcomes_form.dart';
import 'package:fates_quest_flutter/data/character.dart';
import 'package:fates_quest_flutter/data/item.dart';
import 'package:fates_quest_flutter/data/roll_outcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddItemScreen extends StatefulWidget {
  final Character character;
  final Item? item;

  const AddItemScreen({Key? key, required this.character, this.item})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddItemScreenState();
  }
}

class _AddItemScreenState extends State<AddItemScreen> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;

  var showRollOutcomes = false;

  Map<RollOutcome, String>? rollOutcomes;

  @override
  void initState() {
    nameController = TextEditingController()..text = widget.item?.name ?? "";
    descriptionController = TextEditingController()
      ..text = widget.item?.description ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    localization.name,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextField(
                    controller: nameController,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    localization.description,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: descriptionController,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (showRollOutcomes)
                    RollOutcomesForm(
                      onRollOutcomesChange: (outcomes) {
                        rollOutcomes = outcomes;
                      },
                    )
                  else
                    OutlinedButton(
                      onPressed: () => setState(() {
                        showRollOutcomes = true;
                      }),
                      child: Text(localization.add_roll_outcomes),
                    )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Provider.of<CharacterModel>(context, listen: false)
                //     .addItemToCharacter(
                //   widget.character,
                //   Item()
                //     ..name = nameController.text
                //     ..description = descriptionController.text
                //     ..variableOutcome = rollOutcomes,
                // );

                Navigator.of(context).pop();
              },
              child: Text(localization.add_new_item),
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
