import 'package:flutter/material.dart';

import '../../domain/entities/chart_period.dart';

abstract class DetailsEvent {}

class DetailsLoad extends DetailsEvent {
  final String categoryId;
  final DateTimeRange? dateRange;

  DetailsLoad({required this.categoryId, this.dateRange});
}

class DetailsQuickPeriodSelected extends DetailsEvent {
  final String categoryId;
  final ChartPeriod dateRange;

  DetailsQuickPeriodSelected({
    required this.dateRange,
    required this.categoryId,
  });
}

class DetailsForecast extends DetailsEvent {
  final String categoryId;

  DetailsForecast({required this.categoryId});
}

class DetailsRefresh extends DetailsEvent {
  DetailsRefresh();
}
