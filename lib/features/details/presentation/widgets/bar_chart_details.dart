import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/chart_point_e_d.dart';

class BarChartDetails extends StatelessWidget {
  final List<ChartPointED> chartPoints;

  const BarChartDetails({super.key, required this.chartPoints});

  @override
  Widget build(BuildContext context) {
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
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                final chartPoint = chartPoints[value.toInt()];
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    chartPoint.date,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                );
              },
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
            chartPoints.asMap().entries.map((entry) {
              final int index = entry.key;
              final ChartPointED chartPoint = entry.value;
              return BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: chartPoint.value,
                    width: 14,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(6),
                      bottom: Radius.zero,
                    ),
                    gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlueAccent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: chartPoints
                          .map((e) => e.value)
                          .reduce((a, b) => a > b ? a : b),
                      color: Colors.blue[50],
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
                rod.toY.toString(),
                TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              );
            },
            getTooltipColor: (BarChartGroupData group) => Colors.white,
            tooltipBorder: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
