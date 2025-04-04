import 'package:flutter/material.dart';

import '../../domain/entities/chart_data_e_d.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final ChartDataED chartData;
  final DateTimeRange dateRange;
  DetailsLoaded({required this.chartData, required this.dateRange});
}

class DetailsError extends DetailsState {
  final String message;
  DetailsError(this.message);
}
