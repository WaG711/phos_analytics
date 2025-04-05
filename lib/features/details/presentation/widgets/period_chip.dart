import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/chart_period.dart';
import '../bloc/details_bloc.dart';
import '../bloc/details_event.dart';

class PeriodChip extends StatelessWidget {
  final String label;
  final ChartPeriod period;
  final String categoryId;

  const PeriodChip({
    super.key,
    required this.label,
    required this.period,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      onSelected: (_) {
        context.read<DetailsBloc>().add(
          DetailsQuickPeriodSelected(categoryId: categoryId, dateRange: period),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
