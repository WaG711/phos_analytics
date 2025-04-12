import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/chart_point_e_d.dart';

class LineChartDetails extends StatelessWidget {
  final List<ChartPointED> chartPoints;

  const LineChartDetails({super.key, required this.chartPoints});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: chartPoints.length - 1,
        minY: chartPoints.map((e) => e.value).reduce(min),
        maxY: chartPoints.map((e) => e.value).reduce(max),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          getDrawingHorizontalLine:
              (value) => FlLine(
                color: colors.outline.withValues(alpha: 0.2 * 255),
                strokeWidth: 1,
              ),
        ),
        titlesData: FlTitlesData(
          show: true,
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 45,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    formatNumber(value),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurface.withValues(alpha: 0.6 * 255),
                    ),
                    textAlign: TextAlign.right,
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize:
                  chartPoints.any((point) => point.date.contains("\n"))
                      ? 35
                      : 21,
              interval: (chartPoints.length / 4).floorToDouble().clamp(
                1,
                double.infinity,
              ),
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= 0 && value.toInt() < chartPoints.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      chartPoints[value.toInt()].date,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurface.withValues(alpha: 0.6 * 255),
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots:
                chartPoints.asMap().entries.map((entry) {
                  return FlSpot(entry.key.toDouble(), entry.value.value);
                }).toList(),
            isCurved: false,
            color: colors.primary,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter:
                  (spot, percent, barData, index) => FlDotCirclePainter(
                    radius: 4,
                    color: colors.primary,
                    strokeWidth: 2,
                    strokeColor: colors.surface,
                  ),
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  colors.primary.withValues(alpha: 0.3 * 255),
                  colors.primary.withValues(alpha: 0.05 * 255),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            shadow: BoxShadow(
              color: colors.primary.withValues(alpha: 0.2 * 255),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipRoundedRadius: 8,
            tooltipPadding: const EdgeInsets.all(8),
            tooltipMargin: 8,
            getTooltipItems: (List<LineBarSpot> spots) {
              return spots.map((spot) {
                return LineTooltipItem(
                  spot.y.toStringAsFixed(3),
                  TextStyle(
                    color: colors.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList();
            },
            getTooltipColor: (LineBarSpot spot) => colors.primaryContainer,
            tooltipBorder: BorderSide(
              color: colors.outline.withValues(alpha: 0.2 * 255),
            ),
          ),
        ),
      ),
    );
  }

  String formatNumber(double value) {
    if (value >= 1e9) {
      return '${(value / 1e9).toStringAsFixed(2)}B';
    } else if (value >= 1e6) {
      return '${(value / 1e6).toStringAsFixed(2)}M';
    } else if (value >= 1e3) {
      return '${(value / 1e3).toStringAsFixed(2)}K';
    } else {
      return value.toStringAsFixed(2);
    }
  }
}
