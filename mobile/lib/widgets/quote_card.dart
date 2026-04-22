import 'package:flutter/material.dart';

import '../features/quotes/domain/quote.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    super.key,
    required this.quote,
    this.showBack = false,
    this.onPlay,
    this.onShadow,
  });

  final Quote quote;
  final bool showBack;
  final VoidCallback? onPlay;
  final VoidCallback? onShadow;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return RepaintBoundary(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(quote.text, style: textTheme.headlineSmall),
                const SizedBox(height: 12),
                Text(
                  quote.ipa,
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.blueGrey,
                    fontFamily: 'monospace',
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 180),
                  switchInCurve: Curves.easeOutCubic,
                  switchOutCurve: Curves.easeInCubic,
                  child: showBack
                      ? Column(
                          key: const ValueKey('quote-back-side'),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            Text(
                              quote.translation,
                              style: textTheme.titleMedium?.copyWith(fontStyle: FontStyle.italic),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                FilledButton.icon(
                                  onPressed: onPlay,
                                  icon: const Icon(Icons.play_arrow),
                                  label: const Text('Play'),
                                ),
                                const SizedBox(width: 12),
                                OutlinedButton.icon(
                                  onPressed: onShadow,
                                  icon: const Icon(Icons.mic),
                                  label: const Text('Shadow'),
                                ),
                              ],
                            ),
                          ],
                        )
                      : const SizedBox(key: ValueKey('quote-front-side')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
