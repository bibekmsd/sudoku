import '../models/user_profile.dart';

class MockDataService {
  static UserProfile getMockUserProfile() {
    return UserProfile(
      id: "user_001",
      name: "Bibek Gautam",
      email: "bibgautam7@email.com",
      avatarUrl: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=200&h=200&fit=crop&crop=face",
      gamesPlayed: 27,
      gamesWon: 22,
      bestTime: const Duration(minutes: 4, seconds: 32),
      currentStreak: 12,
      longestStreak: 28,
      joinDate: DateTime.now().subtract(const Duration(days: 145)),
      difficulty: "Medium",
      level: 23,
      xp: 10050,
      achievements: getMockAchievements(),
    );
  }

  static List<Achievement> getMockAchievements() {
    return [
      Achievement(
        id: "first_win",
        title: "First Victory",
        description: "Complete your first Sudoku puzzle",
        iconPath: "🏆",
        unlockedDate: DateTime.now().subtract(const Duration(days: 145)),
        isUnlocked: true,
      ),
      Achievement(
        id: "speed_demon",
        title: "Speed Demon",
        description: "Complete a puzzle in under 5 minutes",
        iconPath: "⚡",
        unlockedDate: DateTime.now().subtract(const Duration(days: 67)),
        isUnlocked: true,
      ),
      Achievement(
        id: "streak_master",
        title: "Streak Master",
        description: "Win 10 games in a row",
        iconPath: "🔥",
        unlockedDate: DateTime.now().subtract(const Duration(days: 23)),
        isUnlocked: true,
      ),
      Achievement(
        id: "hundred_club",
        title: "Hundred Club",
        description: "Play 100 games",
        iconPath: "💯",
        unlockedDate: DateTime.now().subtract(const Duration(days: 12)),
        isUnlocked: true,
      ),
      Achievement(
        id: "perfectionist",
        title: "Perfectionist",
        description: "Complete 50 puzzles without hints",
        iconPath: "✨",
        unlockedDate: DateTime.now(),
        isUnlocked: false,
      ),
      Achievement(
        id: "grandmaster",
        title: "Grandmaster",
        description: "Reach level 20",
        iconPath: "👑",
        unlockedDate: DateTime.now(),
        isUnlocked: false,
      ),
    ];
  }

  static List<GameHistory> getMockGameHistory() {
    return [
      GameHistory(
        id: "game_001",
        difficulty: "Easy",
        duration: const Duration(minutes: 3, seconds: 24),
        completed: true,
        hintsUsed: 0,
        date: DateTime.now().subtract(const Duration(hours: 2)),
        score: 1250,
      ),
      GameHistory(
        id: "game_002",
        difficulty: "Medium",
        duration: const Duration(minutes: 7, seconds: 18),
        completed: true,
        hintsUsed: 2,
        date: DateTime.now().subtract(const Duration(hours: 6)),
        score: 980,
      ),
      GameHistory(
        id: "game_003",
        difficulty: "Hard",
        duration: const Duration(minutes: 15, seconds: 42),
        completed: false,
        hintsUsed: 5,
        date: DateTime.now().subtract(const Duration(days: 1)),
        score: 0,
      ),
      GameHistory(
        id: "game_004",
        difficulty: "Medium",
        duration: const Duration(minutes: 4, seconds: 56),
        completed: true,
        hintsUsed: 1,
        date: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
        score: 1150,
      ),
      GameHistory(
        id: "game_005",
        difficulty: "Easy",
        duration: const Duration(minutes: 2, seconds: 48),
        completed: true,
        hintsUsed: 0,
        date: DateTime.now().subtract(const Duration(days: 2)),
        score: 1400,
      ),
    ];
  }

  static Map<String, double> getMockStatistics() {
    return {
      'averageTimeEasy': 3.5,
      'averageTimeMedium': 8.2,
      'averageTimeHard': 18.7,
      'completionRateEasy': 95.5,
      'completionRateMedium': 78.3,
      'completionRateHard': 45.2,
      'hintsPerGameEasy': 0.8,
      'hintsPerGameMedium': 2.4,
      'hintsPerGameHard': 5.1,
    };
  }
}

class GameHistory {
  final String id;
  final String difficulty;
  final Duration duration;
  final bool completed;
  final int hintsUsed;
  final DateTime date;
  final int score;

  GameHistory({
    required this.id,
    required this.difficulty,
    required this.duration,
    required this.completed,
    required this.hintsUsed,
    required this.date,
    required this.score,
  });

  String get formattedDuration {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes}m ${seconds}s';
  }
}
