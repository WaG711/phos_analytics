import 'package:flutter/material.dart';

import '../../domain/entities/chart_data_e_h.dart';
import 'line_chart_card.dart';
import 'pie_chart_card.dart';

class HomeCards extends StatelessWidget {
  final List<ChartDataEH> chartDataList;
  const HomeCards({super.key, required this.chartDataList});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: PieChartCard(value1: 10, value2: 3, value3: 2, value4: 4),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.8,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  LineChartCard(chartData: chartDataList[index]),
              childCount: chartDataList.length,
            ),
          ),
        ),
      ],
    );
  }
}
