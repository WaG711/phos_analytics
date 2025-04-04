import 'package:flutter/material.dart';

import 'pie_chart_card.dart';
import 'pie_chart_legend_item.dart';

class PieChartLegend extends StatelessWidget {
  final List<ChartSectionData> chartData;
  final double total;
  final int? touchedIndex;
  final ValueChanged<int?> onItemTapped;
  const PieChartLegend({
    super.key,
    required this.chartData,
    required this.total,
    this.touchedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          chartData.asMap().entries.map((entry) {
            final index = entry.key;
            final data = entry.value;
            final isTouched = index == touchedIndex;
            final percentage = (data.value / total) * 100;

            return PieChartLegendItem(
              color: data.color,
              title: data.title,
              percentage: percentage,
              isTouched: isTouched,
              onTap: () => onItemTapped(isTouched ? null : index),
            );
          }).toList(),
    );
  }
}
