import 'package:flutter/material.dart';

import '../../../shared/constants/app_spacing.dart';
import '../../../shared/widgets/metric_tile.dart';

class HomeStatsRow extends StatelessWidget {
  const HomeStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: MetricTile(label: 'Streak', value: '5')),
        AppSpacing.h12,
        Expanded(child: MetricTile(label: 'Mastered', value: '42')),
        AppSpacing.h12,
        Expanded(child: MetricTile(label: 'Due', value: '8')),
      ],
    );
  }
}
