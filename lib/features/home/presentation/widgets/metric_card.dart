import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MetricCard extends StatelessWidget {
  final String title;

  const MetricCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },
      child: Card(
        elevation: 1,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), SizedBox(height: 120, child: _buildLineChart()),
            ],
          ),
        ),
      );
  }

  Widget _buildLineChart() {
    final List<FlSpot> data = [
      FlSpot(0, 1),
      FlSpot(1, 2),
      FlSpot(2, 1),
      FlSpot(3, 2),
      FlSpot(4, 3),
      FlSpot(5, 4),
      FlSpot(6, 2),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: bottomTitleWidgets,
                  reservedSize: 30
                ),
              ),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: data,
                isCurved: true,
                color: Colors.blue,
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: FlDotData(show: true),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blue[100],
                ),
              ),
            ],
          ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Пн', style: style);
        break;
      case 1:
        text = const Text('Вт', style: style);
        break;
      case 2:
        text = const Text('Ср', style: style);
        break;
      case 3:
        text = const Text('Чт', style: style);
        break;
      case 4:
        text = const Text('Пт', style: style);
        break;
      case 5:
        text = const Text('Сб', style: style);
        break;
      case 6:
        text = const Text('Вс', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(meta: meta, space: 10, child: text);
  }
}
