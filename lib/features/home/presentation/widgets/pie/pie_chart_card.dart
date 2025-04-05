import 'package:flutter/material.dart';
import 'package:phos_analytics/features/home/presentation/widgets/pie/pie_chart_home.dart';
import 'package:phos_analytics/features/home/presentation/widgets/pie/pie_chart_legend.dart';

class PieChartCard extends StatelessWidget {
  final double value1;
  final double value2;
  final double value3;
  final double value4;

  const PieChartCard({
    super.key,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
  });

  @override
  Widget build(BuildContext context) {
    final total = value1 + value2 + value3 + value4;
    final chartData = [
      ChartSectionData(value: value1, color: Colors.blue, title: 'Выручка'),
      ChartSectionData(value: value2, color: Colors.green, title: 'EBITDA'),
      ChartSectionData(
        value: value3,
        color: Colors.orange,
        title: 'Чистая прибыль',
      ),
      ChartSectionData(value: value4, color: Colors.red, title: 'Чистый долг'),
    ];

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
                'Общее распределение',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: PieChartHome(chartData: chartData, total: total),
                  ),
                  PieChartLegend(chartData: chartData, total: total),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartSectionData {
  final double value;
  final Color color;
  final String title;

  const ChartSectionData({
    required this.value,
    required this.color,
    required this.title,
  });
}
