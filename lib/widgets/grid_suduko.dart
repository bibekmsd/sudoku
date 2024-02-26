import 'package:flutter/material.dart';
import 'package:practise_flutter/widgets/number_button.dart';
import 'package:google_fonts/google_fonts.dart';

class GridSudoku extends StatefulWidget {

  final List<List<int>> initialValues;

  const GridSudoku({required this.initialValues, super.key});

  @override
  State<GridSudoku> createState() => _GridSudokuState();
}

class _GridSudokuState extends State<GridSudoku> {
  int selectedNumber = 0;
  bool _isInDistinctSubgrid(int row, int col) {
    final int subgridRow = row ~/ 3;
    final int subgridCol = col ~/ 3;
    return (subgridRow + subgridCol) % 2 == 0;
  }

  Color getNumberColor(int number) {
    if (number == 0) {
      return Colors.black; // Change to your default color
    } else if (number % 2 == 0) {
      return Colors.black; // Change to your even number color
    } else {
      return Colors.black; // Change to your odd number color
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          children: [
            Column(
              children: [
               // const  SizedBox(width: 10,height: 20,),
                Expanded(
                  child: GridView.builder(
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
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: isHighlighted
                                ? Colors.indigo.shade50
                                : Color.fromRGBO(155, 190, 255, 1),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              widget.initialValues[row][col] != 0
                                  ? widget.initialValues[row][col].toString()
                                  : '',
                              style:TextStyle(
                                fontFamily: GoogleFonts.roboto().fontFamily,
                                fontWeight: FontWeight.w400,
                                fontSize: 24.0,
                                color: getNumberColor(widget.initialValues[row][col]),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: NumberButtonPad(
                onNumberPressed: (int number) {
                  setState(() {
                    selectedNumber = number;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
