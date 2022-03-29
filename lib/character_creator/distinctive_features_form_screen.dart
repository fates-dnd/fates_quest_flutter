import 'package:fates_quest_flutter/model/character_builder_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DistinctiveFeaturesFormScreen extends StatefulWidget {
  final String? value;

  const DistinctiveFeaturesFormScreen({Key? key, this.value}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DistinctiveFeaturesFormScreenState();
  }
}

class _DistinctiveFeaturesFormScreenState
    extends State<DistinctiveFeaturesFormScreen> {
  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    textController.text = widget.value ?? "";
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
              localization.distinctive_features,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Expanded(
              child: TextField(
                controller: textController,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<CharacterBuilderModel>(context, listen: false)
                    .setDistinctiveFeatures(textController.text);
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
