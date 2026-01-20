class UserProfile {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final int gamesPlayed;
  final int gamesWon;
  final Duration bestTime;
  final int currentStreak;
  final int longestStreak;
  final DateTime joinDate;
  final String difficulty;
  final int level;
  final int xp;
  final List<Achievement> achievements;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.gamesPlayed,
    required this.gamesWon,
    required this.bestTime,
    required this.currentStreak,
    required this.longestStreak,
    required this.joinDate,
    required this.difficulty,
    required this.level,
    required this.xp,
    required this.achievements,
  });

  double get winRate => gamesPlayed > 0 ? (gamesWon / gamesPlayed) * 100 : 0;
  
  int get xpToNextLevel => ((level + 1) * 1000) - xp;
  
  double get levelProgress => xp % 1000 / 1000;

  UserProfile copyWith({
    String? name,
    String? email,
    String? avatarUrl,
    int? gamesPlayed,
    int? gamesWon,
    Duration? bestTime,
    int? currentStreak,
    int? longestStreak,
    String? difficulty,
    int? level,
    int? xp,
    List<Achievement>? achievements,
  }) {
    return UserProfile(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      gamesPlayed: gamesPlayed ?? this.gamesPlayed,
      gamesWon: gamesWon ?? this.gamesWon,
      bestTime: bestTime ?? this.bestTime,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      joinDate: joinDate,
      difficulty: difficulty ?? this.difficulty,
      level: level ?? this.level,
      xp: xp ?? this.xp,
      achievements: achievements ?? this.achievements,
    );
  }
}

class Achievement {
  final String id;
  final String title;
  final String description;
  final String iconPath;
  final DateTime unlockedDate;
  final bool isUnlocked;

  Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.unlockedDate,
    required this.isUnlocked,
  });
}
