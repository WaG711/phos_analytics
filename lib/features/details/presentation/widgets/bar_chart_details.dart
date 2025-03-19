import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:phos_analytics/core/entities/chart_point.dart';

class BarChartDetails extends StatelessWidget {
  final List<ChartPoint> chartPoints;

  const BarChartDetails({super.key, required this.chartPoints});

  @override
  Widget build(BuildContext context) {
    final List<BarChartGroupData> data = [
      BarChartGroupData(
        x: 0,
        barRods: [BarChartRodData(toY: 1, color: Colors.blue)],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [BarChartRodData(toY: 2, color: Colors.blue)],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [BarChartRodData(toY: 1, color: Colors.blue)],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [BarChartRodData(toY: 3, color: Colors.blue)],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [BarChartRodData(toY: 2, color: Colors.blue)],
      ),
    ];

    return BarChart(
      BarChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget:
                  (value, meta) => Text(
                    value.toInt().toString(),
                    style: TextStyle(fontSize: 12),
                  ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget:
                  (value, meta) =>
                      Text("X${value.toInt()}", style: TextStyle(fontSize: 12)),
            ),
          ),
        ),
        borderData: FlBorderData(show: true),
        barGroups: data,
      ),
    );
  }
}
