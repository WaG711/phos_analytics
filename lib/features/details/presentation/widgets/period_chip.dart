import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/chart_period.dart';
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return FilterChip(
      label: Text(label, style: theme.textTheme.bodyMedium),
      onSelected: (_) {
        context.read<DetailsBloc>().add(
          DetailsQuickPeriodSelected(categoryId: categoryId, dateRange: period),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      selectedColor: colorScheme.primaryContainer,
      backgroundColor: colorScheme.surface,
      selectedShadowColor: colorScheme.primary.withValues(alpha: 0.3),
      shadowColor: colorScheme.outline.withValues(alpha: 0.1),
    );
  }
}
