import 'package:fates_quest_flutter/model/character_builder_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DreamFormScreen extends StatefulWidget {
  final String? dream;

  const DreamFormScreen({Key? key, this.dream}) : super(key: key);

  @override
  State createState() {
    return _DreamFormScreenState();
  }
}

class _DreamFormScreenState extends State<DreamFormScreen> {
  late TextEditingController dreamController;

  @override
  void initState() {
    dreamController = TextEditingController();
    dreamController.text = widget.dream ?? "";
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
            Text(
              localization.dream,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Expanded(
              child: TextField(
                controller: dreamController,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<CharacterBuilderModel>(context, listen: false).setDream(dreamController.text);
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
