import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/entities/chart_point.dart';

class LineChartHome extends StatelessWidget {
  final List<ChartPoint> chartPoints;

  const LineChartHome({super.key, required this.chartPoints});

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> data = [
      FlSpot(0, 1),
      FlSpot(1, 2),
      FlSpot(2, 1),
      FlSpot(3, 2),
      FlSpot(4, 3),
      FlSpot(5, 4),
      FlSpot(6, 2),
    ];

    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 30),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: data,
            isCurved: true,
            color: Colors.blue,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: true, color: Colors.blue[100]),
          ),
        ],
      ),
    );
  }
}
