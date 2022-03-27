import 'package:fates_quest_flutter/character/character_screen.dart';
import 'package:fates_quest_flutter/character_creator/age_and_height_form_screen.dart';
import 'package:fates_quest_flutter/character_creator/distinctive_features_form_screen.dart';
import 'package:fates_quest_flutter/character_creator/dream_form_screen.dart';
import 'package:fates_quest_flutter/character_creator/home_and_community_form_screen.dart';
import 'package:fates_quest_flutter/character_creator/name_form_screen.dart';
import 'package:fates_quest_flutter/character_creator/role_form_screen.dart';
import 'package:fates_quest_flutter/character_creator/wear_and_move_style_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CharacterCreatorScreen extends StatelessWidget {
  const CharacterCreatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        children: [
          Text(
            localization.hello,
            style: const TextStyle(
              fontSize: 32,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          ConstructorRow(
            template: localization.my_name_is__template,
            onClick: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NameFormScreen())),
          ),
          ConstructorRow(
            template: localization.i_am_old_and_tall__template,
            onClick: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AgeAndHeightFormScreen())),
          ),
          ConstructorRow(
            template: localization.i_am_the_parties__template,
            onClick: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RoleFormScreen())),
          ),
          ConstructorRow(
            template: localization.when_people_see_me_they_notice__template,
            onClick: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const DistinctiveFeaturesFormScreen())),
          ),
          ConstructorRow(
            template: localization.i_wear_and_move_with__template,
            onClick: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WearAndMoveStyleFormScreen())),
          ),
          ConstructorRow(
            template:
                localization.i_am_from_where_people_are_known_for__template,
            onClick: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeAndCommunityFormScreen())),
          ),
          ConstructorRow(
            template: localization.i_dream_of__template,
            onClick: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DreamFormScreen())),
          ),

          ElevatedButton(
            onPressed: () {
              // TODO: submit result
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const CharacterScreen()));
            },
            child: Text(localization.create),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
          ),
          const SizedBox(height: 32)
        ],
      ),
    );
  }
}

class ConstructorRow extends StatelessWidget {
  final String template;
  final VoidCallback onClick;

  const ConstructorRow({
    Key? key,
    required this.template,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(children: [
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.black54,
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(child: ConstructorText(template: template)),
            const Icon(Icons.chevron_right),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
      ]),
    );
  }
}

class ConstructorText extends StatelessWidget {
  final String template;

  const ConstructorText({Key? key, required this.template}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RichText(
              text: TextSpan(
            children: splitTemplate(template).map((segment) {
              if (segment[0] == '<' && segment[segment.length - 1] == '>') {
                return TextSpan(children: [
                  TextSpan(
                    text: segment.substring(1, segment.length - 1),
                    style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black),
                  ),
                  const TextSpan(
                      text: " ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ]);
              }

              return TextSpan(
                  text: segment + " ",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ));
            }).toList(),
          )),
        ),
      ],
    );
  }

  List<String> splitTemplate(String template) {
    final result = <String>[];
    StringBuffer? currentBuilder;
    template.split(" ").forEach((element) {
      if (element[0] == '<' &&
          element[element.length - 1] == '>' &&
          element.length == 2) {
        currentBuilder = null;
        result.add("          ");
      } else if (element[0] == '<' && element[element.length - 1] == '>') {
        currentBuilder = null;
        result.add(element);
      } else if (currentBuilder == null && element[0] != '<') {
        result.add(element);
      } else if (currentBuilder == null && element[0] == '<') {
        currentBuilder = StringBuffer()
          ..write(element)
          ..write(" ");
      } else if (element[element.length - 1] == '>') {
        currentBuilder?.write(element);
        result.add(currentBuilder.toString());
        currentBuilder = null;
      } else if (currentBuilder != null) {
        currentBuilder?.write(element);
      }
    });
    return result;
  }
}
