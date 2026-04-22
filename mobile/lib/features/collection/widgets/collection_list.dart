import 'package:flutter/material.dart';

class CollectionList extends StatelessWidget {
  const CollectionList({super.key, required this.emptyText, required this.actions});

  final String emptyText;
  final List<String> actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emptyText),
          const SizedBox(height: 16),
          ...actions.map(
            (action) => ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: Text(action),
            ),
          ),
        ],
      ),
    );
  }
}
