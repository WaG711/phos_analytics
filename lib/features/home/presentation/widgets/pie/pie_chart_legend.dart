import 'package:flutter/material.dart';

import '../../../domain/entities/pie_chart_section.dart';

class PieChartLegend extends StatelessWidget {
  final List<PieChartSection> chartData;
  final double total;

  const PieChartLegend({
    super.key,
    required this.chartData,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          chartData.map((data) {
            final percentage = (data.value / total) * 100;

            return Container(
              padding: const EdgeInsets.only(right: 8, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: data.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(data.title, style: textTheme.bodyMedium),
                  const SizedBox(width: 8),
                  Text(
                    '${percentage.toStringAsFixed(1)}%',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant.withValues(
                        alpha: 0.6 * 255,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
