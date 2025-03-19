import '../../../../core/entities/chart_data.dart';
import '../../../../core/entities/chart_point.dart';
import '../../../../core/models/chart_data_model.dart';
import '../../domain/repositories/details_rpstr.dart';
import '../api/details_api.dart';

class DetailsRpstrImpl implements DetailsRpstr {
  final DetailsApi api;

  DetailsRpstrImpl({required this.api});

  @override
  Future<ChartData> getChartDataHalfYear(String categoryId) async {
    final chartDataModel = await api.fetchChartDataHalfYear(categoryId);
    return _mapChartDataModelToEntity(chartDataModel);
  }

  @override
  Future<ChartData> getChartDataMonth(String categoryId) async {
    final chartDataModel = await api.fetchChartDataMonth(categoryId);
    return _mapChartDataModelToEntity(chartDataModel);
  }

  @override
  Future<ChartData> getChartDataQuarter(String categoryId) async {
    final chartDataModel = await api.fetchChartDataQuarter(categoryId);
    return _mapChartDataModelToEntity(chartDataModel);
  }

  @override
  Future<ChartData> getChartDataWeek(String categoryId) async {
    final chartDataModel = await api.fetchChartDataWeek(categoryId);
    return _mapChartDataModelToEntity(chartDataModel);
  }

  @override
  Future<ChartData> getChartDataYear(String categoryId) async {
    final chartDataModel = await api.fetchChartDataYear(categoryId);
    return _mapChartDataModelToEntity(chartDataModel);
  }

  ChartData _mapChartDataModelToEntity(ChartDataModel model) {
    return ChartData(
      categoryId: model.categoryId,
      title: model.title,
      points:
          model.points
              .map((point) => ChartPoint(date: point.date, value: point.value))
              .toList(),
    );
  }
}
