import 'package:flutter/material.dart';

class SudokuSolver extends StatefulWidget {
  const SudokuSolver({Key? key}) : super(key: key);

  @override
  State<SudokuSolver> createState() => _SudokuSolverState();
}

class _SudokuSolverState extends State<SudokuSolver> {
  List<List<int>> grid = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
  ];

  int selectedNumber = 1;
  int selectedRow = -1;
  int selectedCol = -1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudoku Solver'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primary.withOpacity(0.05),
              theme.colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Header
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.psychology,
                          size: 48,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Solve Your Sudoku',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Enter your puzzle numbers and tap solve',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Sudoku Grid
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: _buildSudokuGrid(),
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Number Pad
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          'Select Number',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildNumberPad(),
                        const SizedBox(height: 16),
                        
                        // Action Buttons
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: _clearGrid,
                                icon: const Icon(Icons.clear_all),
                                label: const Text('Clear All'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.colorScheme.error,
                                  foregroundColor: theme.colorScheme.onError,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: _solvePuzzle,
                                icon: const Icon(Icons.auto_fix_high),
                                label: const Text('Solve'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.colorScheme.primary,
                                  foregroundColor: theme.colorScheme.onPrimary,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSudokuGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 9,
        childAspectRatio: 1,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: 81,
      itemBuilder: (context, index) {
        int row = index ~/ 9;
        int col = index % 9;
        
        return _buildGridCell(row, col);
      },
    );
  }

  Widget _buildGridCell(int row, int col) {
    final theme = Theme.of(context);
    bool isSelected = selectedRow == row && selectedCol == col;
    bool isInSameRow = selectedRow == row;
    bool isInSameCol = selectedCol == col;
    bool isInSameBox = (row ~/ 3) == (selectedRow ~/ 3) && (col ~/ 3) == (selectedCol ~/ 3);
    
    // Determine border thickness for 3x3 boxes
    double topBorder = row % 3 == 0 ? 2.0 : 0.5;
    double leftBorder = col % 3 == 0 ? 2.0 : 0.5;
    double rightBorder = col == 8 ? 2.0 : (col % 3 == 2 ? 2.0 : 0.5);
    double bottomBorder = row == 8 ? 2.0 : (row % 3 == 2 ? 2.0 : 0.5);

    Color backgroundColor = theme.colorScheme.surface;
    if (isSelected) {
      backgroundColor = theme.colorScheme.primary.withOpacity(0.3);
    } else if (isInSameRow || isInSameCol || isInSameBox) {
      backgroundColor = theme.colorScheme.primary.withOpacity(0.1);
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRow = row;
          selectedCol = col;
          if (selectedNumber > 0) {
            grid[row][col] = selectedNumber;
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border(
            top: BorderSide(width: topBorder, color: theme.colorScheme.outline),
            left: BorderSide(width: leftBorder, color: theme.colorScheme.outline),
            right: BorderSide(width: rightBorder, color: theme.colorScheme.outline),
            bottom: BorderSide(width: bottomBorder, color: theme.colorScheme.outline),
          ),
        ),
        child: Center(
          child: Text(
            grid[row][col] == 0 ? '' : grid[row][col].toString(),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberPad() {
    final theme = Theme.of(context);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(10, (index) {
        bool isSelected = selectedNumber == index;
        
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedNumber = index;
              if (selectedRow != -1 && selectedCol != -1) {
                grid[selectedRow][selectedCol] = index;
              }
            });
          },
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isSelected 
                ? theme.colorScheme.primary 
                : theme.colorScheme.surface,
              border: Border.all(
                color: theme.colorScheme.outline,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                index == 0 ? '✕' : index.toString(),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: isSelected 
                    ? theme.colorScheme.onPrimary 
                    : theme.colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void _clearGrid() {
    setState(() {
      grid = List.generate(9, (i) => List.generate(9, (j) => 0));
      selectedRow = -1;
      selectedCol = -1;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Grid cleared!'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _solvePuzzle() {
    setState(() {
      if (_solveSudoku(grid)) {
        selectedRow = -1;
        selectedCol = -1;
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Puzzle solved!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  bool _solveSudoku(List<List<int>> board) {
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {
        if (board[row][col] == 0) {
          for (int num = 1; num <= 9; num++) {
            if (_isValidMove(board, row, col, num)) {
              board[row][col] = num;
              
              if (_solveSudoku(board)) {
                return true;
              }
              
              board[row][col] = 0;
            }
          }
          return false;
        }
      }
    }
    return true;
  }

  bool _isValidMove(List<List<int>> board, int row, int col, int num) {
    // Check row
    for (int i = 0; i < 9; i++) {
      if (board[row][i] == num) return false;
    }
    
    // Check column
    for (int i = 0; i < 9; i++) {
      if (board[i][col] == num) return false;
    }
    
    // Check 3x3 box
    int boxRow = (row ~/ 3) * 3;
    int boxCol = (col ~/ 3) * 3;
    for (int i = boxRow; i < boxRow + 3; i++) {
      for (int j = boxCol; j < boxCol + 3; j++) {
        if (board[i][j] == num) return false;
      }
    }
    
    return true;
  }
}
