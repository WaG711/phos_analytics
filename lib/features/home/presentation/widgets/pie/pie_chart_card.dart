import 'package:flutter/material.dart';
import 'package:phos_analytics/features/home/presentation/widgets/pie/pie_chart_home.dart';
import 'package:phos_analytics/features/home/presentation/widgets/pie/pie_chart_legend.dart';

import '../../../domain/entities/pie_chart_section.dart';

class PieChartCard extends StatelessWidget {
  final List<PieChartSection> pieChartSectionList;
  final double total;
  const PieChartCard({
    super.key,
    required this.pieChartSectionList,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Результат за прошлый месяц',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: PieChartHome(
                      pieChart: pieChartSectionList,
                      total: total,
                    ),
                  ),
                  PieChartLegend(chartData: pieChartSectionList, total: total),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
