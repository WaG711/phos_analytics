import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'pie_chart_card.dart';

class PieChartHome extends StatelessWidget {
  final List<ChartSectionData> chartData;
  final double total;
  final int? touchedIndex;
  final Animation<double> radiusAnimation;
  final ValueChanged<int?> onSectionTouched;
  const PieChartHome({
    super.key,
    required this.chartData,
    required this.total,
    this.touchedIndex,
    required this.radiusAnimation,
    required this.onSectionTouched,
  });

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        borderData: FlBorderData(show: false),
        sectionsSpace: 2,
        centerSpaceRadius: 0,
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            if (!event.isInterestedForInteractions ||
                pieTouchResponse == null ||
                pieTouchResponse.touchedSection == null) {
              onSectionTouched(null);
              return;
            }
            onSectionTouched(
              pieTouchResponse.touchedSection!.touchedSectionIndex,
            );
          },
        ),
        sections:
            chartData.asMap().entries.map((entry) {
              final index = entry.key;
              final data = entry.value;
              final isTouched = index == touchedIndex;
              final double radius = isTouched ? radiusAnimation.value : 75;

              return PieChartSectionData(
                value: (data.value / total) * 100,
                color: data.color,
                title: '',
                radius: radius,
                borderSide: const BorderSide(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  width: 2,
                ),
              );
            }).toList(),
      ),
    );
  }
}
