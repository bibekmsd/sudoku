import 'package:flutter/material.dart';
import 'package:practise_flutter/Themes/theme_provider.dart';
import 'package:practise_flutter/Pages_Buttom/user_profile_page.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;
  bool _hintsEnabled = true;
  bool _autoCheckErrors = false;
  String _difficulty = 'Medium';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: const SizedBox.shrink(),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserProfilePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theme Section
            _buildSectionCard(
              context,
              'Appearance',
              Icons.palette,
              [
                SwitchListTile(
                  title: const Text('Dark Mode'),
                  subtitle: const Text('Switch between light and dark theme'),
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                  secondary: Icon(
                    themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Game Settings
            _buildSectionCard(
              context,
              'Game Settings',
              Icons.sports_esports,
              [
                ListTile(
                  title: const Text('Default Difficulty'),
                  subtitle: Text('Current: $_difficulty'),
                  leading: Icon(Icons.speed, color: theme.colorScheme.primary),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showDifficultyDialog(context),
                ),
                SwitchListTile(
                  title: const Text('Show Hints'),
                  subtitle: const Text('Allow hint button during gameplay'),
                  value: _hintsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _hintsEnabled = value;
                    });
                  },
                  secondary: Icon(Icons.lightbulb, color: theme.colorScheme.primary),
                ),
                SwitchListTile(
                  title: const Text('Auto-check Errors'),
                  subtitle: const Text('Highlight mistakes automatically'),
                  value: _autoCheckErrors,
                  onChanged: (value) {
                    setState(() {
                      _autoCheckErrors = value;
                    });
                  },
                  secondary: Icon(Icons.error_outline, color: theme.colorScheme.primary),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Audio & Haptics
            _buildSectionCard(
              context,
              'Audio & Haptics',
              Icons.volume_up,
              [
                SwitchListTile(
                  title: const Text('Sound Effects'),
                  subtitle: const Text('Play sounds during gameplay'),
                  value: _soundEnabled,
                  onChanged: (value) {
                    setState(() {
                      _soundEnabled = value;
                    });
                  },
                  secondary: Icon(Icons.volume_up, color: theme.colorScheme.primary),
                ),
                SwitchListTile(
                  title: const Text('Vibration'),
                  subtitle: const Text('Haptic feedback for interactions'),
                  value: _vibrationEnabled,
                  onChanged: (value) {
                    setState(() {
                      _vibrationEnabled = value;
                    });
                  },
                  secondary: Icon(Icons.vibration, color: theme.colorScheme.primary),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Data & Privacy
            _buildSectionCard(
              context,
              'Data & Privacy',
              Icons.security,
              [
                ListTile(
                  title: const Text('Reset Statistics'),
                  subtitle: const Text('Clear all game history and stats'),
                  leading: Icon(Icons.refresh, color: theme.colorScheme.error),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showResetDialog(context),
                ),
                ListTile(
                  title: const Text('Export Data'),
                  subtitle: const Text('Download your game data'),
                  leading: Icon(Icons.download, color: theme.colorScheme.primary),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Implement data export
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Data export feature coming soon!')),
                    );
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // About
            _buildSectionCard(
              context,
              'About',
              Icons.info,
              [
                ListTile(
                  title: const Text('Version'),
                  subtitle: const Text('1.0.0'),
                  leading: Icon(Icons.info_outline, color: theme.colorScheme.primary),
                ),
                ListTile(
                  title: const Text('Rate App'),
                  subtitle: const Text('Leave a review on the App Store'),
                  leading: Icon(Icons.star, color: theme.colorScheme.primary),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Implement app rating
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Thank you for your support!')),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Contact Support'),
                  subtitle: const Text('Get help or report issues'),
                  leading: Icon(Icons.support_agent, color: theme.colorScheme.primary),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Implement support contact
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Support contact feature coming soon!')),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, String title, IconData icon, List<Widget> children) {
    final theme = Theme.of(context);
    
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Icon(icon, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          ...children,
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void _showDifficultyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Difficulty'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ['Easy', 'Medium', 'Hard', 'Expert'].map((level) {
              return RadioListTile<String>(
                title: Text(level),
                value: level,
                groupValue: _difficulty,
                onChanged: (String? value) {
                  setState(() {
                    _difficulty = value!;
                  });
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _showResetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reset Statistics'),
          content: const Text('Are you sure you want to reset all your game statistics? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Statistics reset successfully!')),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
              child: const Text('Reset'),
            ),
          ],
        );
      },
    );
  }
}
