import 'package:fates_quest_flutter/character/character_screen.dart';
import 'package:fates_quest_flutter/character_creator/age_and_height_form_screen.dart';
import 'package:fates_quest_flutter/character_creator/distinctive_features_form_screen.dart';
import 'package:fates_quest_flutter/character_creator/dream_form_screen.dart';
import 'package:fates_quest_flutter/character_creator/home_and_community_form_screen.dart';
import 'package:fates_quest_flutter/character_creator/name_form_screen.dart';
import 'package:fates_quest_flutter/character_creator/role_form_screen.dart';
import 'package:fates_quest_flutter/character_creator/wear_and_move_style_form_screen.dart';
import 'package:fates_quest_flutter/data/role.dart';
import 'package:fates_quest_flutter/model/character_builder_model.dart';
import 'package:fates_quest_flutter/model/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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
          Consumer<CharacterBuilderModel>(
            builder: (context, builder, child) => ConstructorRow(
              template: localization.my_name_is__template,
              templateValues: {
                "name": builder.name,
              },
              onClick: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NameFormScreen(value: builder.name))),
            ),
          ),
          Consumer<CharacterBuilderModel>(
            builder: (context, builder, child) => ConstructorRow(
              template: localization.i_am_old_and_tall__template,
              templateValues: {
                "age": builder.age,
                "height": builder.height,
              },
              onClick: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AgeAndHeightFormScreen(
                        age: builder.age,
                        height: builder.height,
                      ))),
            ),
          ),
          Consumer<CharacterBuilderModel>(
            builder: (context, builder, child) => ConstructorRow(
              template: localization.i_am_the_parties__template,
              templateValues: {
                "role": builder.role?.getName(context),
              },
              onClick: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RoleFormScreen(
                        role: builder.role,
                      ))),
            ),
          ),
          Consumer<CharacterBuilderModel>(
            builder: (context, builder, child) => ConstructorRow(
              template: localization.when_people_see_me_they_notice__template,
              templateValues: {
                "distinctive features": builder.distinctiveFeatures
              },
              onClick: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DistinctiveFeaturesFormScreen(
                      value: builder.distinctiveFeatures))),
            ),
          ),
          Consumer<CharacterBuilderModel>(
            builder: (context, builder, child) => ConstructorRow(
              template: localization.i_wear_and_move_with__template,
              templateValues: {
                "wear style": builder.wearStyle,
                "move style": builder.moveStyle
              },
              onClick: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WearAndMoveStyleFormScreen(
                        wearStyle: builder.wearStyle,
                        moveStyle: builder.moveStyle,
                      ))),
            ),
          ),
          Consumer<CharacterBuilderModel>(
            builder: (context, builder, child) => ConstructorRow(
              template:
                  localization.i_am_from_where_people_are_known_for__template,
              templateValues: {
                "home": builder.home,
                "community": builder.community
              },
              onClick: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeAndCommunityFormScreen(
                        home: builder.home,
                        community: builder.community,
                      ))),
            ),
          ),
          Consumer<CharacterBuilderModel>(
            builder: (context, builder, child) => ConstructorRow(
              template: localization.i_dream_of__template,
              templateValues: {"dream": builder.dream},
              onClick: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DreamFormScreen(
                        dream: builder.dream,
                      ))),
            ),
          ),
          Consumer<CharacterBuilderModel>(
            builder: (context, builder, child) => ElevatedButton(
              onPressed: () {
                final character = builder.buildCharacter();
                Provider.of<CharacterModel>(context, listen: false)
                    .addCharacter(character);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        CharacterScreen(character: character)));
              },
              child: Text(localization.create),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
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
  final Map<String, String?> templateValues;
  final VoidCallback onClick;

  const ConstructorRow({
    Key? key,
    required this.template,
    required this.templateValues,
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
            Expanded(
                child: ConstructorText(
              template: template,
              templateValues: templateValues,
            )),
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
  final Map<String, String?> templateValues;

  const ConstructorText({
    Key? key,
    required this.template,
    required this.templateValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RichText(
              text: TextSpan(
            children: splitTemplate(template).map((segment) {
              if (segment[0] == '<' && segment[segment.length - 1] == '>') {
                final templateName = segment.substring(1, segment.length - 1);
                return TextSpan(children: [
                  TextSpan(
                    text: templateValues[templateName] ?? templateName,
                    style: TextStyle(
                      color: templateValues[templateName] == null
                          ? Colors.black45
                          : Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                    ),
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
