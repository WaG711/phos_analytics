import 'package:flutter/material.dart';

import '../../../../core/entities/chart_data.dart';
import 'last_card.dart';
import 'metric_card.dart';

class HomeCards extends StatelessWidget {
  final List<ChartData> chartDataList;
  const HomeCards({super.key, required this.chartDataList});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              color: Colors.amber,
              height: 65,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: chartDataList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: LastCard(chartData: chartDataList[index]),
                  );
                },
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(5.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return MetricCard(chartData: chartDataList[index]);
            }, childCount: chartDataList.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              childAspectRatio: 0.75,
            ),
          ),
        ),
      ],
    );
  }
}
