import '../../domain/entities/chart_data_e_h.dart';
import '../../domain/entities/pie_chart_section.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ChartDataEH> chartDataList;
  final List<PieChartSection> pieChartSectionList;
  final double total;
  HomeLoaded({
    required this.chartDataList,
    required this.pieChartSectionList,
    required this.total,
  });
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
