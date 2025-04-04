import '../../domain/entities/chart_data_e_h.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ChartDataEH> chartDataList;
  HomeLoaded(this.chartDataList);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
