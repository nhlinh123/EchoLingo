import 'package:flutter/material.dart';

import '../../../shared/constants/app_spacing.dart';

class LearnFilters extends StatelessWidget {
  const LearnFilters({
    super.key,
    required this.selectedTopic,
    required this.selectedLevel,
    required this.onTopicChanged,
    required this.onLevelChanged,
  });

  final String selectedTopic;
  final String selectedLevel;
  final ValueChanged<String> onTopicChanged;
  final ValueChanged<String> onLevelChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            value: selectedTopic,
            decoration: const InputDecoration(labelText: 'Topic'),
            items: const [
              DropdownMenuItem(value: 'all', child: Text('All')),
              DropdownMenuItem(value: 'motivation', child: Text('Motivation')),
              DropdownMenuItem(value: 'learning', child: Text('Learning')),
              DropdownMenuItem(value: 'habit', child: Text('Habit')),
            ],
            onChanged: (value) => onTopicChanged(value ?? 'all'),
          ),
        ),
        AppSpacing.h12,
        Expanded(
          child: DropdownButtonFormField<String>(
            value: selectedLevel,
            decoration: const InputDecoration(labelText: 'Level'),
            items: const [
              DropdownMenuItem(value: 'all', child: Text('All')),
              DropdownMenuItem(value: 'A2', child: Text('A2')),
              DropdownMenuItem(value: 'B1', child: Text('B1')),
            ],
            onChanged: (value) => onLevelChanged(value ?? 'all'),
          ),
        ),
      ],
    );
  }
}
