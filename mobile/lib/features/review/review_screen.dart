import 'package:flutter/material.dart';

import '../../shared/constants/app_spacing.dart';
import '../../shared/widgets/app_section_title.dart';
import '../../widgets/quote_card.dart';
import '../quotes/application/quote_service.dart';
import 'widgets/review_action_bar.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  static final QuoteService _quoteService = QuoteService();

  int index = 0;
  bool showBack = false;
  String? lastAction;

  @override
  Widget build(BuildContext context) {
    final quotes = _quoteService.allQuotes();
    final quote = quotes[index % quotes.length];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AppSectionTitle('Review'),
          if (lastAction != null) ...[
            AppSpacing.s8,
            Text('Last action: $lastAction'),
          ],
          AppSpacing.s12,
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => showBack = !showBack),
              child: QuoteCard(quote: quote, showBack: showBack, onPlay: () {}, onShadow: () {}),
            ),
          ),
          AppSpacing.s12,
          ReviewActionBar(onAction: _onActionSelected),
        ],
      ),
    );
  }

  void _onActionSelected(String label) {
    setState(() {
      lastAction = label;
      showBack = false;
      index += 1;
    });
  }
}
