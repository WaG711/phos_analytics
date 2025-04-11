import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/chart_period.dart';
import '../../domain/usecases/details_usecase.dart';
import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final DetailsUsecase usecase;

  DetailsBloc({required this.usecase}) : super(DetailsInitial()) {
    on<DetailsLoad>((event, emit) async {
      emit(DetailsLoading());
      try {
        DateTimeRange dateRange = _selectQuickRange(ChartPeriod.week);
        String formattedDateRange;

        if (event.dateRange == null) {
          formattedDateRange =
              "${DateFormat('dd.MM.yyyy').format(dateRange.start)}-${DateFormat('dd.MM.yyyy').format(dateRange.end)}";
        } else {
          formattedDateRange =
              "${DateFormat('dd.MM.yyyy').format(event.dateRange!.start)}-${DateFormat('dd.MM.yyyy').format(event.dateRange!.end)}";
        }

        final chartData = await usecase.executeChartDataRange(
          event.categoryId,
          formattedDateRange,
        );

        emit(
          DetailsLoaded(
            chartData: chartData,
            dateRange: event.dateRange ?? dateRange,
          ),
        );
      } catch (e) {
        emit(DetailsError(e.toString()));
      }
    });

    on<DetailsQuickPeriodSelected>((event, emit) async {
      emit(DetailsLoading());

      try {
        var dateRange = _selectQuickRange(event.dateRange);

        final String formattedDateRange =
            "${DateFormat('dd.MM.yyyy').format(dateRange.start)}-${DateFormat('dd.MM.yyyy').format(dateRange.end)}";

        final chartData = await usecase.executeChartDataRange(
          event.categoryId,
          formattedDateRange,
        );

        emit(DetailsLoaded(chartData: chartData, dateRange: dateRange));
      } catch (e) {
        emit(DetailsError(e.toString()));
      }
    });

    on<DetailsRefresh>((event, emit) async {});
  }

  DateTimeRange _selectQuickRange(ChartPeriod period) {
    final DateTime now = DateTime.now();
    DateTime start;

    switch (period) {
      case ChartPeriod.week:
        start = now.subtract(Duration(days: now.weekday - 1));
        break;
      case ChartPeriod.month:
        start = DateTime(now.year, now.month, 1);
        break;
      case ChartPeriod.quarter:
        int quarter = (now.month - 1) ~/ 3 + 1;
        start = DateTime(now.year, (quarter - 1) * 3 + 1, 1);
        break;
      case ChartPeriod.halfYear:
        int half = now.month <= 6 ? 1 : 2;
        start = DateTime(now.year, half == 1 ? 1 : 7, 1);
        break;
      case ChartPeriod.year:
        start = DateTime(now.year, 1, 1);
        break;
    }

    return DateTimeRange(start: start, end: now);
  }
}
