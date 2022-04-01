import 'package:fates_quest_flutter/data/roll_outcome.dart';
import 'package:flutter/material.dart';

class RollOutcomesForm extends StatefulWidget {
  final Function(Map<RollOutcome, String>) onRollOutcomesChange;

  const RollOutcomesForm({Key? key, required this.onRollOutcomesChange}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RollOutcomesFormState();
  }
}

class _RollOutcomesFormState extends State<RollOutcomesForm> {
  final Map<RollOutcome, String> rollOutcomes = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: RollOutcome.values
          .map((outcome) => Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Text(
                        outcome.getName(context),
                        style: const TextStyle(fontSize: 16),
                      )),
                  const SizedBox(width: 16),
                  Flexible(
                      flex: 2,
                      child: TextField(
                        onChanged: (value) {
                          rollOutcomes[outcome] = value;
                          widget.onRollOutcomesChange(rollOutcomes);
                        },
                      )),
                ],
              ))
          .toList(),
    );
  }
}
