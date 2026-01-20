import 'package:flutter/material.dart';
import 'dart:async';

class ModernGameScreen extends StatefulWidget {
  final String difficulty;
  final List<List<int>> initialValues;
  final Color difficultyColor;

  const ModernGameScreen({
    Key? key,
    required this.difficulty,
    required this.initialValues,
    required this.difficultyColor,
  }) : super(key: key);

  @override
  State<ModernGameScreen> createState() => _ModernGameScreenState();
}

class _ModernGameScreenState extends State<ModernGameScreen> {
  late List<List<int>> currentValues;
  late List<List<bool>> isOriginal;
  Timer? _timer;
  int _elapsedSeconds = 0;
  int selectedRow = -1;
  int selectedCol = -1;
  int hintsUsed = 0;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    _initializeGame();
    _startTimer();
  }

  void _initializeGame() {
    currentValues = widget.initialValues.map((row) => List<int>.from(row)).toList();
    isOriginal = List.generate(9, (i) => List.generate(9, (j) => widget.initialValues[i][j] != 0));
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!isPaused) {
        setState(() {
          _elapsedSeconds++;
        });
      }
    });
  }

  void _pauseGame() {
    setState(() {
      isPaused = !isPaused;
    });
  }

  void _useHint() {
    if (hintsUsed >= 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Maximum hints used!')),
      );
      return;
    }

    // Find a random empty cell and fill it (mock hint)
    List<List<int>> emptyCells = [];
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (currentValues[i][j] == 0) {
          emptyCells.add([i, j]);
        }
      }
    }

    if (emptyCells.isNotEmpty) {
      final randomCell = emptyCells[DateTime.now().millisecondsSinceEpoch % emptyCells.length];
      setState(() {
        currentValues[randomCell[0]][randomCell[1]] = 5; // Mock value
        hintsUsed++;
      });
    }
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.difficulty),
        actions: [
          IconButton(
            icon: Icon(isPaused ? Icons.play_arrow : Icons.pause),
            onPressed: _pauseGame,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Restart Game'),
                  content: const Text('Are you sure you want to restart?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          _initializeGame();
                          _elapsedSeconds = 0;
                          hintsUsed = 0;
                          selectedRow = -1;
                          selectedCol = -1;
                        });
                      },
                      child: const Text('Restart'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Game Info Header
          _buildGameHeader(theme),
          
          // Sudoku Grid
          Expanded(
            child: _buildSudokuGrid(theme),
          ),
          
          // Number Pad
          _buildNumberPad(theme),
        ],
      ),
    );
  }

  Widget _buildGameHeader(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Timer
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Icon(Icons.timer, color: theme.colorScheme.primary),
                    const SizedBox(height: 4),
                    Text(
                      _formatTime(_elapsedSeconds),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Time',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Difficulty
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Icon(Icons.speed, color: widget.difficultyColor),
                    const SizedBox(height: 4),
                    Text(
                      widget.difficulty,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: widget.difficultyColor,
                      ),
                    ),
                    Text(
                      'Level',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Hints
          Expanded(
            child: Card(
              child: InkWell(
                onTap: _useHint,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Icon(
                        Icons.lightbulb,
                        color: hintsUsed >= 3 ? Colors.grey : Colors.amber,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${3 - hintsUsed}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Hints',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSudokuGrid(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 81,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 9,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                final row = index ~/ 9;
                final col = index % 9;
                final value = currentValues[row][col];
                final isSelected = selectedRow == row && selectedCol == col;
                final isOriginalValue = isOriginal[row][col];
                final isSubgridHighlighted = _isInDistinctSubgrid(row, col);

                return GestureDetector(
                  onTap: () {
                    if (!isOriginalValue) {
                      setState(() {
                        selectedRow = row;
                        selectedCol = col;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? theme.colorScheme.primary.withOpacity(0.3)
                          : isSubgridHighlighted
                              ? theme.colorScheme.surfaceContainerHighest
                              : theme.colorScheme.surface,
                      border: Border.all(
                        color: _getBorderColor(row, col, theme),
                        width: _getBorderWidth(row, col),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        value == 0 ? '' : value.toString(),
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isOriginalValue
                              ? theme.colorScheme.onSurface
                              : theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  bool _isInDistinctSubgrid(int row, int col) {
    final subgridRow = row ~/ 3;
    final subgridCol = col ~/ 3;
    return (subgridRow + subgridCol) % 2 == 0;
  }

  Color _getBorderColor(int row, int col, ThemeData theme) {
    if (row % 3 == 0 || col % 3 == 0) {
      return theme.colorScheme.onSurface;
    }
    return theme.colorScheme.onSurfaceVariant.withOpacity(0.3);
  }

  double _getBorderWidth(int row, int col) {
    if (row % 3 == 0 || col % 3 == 0) {
      return 2.0;
    }
    return 1.0;
  }

  Widget _buildNumberPad(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Number buttons
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 5,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.2,
            children: [
              for (int i = 1; i <= 9; i++)
                _buildNumberButton(i, theme),
              _buildActionButton(Icons.backspace, 'Clear', () {
                if (selectedRow != -1 && selectedCol != -1 && !isOriginal[selectedRow][selectedCol]) {
                  setState(() {
                    currentValues[selectedRow][selectedCol] = 0;
                  });
                }
              }, theme),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumberButton(int number, ThemeData theme) {
    return ElevatedButton(
      onPressed: () {
        if (selectedRow != -1 && selectedCol != -1 && !isOriginal[selectedRow][selectedCol]) {
          setState(() {
            currentValues[selectedRow][selectedCol] = number;
          });
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primaryContainer,
        foregroundColor: theme.colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        number.toString(),
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String tooltip, VoidCallback onPressed, ThemeData theme) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.secondaryContainer,
        foregroundColor: theme.colorScheme.onSecondaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Icon(icon),
    );
  }
}
