import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RollResultRow extends StatefulWidget {
  const RollResultRow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RollResultRowState();
}

class _RollResultRowState extends State<RollResultRow> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(8),
      ),
      child: SvgPicture.asset(
        "assets/d20.svg",
        color: Colors.white,
      ),
    );
  }
}
