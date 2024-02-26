import 'package:flutter/material.dart';
import 'package:practise_flutter/Themes/my_theme.dart';
import 'package:practise_flutter/widgets/app_bar.dart';
import 'package:practise_flutter/widgets/grid_suduko.dart';

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

  void addPredefinedValues() {

  }

  EasyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:const  CustomAppBar(title: "Easy Level",
          size: 32,

      ),

      body:
      Stack
        (
        children:[
          const SizedBox(height: 180,width: 30),
        GridSudoku(initialValues: numberList),
      ]
      )
    );
  }
}
