import '../../../../core/entities/chart_data.dart';

abstract class DetailsRpstr {
  Future<ChartData> getChartDataWeek(String categoryId);
  Future<ChartData> getChartDataMonth(String categoryId);
  Future<ChartData> getChartDataQuarter(String categoryId);
  Future<ChartData> getChartDataHalfYear(String categoryId);
  Future<ChartData> getChartDataYear(String categoryId);
}
