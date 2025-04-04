import 'package:flutter/material.dart';
import 'package:phos_analytics/features/home/presentation/widgets/pie_chart_home.dart';
import 'package:phos_analytics/features/home/presentation/widgets/pie_chart_legend.dart';

class PieChartCard extends StatefulWidget {
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
  State<PieChartCard> createState() => _PieChartCardState();
}

class _PieChartCardState extends State<PieChartCard>
    with SingleTickerProviderStateMixin {
  int? touchedIndex;
  late AnimationController _animationController;
  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _radiusAnimation = Tween<double>(begin: 75, end: 85).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleSelection(int? index) {
    setState(() {
      touchedIndex = index;
      if (index != null) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double total =
        widget.value1 + widget.value2 + widget.value3 + widget.value4;

    final chartData = [
      ChartSectionData(
        value: widget.value1,
        color: Colors.blue,
        title: 'Выручка',
      ),
      ChartSectionData(
        value: widget.value2,
        color: Colors.green,
        title: 'EBITDA',
      ),
      ChartSectionData(
        value: widget.value3,
        color: Colors.orange,
        title: 'Чистая прибыль',
      ),
      ChartSectionData(
        value: widget.value4,
        color: Colors.red,
        title: 'Чистый долг',
      ),
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
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder:
                          (context, _) => PieChartHome(
                            chartData: chartData,
                            total: total,
                            touchedIndex: touchedIndex,
                            radiusAnimation: _radiusAnimation,
                            onSectionTouched: _handleSelection,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: PieChartLegend(
                      chartData: chartData,
                      total: total,
                      touchedIndex: touchedIndex,
                      onItemTapped: _handleSelection,
                    ),
                  ),
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
