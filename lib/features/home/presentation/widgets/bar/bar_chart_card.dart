import 'package:flutter/material.dart';

import '../../../domain/entities/chart_data_e_h.dart';
import 'bar_chart_home.dart';

class BarChartCard extends StatelessWidget {
  final ChartDataEH chartData;

  const BarChartCard({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    const gradientStartColor = Color(0x80E8DEF8);
    const gradientEndColor = Color(0x33E8DEF8);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap:
            () =>
                Navigator.pushNamed(context, "/details", arguments: chartData),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chartData.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [gradientStartColor, gradientEndColor],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        child: BarChartHome(chartData: chartData),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
