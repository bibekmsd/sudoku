import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedSudoku extends StatefulWidget {
  const AnimatedSudoku({Key? key}) : super(key: key);

  @override
  State<AnimatedSudoku> createState() => _AnimatedSudokuState();
}

class _AnimatedSudokuState extends State<AnimatedSudoku> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Su-Do-Ku',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 38.0,
            fontFamily: 'Horizon',
            color: Colors.white,
          ),
        ),
        SizedBox(width: 1.0), // Adjust the spacing between 'SuDoKu' and animated texts
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Horizon',
          ),
          child: SizedBox(
            width: 100, // Set a constant width for the rotating texts
            child: AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText('Play', textStyle: TextStyle(color: Colors.white)),
                RotateAnimatedText('Solve', textStyle: TextStyle(color: Colors.white)),
                RotateAnimatedText('Learn', textStyle: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
