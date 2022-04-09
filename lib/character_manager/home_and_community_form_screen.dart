import 'package:fates_for_quest/model/character_builder_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeAndCommunityFormScreen extends StatefulWidget {
  final String? home;
  final String? community;

  const HomeAndCommunityFormScreen({Key? key, this.home, this.community})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeAndCommunityFormScreenState();
  }
}

class _HomeAndCommunityFormScreenState
    extends State<HomeAndCommunityFormScreen> {
  late TextEditingController homeController;
  late TextEditingController communityController;

  @override
  void initState() {
    homeController = TextEditingController();
    communityController = TextEditingController();

    homeController.text = widget.home ?? "";
    communityController.text = widget.community ?? "";
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
                    localization.home,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: homeController,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    localization.community,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: communityController,
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
                    .setHomeAndCommunity(
                  homeController.text,
                  communityController.text,
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
