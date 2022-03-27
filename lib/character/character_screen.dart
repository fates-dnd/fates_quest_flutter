import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Expanded(child: SizedBox()),

        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {  },
      child: SvgPicture.asset("assets/d20.svg", color: Colors.white,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}