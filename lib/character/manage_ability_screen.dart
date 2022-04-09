import 'package:fates_for_quest/character/roll_outcomes_form.dart';
import 'package:fates_for_quest/data/ability.dart';
import 'package:fates_for_quest/data/character.dart';
import 'package:fates_for_quest/data/roll_outcome.dart';
import 'package:fates_for_quest/model/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ManagerAbilityScreen extends StatefulWidget {
  final Character character;
  final int? index;
  final Ability? ability;

  const ManagerAbilityScreen({
    Key? key,
    required this.character,
    this.index,
    this.ability,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ManagerAbilityScreenState();
  }
}

class _ManagerAbilityScreenState extends State<ManagerAbilityScreen> {
  late TextEditingController nameController;
  late TextEditingController apCostController;
  late TextEditingController descriptionController;

  var showRollOutcomes = false;

  Map<RollOutcome, String>? rollOutcomes;

  @override
  void initState() {
    nameController = TextEditingController()..text = widget.ability?.name ?? "";
    apCostController = TextEditingController()
      ..text = widget.ability?.cost?.toString() ?? "";
    descriptionController = TextEditingController()
      ..text = widget.ability?.description ?? "";
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
                    height: 8,
                  ),
                  TextField(
                    controller: nameController,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          localization.ap_cost,
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Flexible(
                        flex: 1,
                        child: TextField(
                          controller: apCostController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
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
                  const SizedBox(
                    height: 24,
                  ),
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
                final index = widget.index;
                final provider =
                    Provider.of<CharacterModel>(context, listen: false);
                final ability = Ability()
                  ..name = nameController.text
                  ..description = descriptionController.text
                  ..cost = int.tryParse(apCostController.text)
                  ..variableOutcome = rollOutcomes;

                if (index == null) {
                  provider.addAbilityToCharacter(
                    widget.character,
                    ability,
                  );
                } else {
                  provider.setAbilityAt(
                    widget.character,
                    index,
                    ability,
                  );
                }

                Navigator.of(context).pop();
              },
              child: Text(
                widget.index == null
                    ? localization.add_new_item
                    : localization.edit_ability,
              ),
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
