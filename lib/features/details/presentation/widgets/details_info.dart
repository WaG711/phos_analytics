import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/entities/chart_data.dart';
import 'bar_chart_details.dart';
import 'quick_selection_buttons.dart';

class DetailsInfo extends StatefulWidget {
  final ChartData chartData;
  const DetailsInfo({super.key, required this.chartData});

  @override
  State<DetailsInfo> createState() => _DetailsInfoState();
}

class _DetailsInfoState extends State<DetailsInfo> {
  DateTimeRange? selectedDateRange;

  set selectedRange(DateTimeRange range) {
    setState(() {
      selectedDateRange = range;
    });
  }

  @override
  Widget build(BuildContext context) {
    String dateText =
        selectedDateRange == null
            ? "Выбрать даты"
            : "${DateFormat('dd.MM.yyyy').format(selectedDateRange!.start)} - ${DateFormat('dd.MM.yyyy').format(selectedDateRange!.end)}";

    return Column(
      children: [
        ElevatedButton(onPressed: _pickDateRange, child: Text(dateText)),
        const SizedBox(height: 10),
        QuickSelectionButtons(
          onRangeSelected: (range) {
            selectedRange = range;
          },
        ),
        const SizedBox(height: 20),
        Expanded(child: BarChartDetails(chartPoints: widget.chartData.points)),
      ],
    );
  }

  Future<void> _pickDateRange() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
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
}
