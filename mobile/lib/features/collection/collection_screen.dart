import 'package:flutter/material.dart';

import 'widgets/collection_list.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(tabs: [Tab(text: 'Saved'), Tab(text: 'Playlists')]),
          Expanded(
            child: TabBarView(
              children: [
                CollectionList(emptyText: 'No saved quotes yet', actions: const ['Save quote', 'Remove quote']),
                CollectionList(
                  emptyText: 'No playlists yet',
                  actions: const ['Create playlist', 'Play shadow mode'],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
