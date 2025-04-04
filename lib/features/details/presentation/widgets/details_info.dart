import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/chart_data_e_d.dart';
import '../bloc/details_bloc.dart';
import '../bloc/details_event.dart';
import 'bar_chart_details.dart';
import 'quick_selection_buttons.dart';

class DetailsInfo extends StatelessWidget {
  final ChartDataED chartData;
  final DateTimeRange dateRange;
  const DetailsInfo({
    super.key,
    required this.chartData,
    required this.dateRange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            DateTimeRange? picked = await showDateRangePicker(
              context: context,
              firstDate: DateTime(2025),
              lastDate: DateTime.now(),
              initialDateRange: dateRange,
              helpText: "Выберите период",
              cancelText: "Отмена",
              confirmText: "Выбрать",
            );

            if (picked != null) {
              context.read<DetailsBloc>().add(
                DetailsLoad(
                  categoryId: chartData.categoryId,
                  dateRange: picked,
                ),
              );
            }
          },
          child: Text(
            "${DateFormat('dd.MM.yyyy').format(dateRange.start)} - ${DateFormat('dd.MM.yyyy').format(dateRange.end)}",
          ),
        ),
        const SizedBox(height: 10),
        QuickSelectionButtons(categoryId: chartData.categoryId),
        const SizedBox(height: 20),
        Expanded(child: BarChartDetails(chartPoints: chartData.points)),
      ],
    );
  }
}
