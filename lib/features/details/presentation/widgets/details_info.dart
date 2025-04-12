import 'package:flutter/material.dart';

import '../../domain/entities/chart_data_e_d.dart';
import 'line_chart_details.dart';
import 'quick_period_selector.dart';

class DetailsInfo extends StatelessWidget {
  final ChartDataED chartData;
  final DateTimeRange dateRange;

  const DetailsInfo({
    super.key,
    required this.chartData,
    required this.dateRange,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QuickPeriodSelector(categoryId: chartData.categoryId),
            Expanded(
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                    left: 8,
                    top: 8,
                    bottom: 10,
                  ),
                  child: LineChartDetails(chartPoints: chartData.points),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chartData.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    chartData.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colors.onSurface.withValues(alpha: 0.9 * 255),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
