import 'package:flutter/material.dart';
import 'package:practise_flutter/Themes/my_theme.dart';
import 'package:practise_flutter/widgets/app_bar.dart';
import 'package:practise_flutter/widgets/app_buttons.dart';
import 'package:practise_flutter/widgets/grid_suduko.dart';
import 'package:practise_flutter/widgets/number_button.dart';

class SukokuSolver extends StatefulWidget {
  const SukokuSolver({Key? key}) : super(key: key);

  @override
  State<SukokuSolver> createState() => _SukokuSolverState();
}

class _SukokuSolverState extends State<SukokuSolver> {
  final List<List<int>> numberList = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 8, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
  ];

  int selectedNumber = 0;

  void updateGridValue(int row, int col) {
    setState(() {
      numberList[row][col] = selectedNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(
          title: " Sudoku Solver ",
          size: 32,
          // leading: Icon(Icons.numbers),
        ),
        body: Stack(
            children: [
              GridSudoku(initialValues: numberList),
              Positioned
                (
                bottom:230, // Adjust the position as needed
                left: 150, // Adjust the position as needed
                child: AppButtons(
                  bgColor: const Color.fromRGBO(155, 190, 255, 1),
                  fontSize: 32,
                 sizeWidth: 40,
                    sizeHeight: 32,
                  text: "Solve !",
                  onPressedCallback:call,
                  txtColor: Theme.of(context).brightness == Brightness.light
                    ? Colors.black // Light mode text color
                    : Colors.white, // Dark mode text color

                ),

              )
              ,]


        ));

  }}
void call()
{}
