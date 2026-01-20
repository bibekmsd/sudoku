import 'package:flutter/material.dart';
import 'package:practise_flutter/models/user_profile.dart';
import 'package:practise_flutter/services/mock_data_service.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProfile = MockDataService.getMockUserProfile();
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Navigate to edit profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 260,
              width: 600,
              child: _buildProfileHeader(context, userProfile),
            ),
            const SizedBox(height: 24),
            
            // Stats Cards
            _buildStatsGrid(context, userProfile),
            const SizedBox(height: 24),
            
            // Level Progress
            _buildLevelProgress(context, userProfile),
            const SizedBox(height: 24),
            
            // Achievements
            _buildAchievements(context, userProfile),
            const SizedBox(height: 24),
            
            // Recent Games
            _buildRecentGames(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, UserProfile profile) {
    final theme = Theme.of(context);
    
    return Card(
      
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profile.avatarUrl),
            ),
            const SizedBox(height: 16),
            Text(
              profile.name,
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(height: 4),
            Text(
              profile.email,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Level ${profile.level}',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context, UserProfile profile) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.4,
      children: [
        _buildStatCard(context, 'Games Played', '${profile.gamesPlayed}', Icons.games),
        _buildStatCard(context, 'Win Rate', '${profile.winRate.toStringAsFixed(1)}%', Icons.trending_up),
        _buildStatCard(context, 'Best Time', '${profile.bestTime.inMinutes}:${(profile.bestTime.inSeconds % 60).toString().padLeft(2, '0')}', Icons.timer),
        _buildStatCard(context, 'Current Streak', '${profile.currentStreak}', Icons.local_fire_department),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelProgress(BuildContext context, UserProfile profile) {
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
                  'Level Progress',
                  style: theme.textTheme.titleLarge,
                ),
                Text(
                  '${profile.xp} XP',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: profile.levelProgress,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
            ),
            const SizedBox(height: 8),
            Text(
              '${profile.xpToNextLevel} XP to Level ${profile.level + 1}',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievements(BuildContext context, UserProfile profile) {
    final theme = Theme.of(context);
    final unlockedAchievements = profile.achievements.where((a) => a.isUnlocked).toList();
    
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
                  'Achievements',
                  style: theme.textTheme.titleLarge,
                ),
                Text(
                  '${unlockedAchievements.length}/${profile.achievements.length}',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: profile.achievements.length,
                itemBuilder: (context, index) {
                  final achievement = profile.achievements[index];
                  return Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 12),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: achievement.isUnlocked
                                ? theme.colorScheme.primary.withOpacity(0.1)
                                : theme.colorScheme.surfaceContainerHighest,
                          ),
                          child: Center(
                            child: Text(
                              achievement.iconPath,
                              style: TextStyle(
                                fontSize: 24,
                                color: achievement.isUnlocked
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          achievement.title,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: achievement.isUnlocked
                                ? theme.colorScheme.onSurface
                                : theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentGames(BuildContext context) {
    final theme = Theme.of(context);
    final recentGames = MockDataService.getMockGameHistory().take(3).toList();
    
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
                  'Recent Games',
                  style: theme.textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to full history
                  },
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...recentGames.map((game) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: game.completed
                          ? Colors.green
                          : Colors.red,
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
                          game.formattedDuration,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  if (game.completed)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${game.score}',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}
