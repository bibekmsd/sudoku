import 'package:flutter/material.dart';
import 'package:practise_flutter/widgets/modern_game_screen.dart';

class MediumScreen extends StatelessWidget {
  final List<List<int>> numberList = [
    [0, 0, 0, 6, 0, 0, 4, 0, 0],
    [7, 0, 0, 0, 0, 3, 6, 0, 0],
    [0, 0, 0, 0, 9, 1, 0, 8, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 5, 0, 1, 8, 0, 0, 0, 3],
    [0, 0, 0, 3, 0, 6, 0, 4, 5],
    [0, 4, 0, 2, 0, 0, 0, 6, 0],
    [9, 0, 3, 0, 0, 0, 0, 0, 0],
    [0, 2, 0, 0, 0, 0, 1, 0, 0],
  ];

  MediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModernGameScreen(
      difficulty: 'Medium',
      initialValues: numberList,
      difficultyColor: Colors.orange,
    );
  }
}
