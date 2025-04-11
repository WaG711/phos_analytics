import '../entities/chart_data_e_d.dart';
import '../repositories/details_rpstr.dart';

class DetailsUsecase {
  final DetailsRpstr rpstr;

  DetailsUsecase({required this.rpstr});

  Future<ChartDataED> executeChartDataRange(
    String categoryId,
    String dateRange,
  ) async {
    return await rpstr.getChartDataRange(categoryId, dateRange);
  }

  Future<ChartDataED> executeChartDataForecast(String categoryId) async {
    return await rpstr.getChartDataForecast(categoryId);
  }
}
