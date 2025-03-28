import '../../../../core/entities/chart_data.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ChartData> chartDataList;
  HomeLoaded(this.chartDataList);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
