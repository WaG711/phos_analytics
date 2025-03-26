import 'package:flutter/material.dart';

import '../../../../core/entities/chart_data.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final ChartData chartData;
  final DateTimeRange dateRange;
  DetailsLoaded({required this.chartData, required this.dateRange});
}

class DetailsError extends DetailsState {
  final String message;
  DetailsError(this.message);
}
