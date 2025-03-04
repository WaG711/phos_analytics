import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const MetricCard({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(title), Expanded(child: _buildLineChart())],
        ),
      ),
    );
  }

  Widget _buildLineChart() {
    final List<FlSpot> data = [
      FlSpot(0, 1),
      FlSpot(1, 2),
      FlSpot(2, 1),
      FlSpot(3, 2),
      FlSpot(4, 3),
    ];

    return  LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: data,
              isCurved: true,
              color: Colors.blue,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      );
  }
}
