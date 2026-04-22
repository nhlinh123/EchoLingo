import 'package:flutter/material.dart';

import '../../shared/constants/app_spacing.dart';
import '../../widgets/quote_card.dart';
import '../quotes/application/quote_service.dart';
import 'widgets/learn_filters.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  static final QuoteService _quoteService = QuoteService();

  String selectedTopic = 'all';
  String selectedLevel = 'all';
  int current = 0;

  @override
  Widget build(BuildContext context) {
    final filtered = _quoteService.filteredQuotes(topic: selectedTopic, level: selectedLevel);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          LearnFilters(
            selectedTopic: selectedTopic,
            selectedLevel: selectedLevel,
            onTopicChanged: (value) => setState(() {
              selectedTopic = value;
              current = 0;
            }),
            onLevelChanged: (value) => setState(() {
              selectedLevel = value;
              current = 0;
            }),
          ),
          AppSpacing.s16,
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,
              child: filtered.isEmpty
                  ? const Center(
                      key: ValueKey('empty-filtered-quotes'),
                      child: Text('No quotes for selected filters'),
                    )
                  : QuoteCard(
                      key: ValueKey(filtered[current % filtered.length].id),
                      quote: filtered[current % filtered.length],
                      showBack: true,
                    ),
            ),
          ),
          AppSpacing.s12,
          FilledButton(
            onPressed: filtered.isEmpty ? null : () => setState(() => current += 1),
            child: const Text('Next quote'),
          ),
        ],
      ),
    );
  }
}
