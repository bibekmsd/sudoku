import 'package:flutter/material.dart';
import 'package:practise_flutter/widgets/modern_game_screen.dart';

class ImpossibleScreen extends StatelessWidget {
  final List<List<int>> numberList = [
    [0, 0, 0, 0, 0, 6, 0, 0, 0],
    [0, 5, 9, 0, 0, 0, 0, 0, 8],
    [2, 0, 0, 0, 0, 8, 0, 0, 0],
    [0, 4, 5, 0, 0, 0, 0, 0, 0],
    [0, 0, 3, 0, 0, 0, 0, 0, 0],
    [0, 0, 6, 0, 0, 3, 0, 5, 4],
    [0, 0, 0, 3, 2, 5, 0, 0, 6],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
  ];

  ImpossibleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModernGameScreen(
      difficulty: 'Expert',
      initialValues: numberList,
      difficultyColor: Colors.purple,
    );
  }
}
