import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RollOverlay extends StatelessWidget {
  final int roll;

  const RollOverlay({Key? key, required this.roll}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: Center(
              child: Text(
            roll.toString(),
            style: const TextStyle(fontSize: 18, color: Colors.white),
          )),
        ),
        const SizedBox(width: 8),
        Text(
          _getResultName(context),
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  String _getResultName(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    if (roll == 20) {
      return localization.triumph;
    } else if (11 <= roll && roll <= 19) {
      return localization.success;
    } else if (6 <= roll && roll <= 10) {
      return localization.tough_choice;
    } else if (2 <= roll && roll <= 5) {
      return localization.failure;
    } else if (roll == 1) {
      return localization.catastrophe;
    }

    throw ArgumentError("Roll is $roll");
  }
}
