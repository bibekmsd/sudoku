import 'package:flutter/material.dart';
import 'package:practise_flutter/GameLevel/easy_level.dart';
import 'package:practise_flutter/GameLevel/medium_level.dart';
import 'package:practise_flutter/GameLevel/hard_level.dart';
import 'package:practise_flutter/GameLevel/impossible_level.dart';

class GameLevelNew extends StatelessWidget {
  const GameLevelNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Difficulty'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primary.withOpacity(0.1),
              theme.colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Choose Your Challenge',
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Select a difficulty level to begin',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: Column(
                    children: [
                      _buildLevelCard(
                        context,
                        'Easy',
                        'Perfect for beginners',
                        '3-5 minutes average',
                        Colors.green,
                        Icons.sentiment_satisfied,
                        () => Navigator.push(context, MaterialPageRoute(builder: (context) => EasyScreen())),
                      ),
                      const SizedBox(height: 16),
                      _buildLevelCard(
                        context,
                        'Medium',
                        'Good for casual players',
                        '5-10 minutes average',
                        Colors.orange,
                        Icons.sentiment_neutral,
                        () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  MediumScreen())),
                      ),
                      const SizedBox(height: 16),
                      _buildLevelCard(
                        context,
                        'Hard',
                        'For experienced players',
                        '10-20 minutes average',
                        Colors.red,
                        Icons.sentiment_dissatisfied,
                        () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  HardScreen())),
                      ),
                      const SizedBox(height: 16),
                      _buildLevelCard(
                        context,
                        'Expert',
                        'Ultimate challenge',
                        '20+ minutes average',
                        Colors.purple,
                        Icons.psychology,
                        () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  ImpossibleScreen())),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLevelCard(
    BuildContext context,
    String title,
    String description,
    String timeEstimate,
    Color color,
    IconData icon,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      timeEstimate,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: theme.colorScheme.onSurfaceVariant,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
