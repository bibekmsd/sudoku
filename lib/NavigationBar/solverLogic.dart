// import 'package:flutter/material.dart';
//
// class SudokuSolver extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Sudoku Solver'),
//         ),
//         body: SudokuSolverScreen(),
//       ),
//     );
//   }
// }
//
// class SudokuSolverScreen extends StatefulWidget {
//   @override
//   _SudokuSolverScreenState createState() => _SudokuSolverScreenState();
// }
//
// class _SudokuSolverScreenState extends State<SudokuSolverScreen> {
//   int n = 9;
//   List<List<int>> board = [
//     [5, 3, 0, 0, 7, 0, 0, 0, 0],
//     [6, 0, 0, 1, 9, 5, 0, 0, 0],
//     [0, 9, 8, 0, 0, 0, 0, 6, 0],
//     [8, 0, 0, 0, 6, 0, 0, 0, 3],
//     [4, 0, 0, 8, 0, 3, 0, 0, 1],
//     [7, 0, 0, 0, 2, 0, 0, 0, 6],
//     [0, 6, 0, 0, 0, 0, 2, 8, 0],
//     [0, 0, 0, 4, 1, 9, 0, 0, 5],
//     [0, 0, 0, 0, 8, 0, 0, 7, 9]
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           'Sudoku Solver',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 20),
//         SudokuBoard(board: board, n: n),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               SudokuSolver().solveSudoku(board, 0, 0, n);
//             });
//           },
//           child: Text('Solve Sudoku'),
//         ),
//       ],
//     );
//   }
// }
//
// class SudokuBoard extends StatelessWidget {
//   final List<List<int>> board;
//   final int n;
//
//   SudokuBoard({required this.board, required this.n});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: List.generate(
//         n,
//             (i) => Row(
//           children: List.generate(
//             n,
//                 (j) => Container(
//               width: 30,
//               height: 30,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//               ),
//               child: Center(
//                 child: Text(
//                   board[i][j].toString(),
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SudokuSolver {
//   bool isValid(List<List<int>> board, int i, int j, int num, int n) {
//     // ... (same as previous code)
//
//     return true;
//   }
//
//   bool solveSudoku(List<List<int>> board, int i, int j, int n) {
//     // ... (same as previous code)
//     return false;
//   }
// }
