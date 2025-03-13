import '../../../../core/entities/chart_data.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final ChartData chartData;
  DetailsLoaded(this.chartData);
}

class DetailsError extends DetailsState {
  final String message;
  DetailsError(this.message);
}
