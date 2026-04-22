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
            onTopicChanged: (value) => setState(() => selectedTopic = value),
            onLevelChanged: (value) => setState(() => selectedLevel = value),
          ),
          AppSpacing.s16,
          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('No quotes for selected filters'))
                : QuoteCard(quote: filtered[current % filtered.length], showBack: true),
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
