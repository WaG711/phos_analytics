import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/chart_period.dart';
import '../bloc/details_bloc.dart';
import '../bloc/details_event.dart';

class QuickSelectionButtons extends StatelessWidget {
  final String categoryId;

  const QuickSelectionButtons({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      alignment: WrapAlignment.center,
      children: [
        _buildButton(context, "Неделя", ChartPeriod.week),
        _buildButton(context, "Месяц", ChartPeriod.month),
        _buildButton(context, "Квартал", ChartPeriod.quarter),
        _buildButton(context, "Полгода", ChartPeriod.halfYear),
        _buildButton(context, "Год", ChartPeriod.year),
      ],
    );
  }

  Widget _buildButton(
    BuildContext context,
    String label,
    ChartPeriod dateRange,
  ) {
    return ElevatedButton(
      onPressed: () {
        context.read<DetailsBloc>().add(
          DetailsQuickPeriodSelected(
            categoryId: categoryId,
            dateRange: dateRange,
          ),
        );
      },
      child: Text(label),
    );
  }
}
