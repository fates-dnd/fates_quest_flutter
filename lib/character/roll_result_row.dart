import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RollResultRow extends StatefulWidget {
  const RollResultRow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RollResultRowState();
}

class _RollResultRowState extends State<RollResultRow> {
  late int rolledValue;
  late bool isRolled;

  @override
  void initState() {
    rolledValue = 0;
    isRolled = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedOpacity(
          opacity: isRolled ? 1 : 0,
          duration: const Duration(milliseconds: 150),
          child: Text(
            rolledValue.toString(),
            style: const TextStyle(fontSize: 24),
          ),
        ),
        AnimatedAlign(
          alignment: isRolled ? Alignment.centerRight : Alignment.center,
          duration: const Duration(milliseconds: 150),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  rolledValue = 1 + Random().nextInt(20);
                  isRolled = true;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
              ),
              child: SvgPicture.asset(
                "assets/d20.svg",
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
