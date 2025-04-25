import 'package:flutter/material.dart';

import '../../domain/entities/chart_data_e_h.dart';
import '../../domain/entities/pie_chart_section.dart';
import 'bar/bar_chart_card.dart';
import 'pie/pie_chart_card.dart';

class HomeBase extends StatelessWidget {
  final List<ChartDataEH> chartDataList;
  final List<PieChartSection> pieChartSectionList;
  final double total;

  const HomeBase({
    super.key,
    required this.chartDataList,
    required this.pieChartSectionList,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: PieChartCard(
            pieChartSectionList: pieChartSectionList,
            total: total,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 0.8,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => BarChartCard(chartData: chartDataList[index]),
              childCount: chartDataList.length,
            ),
          ),
        ),
      ],
    );
  }
}
