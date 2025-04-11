import '../../domain/entities/chart_data_e_d.dart';
import '../../domain/entities/chart_point_e_d.dart';
import '../../domain/repositories/details_rpstr.dart';
import '../api/details_api.dart';

class DetailsRpstrImpl implements DetailsRpstr {
  final DetailsApi api;

  DetailsRpstrImpl({required this.api});

  @override
  Future<ChartDataED> getChartDataRange(
    String categoryId,
    String dateRange,
  ) async {
    final chartDataModel = await api.fetchChartDataRange(categoryId, dateRange);
    return ChartDataED(
      categoryId: chartDataModel.categoryId,
      title: chartDataModel.title,
      description: chartDataModel.description,
      points:
          chartDataModel.points
              .map(
                (point) => ChartPointED(date: point.date, value: point.value),
              )
              .toList(),
    );
  }

  @override
  Future<ChartDataED> getChartDataForecast(String categoryId) async {
    final chartDataModel = await api.fetchChartDataForecast(categoryId);
    return ChartDataED(
      categoryId: chartDataModel.categoryId,
      title: chartDataModel.title,
      description: chartDataModel.description,
      points:
          chartDataModel.points
              .map(
                (point) => ChartPointED(date: point.date, value: point.value),
              )
              .toList(),
    );
  }
}
