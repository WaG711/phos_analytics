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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

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
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant.withValues(
                            alpha: 0.6 * 255,
                          ),
                        ),
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
                (value) => FlLine(
                  color: colorScheme.outline.withValues(alpha: 0.1 * 255),
                  strokeWidth: 1,
                ),
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
                      color: colorScheme.primary,
                      width: 10,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(6),
                      ),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY:
                            chartData.points.map((e) => e.value).reduce(max) *
                            1.2,
                        color: colorScheme.primary.withValues(alpha: 0.1 * 255),
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
