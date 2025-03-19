import 'package:flutter/material.dart';

import '../../../../core/entities/chart_data.dart';
import 'last_card.dart';
import 'metric_card.dart';

class HomeCards extends StatelessWidget {
  final List<ChartData> chartDataList;
  const HomeCards({super.key, required this.chartDataList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            color: Colors.amber,
            height: 65,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: LastCard(chartData: chartDataList[0]),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              childAspectRatio: 0.75,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return MetricCard(chartData: chartDataList[0]);
            },
          ),
        ),
      ],
    );
  }
}
