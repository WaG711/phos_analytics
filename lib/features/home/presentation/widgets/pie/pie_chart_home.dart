import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'pie_chart_card.dart';

class PieChartHome extends StatelessWidget {
  final List<ChartSectionData> chartData;
  final double total;
  const PieChartHome({super.key, required this.chartData, required this.total});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        borderData: FlBorderData(show: false),
        sectionsSpace: 5,
        centerSpaceRadius: 40,
        sections:
            chartData.map((data) {
              return PieChartSectionData(
                value: (data.value / total) * 100,
                color: data.color,
                title: '',
                radius: 40,
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
