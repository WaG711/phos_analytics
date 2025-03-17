import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  DateTimeRange? selectedDateRange;

  void _setDateRange(DateTime start, DateTime end) {
    setState(() {
      selectedDateRange = DateTimeRange(start: start, end: end);
    });
  }

  Future<void> _pickDateRange() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDateRange: selectedDateRange,
      helpText: "Выберите период",
      cancelText: "Отмена",
      confirmText: "Выбрать",
    );

    if (picked != null) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String dateText =
        selectedDateRange == null
            ? "Выбрать даты"
            : "${DateFormat('dd.MM.yyyy').format(selectedDateRange!.start)} - ${DateFormat('dd.MM.yyyy').format(selectedDateRange!.end)}";

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueAccent, title: Text("Card 1")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(onPressed: _pickDateRange, child: Text(dateText)),
            const SizedBox(height: 10),
            _buildQuickSelectionButtons(),
            const SizedBox(height: 20),
            Expanded(child: _buildLineChart()),
          ],
        ),
      ),
    );
  }

  void _selectQuickRange(String period) {
    DateTime now = DateTime.now();
    DateTime start;

    switch (period) {
      case 'Неделя':
        start = now.subtract(Duration(days: now.weekday - 1));
        break;
      case 'Месяц':
        start = DateTime(now.year, now.month, 1);
        break;
      case 'Квартал':
        int quarter = (now.month - 1) ~/ 3 + 1;
        start = DateTime(now.year, (quarter - 1) * 3 + 1, 1);
        break;
      case 'Полгода':
        int half = now.month <= 6 ? 1 : 2;
        start = DateTime(now.year, half == 1 ? 1 : 7, 1);
        break;
      case 'Год':
        start = DateTime(now.year, 1, 1);
        break;
      default:
        return;
    }

    _setDateRange(start, now);
  }

  Widget _buildQuickSelectionButtons() {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      alignment: WrapAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => _selectQuickRange('Неделя'),
          child: Text("Неделя"),
        ),
        ElevatedButton(
          onPressed: () => _selectQuickRange('Месяц'),
          child: Text("Месяц"),
        ),
        ElevatedButton(
          onPressed: () => _selectQuickRange('Квартал'),
          child: Text("Квартал"),
        ),
        ElevatedButton(
          onPressed: () => _selectQuickRange('Полгода'),
          child: Text("Полгода"),
        ),
        ElevatedButton(
          onPressed: () => _selectQuickRange('Год'),
          child: Text("Год"),
        ),
      ],
    );
  }

  Widget _buildLineChart() {
    final List<FlSpot> data = [
      FlSpot(0, 1),
      FlSpot(1, 2),
      FlSpot(2, 1),
      FlSpot(3, 3),
      FlSpot(4, 2),
    ];

    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 30),
          ),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: data,
            isCurved: false,
            color: Colors.blue,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
