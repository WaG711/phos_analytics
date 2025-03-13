import '../../../../core/entities/chart_period.dart';

abstract class DetailsEvent {}

class DetailsLoad extends DetailsEvent {
  final String categoryId;
  final ChartPeriod period;

  DetailsLoad({required this.categoryId, required this.period});
}

class DetailsRefresh extends DetailsEvent {
  DetailsRefresh();
}
