import '../../../../core/entities/chart_data.dart';
import '../repositories/details_rpstr.dart';

class DetailsUsecase {
  final DetailsRpstr rpstr;

  DetailsUsecase({required this.rpstr});

  Future<ChartData> executeChartDataWeek(String categoryId) async {
    return await rpstr.getChartDataWeek(categoryId);
  }

  Future<ChartData> executeChartDataMonth(String categoryId) async {
    return await rpstr.getChartDataMonth(categoryId);
  }

  Future<ChartData> executeChartDataQuarter(String categoryId) async {
    return await rpstr.getChartDataQuarter(categoryId);
  }

  Future<ChartData> executeChartDataHalfYear(String categoryId) async {
    return await rpstr.getChartDataHalfYear(categoryId);
  }

  Future<ChartData> executeChartDataYear(String categoryId) async {
    return await rpstr.getChartDataYear(categoryId);
  }
}
