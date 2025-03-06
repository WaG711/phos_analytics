import '../entities/chart_data.dart';
import '../repositories/home_rpstr.dart';

class HomeUsecase {
  final HomeRpstr rpstr;

  HomeUsecase(this.rpstr);

  Future<List<ChartData>> executeChartDataDefoult() async {
    return await rpstr.getChartDataDefoult();
  }

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
