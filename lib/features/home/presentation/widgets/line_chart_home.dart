import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/chart_data_e_h.dart';

class LineChartHome extends StatelessWidget {
  final ChartDataEH chartData;

  const LineChartHome({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF6200EE);
    const surfaceColor = Color(0xFFFFFFFF);
    const outlineColor = Color(0x1A000000);
    const textColor = Color(0x99000000);
    const shadowColor = Color(0x4D6200EE);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: chartData);
      },
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: (chartData.points.length - 1).toDouble(),
          minY: chartData.points.map((e) => e.value).reduce(min),
          maxY: chartData.points.map((e) => e.value).reduce(max) * 1.05,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine:
                (value) => const FlLine(color: outlineColor, strokeWidth: 1),
          ),
          titlesData: FlTitlesData(
            show: true,
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false, reservedSize: 24),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 16,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index >= 0 && index < chartData.points.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        chartData.points[index].date,
                        style: const TextStyle(fontSize: 10, color: textColor),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots:
                  chartData.points
                      .asMap()
                      .entries
                      .map(
                        (entry) =>
                            FlSpot(entry.key.toDouble(), entry.value.value),
                      )
                      .toList(),
              isCurved: false,
              color: primaryColor,
              barWidth: 3,
              isStrokeCapRound: true,
              shadow: const BoxShadow(
                color: shadowColor,
                blurRadius: 8,
                spreadRadius: 2,
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: const LinearGradient(
                  colors: [Color(0x4D6200EE), Color(0x1A6200EE)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              dotData: FlDotData(
                show: true,
                getDotPainter:
                    (spot, percent, barData, index) => FlDotCirclePainter(
                      radius: 4,
                      color: primaryColor,
                      strokeWidth: 2,
                      strokeColor: surfaceColor,
                    ),
              ),
            ),
          ],
          lineTouchData: const LineTouchData(enabled: false),
        ),
      ),
    );
  }
}
