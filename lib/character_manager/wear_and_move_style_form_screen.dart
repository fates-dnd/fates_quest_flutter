import 'package:fates_quest_flutter/model/character_builder_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class WearAndMoveStyleFormScreen extends StatefulWidget {
  final String? wearStyle;
  final String? moveStyle;

  const WearAndMoveStyleFormScreen({Key? key, this.wearStyle, this.moveStyle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WearAndMoveStyleFormScreenState();
  }
}

class _WearAndMoveStyleFormScreenState
    extends State<WearAndMoveStyleFormScreen> {
  late TextEditingController wearStyleController;
  late TextEditingController moveStyleController;

  @override
  void initState() {
    wearStyleController = TextEditingController();
    moveStyleController = TextEditingController();

    wearStyleController.text = widget.wearStyle ?? "";
    moveStyleController.text = widget.moveStyle ?? "";
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
                    localization.wear_style,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: wearStyleController,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    localization.move_style,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: moveStyleController,
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
                    .setStyle(
                  wearStyleController.text,
                  moveStyleController.text,
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
