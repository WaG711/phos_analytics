import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/chart_period.dart';
import '../bloc/details_bloc.dart';
import '../bloc/details_event.dart';
import 'period_chip.dart';

class QuickPeriodSelector extends StatelessWidget {
  final String categoryId;

  const QuickPeriodSelector({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterChip(
            label: Text("Прогноз"),
            onSelected: (_) {
              context.read<DetailsBloc>().add(
                DetailsForecast(categoryId: categoryId),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 8),
          PeriodChip(
            label: "Неделя",
            period: ChartPeriod.week,
            categoryId: categoryId,
          ),
          const SizedBox(width: 8),
          PeriodChip(
            label: "Месяц",
            period: ChartPeriod.month,
            categoryId: categoryId,
          ),
          const SizedBox(width: 8),
          PeriodChip(
            label: "Квартал",
            period: ChartPeriod.quarter,
            categoryId: categoryId,
          ),
          const SizedBox(width: 8),
          PeriodChip(
            label: "Полгода",
            period: ChartPeriod.halfYear,
            categoryId: categoryId,
          ),
          const SizedBox(width: 8),
          PeriodChip(
            label: "Год",
            period: ChartPeriod.year,
            categoryId: categoryId,
          ),
        ],
      ),
    );
  }
}
