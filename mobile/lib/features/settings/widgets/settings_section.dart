import 'package:flutter/material.dart';

import '../../../shared/widgets/app_section_title.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key, required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: AppSectionTitle(title),
        ),
        ...items.map(
          (item) => Card(
            child: ListTile(
              title: Text(item),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
        ),
      ],
    );
  }
}
