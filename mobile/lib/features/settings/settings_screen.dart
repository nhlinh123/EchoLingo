import 'package:flutter/material.dart';

import 'widgets/settings_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const ListView(
        padding: EdgeInsets.all(16),
        children: [
          SettingsSection(
            title: 'Learning',
            items: ['Daily new limit', 'Review reminder time', 'Auto play audio', 'Show IPA by default'],
          ),
          SettingsSection(title: 'Audio', items: ['Voice accent', 'Playback speed', 'Loop count']),
          SettingsSection(title: 'SRS', items: ['Enable SRS', 'Reset progress']),
          SettingsSection(title: 'Notification', items: ['Daily reminder']),
          SettingsSection(title: 'App', items: ['Dark mode', 'Language']),
        ],
      ),
    );
  }
}
