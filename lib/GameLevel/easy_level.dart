import 'package:flutter/material.dart';
import 'package:practise_flutter/widgets/modern_game_screen.dart';

class EasyScreen extends StatelessWidget {
  final List<List<int>> numberList = [
    [5, 3, 0, 0, 7, 0, 0, 0, 0],
    [6, 0, 0, 1, 9, 5, 0, 0, 0],
    [0, 9, 8, 0, 0, 0, 0, 6, 0],
    [8, 0, 0, 0, 6, 0, 0, 0, 3],
    [4, 0, 0, 8, 0, 3, 0, 0, 1],
    [7, 0, 0, 0, 2, 0, 0, 0, 6],
    [0, 6, 0, 0, 0, 0, 2, 8, 0],
    [0, 0, 0, 4, 1, 9, 0, 0, 5],
    [0, 0, 0, 0, 8, 0, 0, 7, 9],
  ];

  EasyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModernGameScreen(
      difficulty: 'Easy',
      initialValues: numberList,
      difficultyColor: Colors.green,
    );
  }
}
