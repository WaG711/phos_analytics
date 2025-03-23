import 'package:flutter/material.dart';

import '../../../../core/entities/chart_data.dart';
import 'line_chart_home.dart';

class MetricCard extends StatelessWidget {
  final ChartData chartData;

  const MetricCard({super.key, required this.chartData});

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
            Text(chartData.title),
            SizedBox(
              height: 180,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 10.0,
                ),
                child: LineChartHome(chartPoints: chartData.points),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
