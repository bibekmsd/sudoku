// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:practise_flutter/GameLevel/easy_level.dart';
import 'package:practise_flutter/GameLevel/medium_level.dart';
import 'package:practise_flutter/GameLevel/hard_level.dart';
import 'package:practise_flutter/GameLevel/impossible_level.dart';
import 'package:practise_flutter/widgets/app_bar.dart';
import 'package:practise_flutter/widgets/app_buttons.dart';

class GameLevelNew extends StatelessWidget {
  const GameLevelNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        size: 32,
        title: 'Difficulty Level',

      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img.tapimg.net/market/images/734f283771debbc0c3120cd563422015.png?imageView2/0/w/720/h/405/q/80/format/jpg/interlace/1/ignore-error/1',

                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
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
        ],
      ),
    );
  }

  Widget buildLevelButton(BuildContext context, String level, Widget destinationScreen) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppButtons(
        txtColor: Theme.of(context).brightness == Brightness.light
            ? Colors.indigo// Light mode text color
            : Colors.black,// Dark mode text color
        bgColor: const Color.fromRGBO(155, 190, 255, 1),
        text: level,
        sizeWidth: MediaQuery.of(context).size.width * 0.5,
        sizeHeight: 80,
        fontSize: 22,
        onPressedCallback: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => destinationScreen));
        },
      ),
    );
  }
}
