import 'package:flutter/material.dart';
import 'package:practise_flutter/widgets/number_button.dart';

class GridSudoku extends StatelessWidget {
  final List<List<int>> initialValues;

  const GridSudoku({required this.initialValues, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 81,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 9,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
            ),
            itemBuilder: (context, index) {
              final int row = (index / 9).floor();
              final int col = index % 9;
              final bool isHighlighted = _isInDistinctSubgrid(row, col);

              return Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: isHighlighted
                        ? Colors.lightBlue.shade50
                        : Colors.lightBlue.shade200,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      initialValues[row][col] != 0
                          ? initialValues[row][col].toString()
                          : '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: getNumberColor(initialValues[row][col]),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          // const NumberButtonPad(),
        ],
      ),
    );
  }

  bool _isInDistinctSubgrid(int row, int col) {
    final int subgridRow = row ~/ 3;
    final int subgridCol = col ~/ 3;
    return (subgridRow + subgridCol) % 2 == 0;
  }

  Color getNumberColor(int number) {
    if (number == 0) {
      return Colors.black; // Change to your default color
    } else if (number % 2 == 0) {
      return Colors.red; // Change to your even number color
    } else {
      return Colors.blue; // Change to your odd number color
    }
  }
}
