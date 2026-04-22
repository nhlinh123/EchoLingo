import 'package:flutter/material.dart';

import '../../shared/constants/app_spacing.dart';
import '../../shared/widgets/app_section_title.dart';
import '../../widgets/quote_card.dart';
import '../quotes/application/quote_service.dart';
import 'widgets/home_stats_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final QuoteService _quoteService = QuoteService();

  @override
  Widget build(BuildContext context) {
    final quote = _quoteService.dailyQuote();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        AppSectionTitle('Hello, Learner 👋'),
        AppSpacing.s16,
        const HomeStatsRow(),
        AppSpacing.s20,
        FilledButton(onPressed: () {}, child: const Text('Start today review')),
        AppSpacing.s20,
        const AppSectionTitle('Daily quote'),
        AppSpacing.s8,
        QuoteCard(quote: quote, onPlay: () {}),
      ],
    );
  }
}
