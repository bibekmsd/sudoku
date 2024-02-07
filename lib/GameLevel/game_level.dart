// ignore_for_file: sort_child_properties_last

import 'package:practise_flutter/GameLevel/easy_level.dart';
import 'package:practise_flutter/GameLevel/medium_level.dart';
import 'package:practise_flutter/GameLevel/hard_level.dart';
import 'package:practise_flutter/GameLevel/impossible_level.dart';

import 'package:flutter/material.dart';
import 'package:practise_flutter/widgets/app_buttons.dart';

class GameLevelNew extends StatelessWidget {
  const GameLevelNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Difficulty Level'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildLevelButton(context, "Easy", EasyScreen()),
            buildLevelButton(context, "Medium", const MediumScreen()),
            buildLevelButton(context, "Hard", const HardScreen()),
            buildLevelButton(context, "Impossible", const ImpossibleScreen()),
          ],
        ),
      ),
    );
  }

  Widget buildLevelButton(
      BuildContext context, String level, Widget destinationScreen) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => destinationScreen));
        },
        child: AppButtons(
          txtColor: Colors.black,
          bgColor: Colors.blueGrey,
          text: level,
          sizeWidth: MediaQuery.of(context).size.width * 0.5,
          sizeHeight: 80,
          fontSize: 22,
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
