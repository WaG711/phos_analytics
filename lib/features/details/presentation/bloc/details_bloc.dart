import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/chart_data.dart';
import '../../../../core/entities/chart_period.dart';
import '../../domain/usecases/details_usecase.dart';
import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final DetailsUsecase usecase;
  DetailsBloc(this.usecase) : super(DetailsInitial()) {
    on<DetailsLoad>((event, emit) async {
      emit(DetailsLoading());
      try {
        final chartData = await _fetchChartData(event.period, event.categoryId);
        emit(DetailsLoaded(chartData));
      } catch (e) {
        emit(DetailsError("Ошибка загрузки данных"));
      }
    });

    on<DetailsRefresh>((event, emit) async {});
  }

  Future<ChartData> _fetchChartData(
    ChartPeriod period,
    String categoryId,
  ) async {
    switch (period) {
      case ChartPeriod.week:
        return await usecase.executeChartDataWeek(categoryId);
      case ChartPeriod.month:
        return await usecase.executeChartDataMonth(categoryId);
      case ChartPeriod.quarter:
        return await usecase.executeChartDataQuarter(categoryId);
      case ChartPeriod.halfYear:
        return await usecase.executeChartDataHalfYear(categoryId);
      case ChartPeriod.year:
        return await usecase.executeChartDataYear(categoryId);
    }
  }
}
