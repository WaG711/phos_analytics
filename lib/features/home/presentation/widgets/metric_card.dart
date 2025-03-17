import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MetricCard extends StatelessWidget {
  final String title;

  const MetricCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details");
      },
      child: Card(
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            SizedBox(height: 120, child: _buildLineChart()),
          ],
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
      FlSpot(5, 4),
      FlSpot(6, 2),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: LineChart(
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
      ),
    );
  }
}
