import 'dart:math';

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
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine:
              (value) => FlLine(
                color: Colors.grey.shade300,
                strokeWidth: 0.5,
                dashArray: [4, 4],
              ),
        ),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 20,
              getTitlesWidget:
                  (value, meta) => Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: Text(
                      value.toInt().toString(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget:
                  (value, meta) => Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "X${value.toInt()}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border(
            left: BorderSide(color: Colors.black, width: 1),
            bottom: BorderSide(color: Colors.black, width: 1),
          ),
        ),
        barGroups:
            data.map((entry) {
              double randomY = Random().nextDouble() * 10;
              return BarChartGroupData(
                x: entry.x.toInt(),
                barRods: [
                  BarChartRodData(
                    toY: randomY,
                    width: 14,
                    borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlueAccent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 10,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ],
              );
            }).toList(),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipRoundedRadius: 6,
            tooltipPadding: EdgeInsets.all(8),
            tooltipMargin: 8,
            tooltipHorizontalAlignment: FLHorizontalAlignment.center,
            tooltipHorizontalOffset: 0,
            maxContentWidth: 120,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                rod.toY.toStringAsFixed(1),
                TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              );
            },
            tooltipBorder: BorderSide(color: Colors.blueAccent, width: 2),
          ),
        ),
      ),
    );
  }
}
