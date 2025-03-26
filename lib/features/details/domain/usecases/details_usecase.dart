import '../../../../core/entities/chart_data.dart';
import '../repositories/details_rpstr.dart';

class DetailsUsecase {
  final DetailsRpstr rpstr;

  DetailsUsecase({required this.rpstr});

  Future<ChartData> executeChartDataRange(
    String categoryId,
    String dateRange,
  ) async {
    return await rpstr.getChartDataRange(categoryId, dateRange);
  }
}
