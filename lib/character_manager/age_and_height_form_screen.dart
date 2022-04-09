import 'package:fates_for_quest/model/character_builder_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AgeAndHeightFormScreen extends StatefulWidget {
  final String? age;
  final String? height;

  const AgeAndHeightFormScreen({Key? key, this.age, this.height})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AgeAndHeightFormScreenState();
  }
}

class _AgeAndHeightFormScreenState extends State<AgeAndHeightFormScreen> {
  late TextEditingController ageController;
  late TextEditingController heightController;

  @override
  void initState() {
    ageController = TextEditingController();
    heightController = TextEditingController();

    ageController.text = widget.age ?? "";
    heightController.text = widget.height ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localization.age,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: ageController,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    localization.height,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: heightController,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<CharacterBuilderModel>(context, listen: false)
                    .setAgeAndHeight(
                  ageController.text,
                  heightController.text,
                );
                Navigator.of(context).pop();
              },
              child: Text(localization.done),
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
