import '../../../../core/entities/chart_data.dart';

abstract class HomeRpstr {
  Future<List<ChartData>> getChartDataDefoult();
  Future<ChartData> getChartDataWeek(String categoryId);
  Future<ChartData> getChartDataMonth(String categoryId);
  Future<ChartData> getChartDataQuarter(String categoryId);
  Future<ChartData> getChartDataHalfYear(String categoryId);
  Future<ChartData> getChartDataYear(String categoryId);
} 