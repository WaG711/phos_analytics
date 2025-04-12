import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../details/presentation/bloc/details_bloc.dart';
import '../../../../details/presentation/bloc/details_event.dart';
import '../../../domain/entities/chart_data_e_h.dart';

class BarChartHome extends StatelessWidget {
  final ChartDataEH chartData;

  const BarChartHome({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF6200EE);
    const outlineColor = Color(0x1A000000);
    const textColor = Color(0x99000000);

    return GestureDetector(
      onTap: () {
        context.read<DetailsBloc>().add(
          DetailsLoad(categoryId: chartData.categoryId),
        );
        Navigator.pushNamed(
          context,
          "/details",
          arguments: chartData.categoryId,
        );
      },
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          minY: chartData.points.map((e) => e.value).reduce(min),
          maxY: chartData.points.map((e) => e.value).reduce(max),
          groupsSpace: 6,
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            show: true,
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 16,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index >= 0 && index < chartData.points.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        chartData.points[index].date,
                        style: const TextStyle(fontSize: 10, color: textColor),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine:
                (value) => const FlLine(color: outlineColor, strokeWidth: 1),
          ),
          borderData: FlBorderData(show: false),
          barGroups:
              chartData.points.asMap().entries.map((entry) {
                final index = entry.key;
                final point = entry.value;
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: point.value,
                      color: primaryColor,
                      width: 10,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(4),
                      ),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY:
                            chartData.points.map((e) => e.value).reduce(max) *
                            1.2,
                        color: const Color(0x1A6200EE),
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
