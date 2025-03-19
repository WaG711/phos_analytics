import 'package:flutter/material.dart';

class QuickSelectionButtons extends StatelessWidget {
  final Function(DateTimeRange) onRangeSelected;

  const QuickSelectionButtons({super.key, required this.onRangeSelected});

  @override
  Widget build(BuildContext context) {
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

    onRangeSelected(DateTimeRange(start: start, end: now));
  }
}
