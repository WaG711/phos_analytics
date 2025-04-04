import '../entities/chart_data_e_d.dart';

abstract class DetailsRpstr {
  Future<ChartDataED> getChartDataRange(String categoryId, String dateRange);
}
