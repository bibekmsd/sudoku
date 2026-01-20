import 'package:flutter/material.dart';
import 'package:practise_flutter/services/mock_data_service.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);
  
  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userProfile = MockDataService.getMockUserProfile();
    final gameHistory = MockDataService.getMockGameHistory();
    final stats = MockDataService.getMockStatistics();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
        leading: const SizedBox.shrink(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overview Stats
            _buildOverviewStats(context, userProfile),
            const SizedBox(height: 24),
            
            // Performance by Difficulty
            _buildPerformanceStats(context, stats),
            const SizedBox(height: 24),
            
            // Recent Games Chart (placeholder)
            _buildRecentGamesChart(context, gameHistory),
            const SizedBox(height: 24),
            
            // Game History
            _buildGameHistory(context, gameHistory),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewStats(BuildContext context, dynamic userProfile) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overview',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _buildOverviewStatItem(
                  context, 
                  'Total Games', 
                  '${userProfile.gamesPlayed}',
                  Icons.games,
                  Colors.blue,
                ),
                _buildOverviewStatItem(
                  context, 
                  'Games Won', 
                  '${userProfile.gamesWon}',
                  Icons.emoji_events,
                  Colors.green,
                ),
                _buildOverviewStatItem(
                  context, 
                  'Win Rate', 
                  '${userProfile.winRate.toStringAsFixed(1)}%',
                  Icons.trending_up,
                  Colors.orange,
                ),
                _buildOverviewStatItem(
                  context, 
                  'Best Streak', 
                  '${userProfile.longestStreak}',
                  Icons.local_fire_department,
                  Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewStatItem(BuildContext context, String title, String value, IconData icon, Color color) {
    final theme = Theme.of(context);
    
    return Container(
      
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: theme.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceStats(BuildContext context, Map<String, double> stats) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Performance by Difficulty',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildDifficultyPerformance(context, 'Easy', stats['averageTimeEasy']!, stats['completionRateEasy']!, Colors.green),
            const SizedBox(height: 12),
            _buildDifficultyPerformance(context, 'Medium', stats['averageTimeMedium']!, stats['completionRateMedium']!, Colors.orange),
            const SizedBox(height: 12),
            _buildDifficultyPerformance(context, 'Hard', stats['averageTimeHard']!, stats['completionRateHard']!, Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildDifficultyPerformance(BuildContext context, String difficulty, double avgTime, double completionRate, Color color) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              difficulty,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${completionRate.toStringAsFixed(1)}%',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: completionRate / 100,
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
        const SizedBox(height: 4),
        Text(
          'Avg Time: ${avgTime.toStringAsFixed(1)} min',
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildRecentGamesChart(BuildContext context, List<dynamic> gameHistory) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Activity',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: gameHistory.take(7).map((game) {
                  final height = game.completed ? 80.0 : 30.0;
                  final color = game.completed ? Colors.green : Colors.red;
                  
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 24,
                        height: height,
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        game.difficulty[0],
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(context, 'Completed', Colors.green),
                const SizedBox(width: 20),
                _buildLegendItem(context, 'Incomplete', Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(BuildContext context, String label, Color color) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color.withOpacity(0.7),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildGameHistory(BuildContext context, List<dynamic> gameHistory) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Game History',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Show full history
                  },
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...gameHistory.map((game) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: game.completed 
                          ? Colors.green.withOpacity(0.1)
                          : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      game.completed ? Icons.check : Icons.close,
                      color: game.completed ? Colors.green : Colors.red,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          game.difficulty,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          _formatRelativeTime(game.date),
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        game.formattedDuration,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (game.completed)
                        Text(
                          '${game.score} pts',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }

  String _formatRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inMinutes}m ago';
    }
  }
}
