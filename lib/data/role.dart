import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'role.g.dart';

@HiveType(typeId: 2)
enum Role {
  @HiveField(0)
  fighter,
  @HiveField(1)
  invoker,
  @HiveField(2)
  ranger,
  @HiveField(3)
  naturalist,
  @HiveField(4)
  doctor,
  @HiveField(5)
  spy,
  @HiveField(6)
  magician,
  @HiveField(7)
  wizard,
}

extension Name on Role {
  String getName(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    switch (this) {
      case Role.fighter:
        return localizations.fighter_role;
      case Role.invoker:
        return localizations.invoker_role;
      case Role.ranger:
        return localizations.ranger_role;
      case Role.naturalist:
        return localizations.naturalist_role;
      case Role.doctor:
        return localizations.doctor_role;
      case Role.spy:
        return localizations.spy_role;
      case Role.magician:
        return localizations.magician_role;
      case Role.wizard:
        return localizations.wizard_role;
    }
  }
}
