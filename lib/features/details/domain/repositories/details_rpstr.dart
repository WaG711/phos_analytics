import '../../../../core/entities/chart_data.dart';

abstract class DetailsRpstr {
  Future<ChartData> getChartDataRange(String categoryId, String dateRange);
}
