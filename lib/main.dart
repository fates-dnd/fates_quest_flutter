import 'package:fates_quest_flutter/data/ability.dart';
import 'package:fates_quest_flutter/data/item.dart';
import 'package:fates_quest_flutter/data/role.dart';
import 'package:fates_quest_flutter/data/roll_outcome.dart';
import 'package:fates_quest_flutter/model/character_builder_model.dart';
import 'package:fates_quest_flutter/model/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'character_list/character_list.dart';
import 'data/character.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RoleAdapter());
  Hive.registerAdapter(CharacterAdapter());
  Hive.registerAdapter(AbilityAdapter());
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(RollOutcomeAdapter());

  final charactersBox = await Hive.openBox<List>("characters");

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (BuildContext context) => CharacterBuilderModel()),
      ChangeNotifierProvider(
          create: (BuildContext context) => CharacterModel(charactersBox)),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return const CharacterList();
  }
}
