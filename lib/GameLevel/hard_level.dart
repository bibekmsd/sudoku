import 'package:flutter/material.dart';
import 'package:practise_flutter/widgets/modern_game_screen.dart';

class HardScreen extends StatelessWidget {
  final List<List<int>> numberList = [
    [0, 0, 0, 0, 0, 0, 0, 1, 0],
    [4, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 2, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 5, 0, 4, 0, 7],
    [0, 0, 8, 0, 0, 0, 3, 0, 0],
    [0, 0, 1, 0, 9, 0, 0, 0, 0],
    [3, 0, 0, 4, 0, 0, 2, 0, 0],
    [0, 5, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 8, 0, 6, 0, 0, 0],
  ];

  HardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModernGameScreen(
      difficulty: 'Hard',
      initialValues: numberList,
      difficultyColor: Colors.red,
    );
  }
}
