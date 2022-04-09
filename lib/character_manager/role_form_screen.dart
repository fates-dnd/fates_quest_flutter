import 'package:fates_quest_flutter/data/role.dart';
import 'package:fates_quest_flutter/model/character_builder_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class RoleFormScreen extends StatelessWidget {
  final Role? role;

  const RoleFormScreen({Key? key, this.role}) : super(key: key);

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
              localization.role,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: RolesGrid(initialRole: role),
            ),
            ElevatedButton(
              onPressed: () {
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

class RolesGrid extends StatefulWidget {
  final Role? initialRole;

  const RolesGrid({Key? key, this.initialRole}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RolesGridState();
}

class _RolesGridState extends State<RolesGrid> {
  Role? selectedRole;

  @override
  void initState() {
    selectedRole = widget.initialRole;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return ListView(
      children: [
        RoleSection(
          title: localization.fighter_role,
          description: localization.fighter_description,
          isSelected: selectedRole == Role.fighter,
          onClicked: () => setState(() {
            selectedRole = Role.fighter;
            Provider.of<CharacterBuilderModel>(context, listen: false).setRole(Role.fighter);
          }),
        ),
        const SizedBox(height: 16),
        RoleSection(
          title: localization.invoker_role,
          description: localization.invoker_description,
          isSelected: selectedRole == Role.invoker,
          onClicked: () => setState(() {
            selectedRole = Role.invoker;
            Provider.of<CharacterBuilderModel>(context, listen: false).setRole(Role.invoker);
          }),
        ),
        const SizedBox(height: 16),
        RoleSection(
          title: localization.ranger_role,
          description: localization.ranger_description,
          isSelected: selectedRole == Role.ranger,
          onClicked: () => setState(() {
            selectedRole = Role.ranger;
            Provider.of<CharacterBuilderModel>(context, listen: false).setRole(Role.ranger);
          }),
        ),
        const SizedBox(height: 16),
        RoleSection(
          title: localization.naturalist_role,
          description: localization.naturalist_description,
          isSelected: selectedRole == Role.naturalist,
          onClicked: () => setState(() {
            selectedRole = Role.naturalist;
            Provider.of<CharacterBuilderModel>(context, listen: false).setRole(Role.naturalist);
          }),
        ),
        const SizedBox(height: 16),
        RoleSection(
          title: localization.doctor_role,
          description: localization.doctor_description,
          isSelected: selectedRole == Role.doctor,
          onClicked: () => setState(() {
            selectedRole = Role.doctor;
            Provider.of<CharacterBuilderModel>(context, listen: false).setRole(Role.doctor);
          }),
        ),
        const SizedBox(height: 16),
        RoleSection(
          title: localization.spy_role,
          description: localization.spy_description,
          isSelected: selectedRole == Role.spy,
          onClicked: () => setState(() {
            selectedRole = Role.spy;
            Provider.of<CharacterBuilderModel>(context, listen: false).setRole(Role.spy);
          }),
        ),
        const SizedBox(height: 16),
        RoleSection(
          title: localization.magician_role,
          description: localization.magician_description,
          isSelected: selectedRole == Role.magician,
          onClicked: () => setState(() {
            selectedRole = Role.magician;
            Provider.of<CharacterBuilderModel>(context, listen: false).setRole(Role.magician);
          }),
        ),
        const SizedBox(height: 16),
        RoleSection(
          title: localization.wizard_role,
          description: localization.wizard_descripition,
          isSelected: selectedRole == Role.wizard,
          onClicked: () => setState(() {
            selectedRole = Role.wizard;
            Provider.of<CharacterBuilderModel>(context, listen: false).setRole(Role.wizard);
          }),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class RoleSection extends StatelessWidget {
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onClicked;

  const RoleSection({
    Key? key,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: isSelected
                ? Border.all(
                    color: Colors.blue,
                    width: 2,
                  )
                : Border.all(
                    width: 2,
                  )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(description),
          ],
        ),
      ),
    );
  }
}
