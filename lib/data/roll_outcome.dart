import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';

part 'roll_outcome.g.dart';

@HiveType(typeId: 3)
enum RollOutcome {
  @HiveField(0)
  triumph,
  @HiveField(1)
  success,
  @HiveField(2)
  toughChoice,
  @HiveField(3)
  failure,
  @HiveField(4)
  catastrophe
}

extension Name on RollOutcome {
  String getName(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    switch (this) {
      case RollOutcome.triumph:
        return localizations.triumph;
      case RollOutcome.success:
        return localizations.success;
      case RollOutcome.toughChoice:
        return localizations.tough_choice;
      case RollOutcome.failure:
        return localizations.failure;
      case RollOutcome.catastrophe:
        return localizations.catastrophe;
    }
  }
}
