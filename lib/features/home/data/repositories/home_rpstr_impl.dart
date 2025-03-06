import '../../domain/entities/chart_data.dart';
import '../../domain/repositories/home_rpstr.dart';
import '../api/home_api.dart';

class HomeRpstrImpl implements HomeRpstr {
  final HomeApi homeApi;

  HomeRpstrImpl(this.homeApi);
  
  @override
  Future<List<ChartData>> getChartDataDefoult() {
    // TODO: implement getChartDataDefoult
    throw UnimplementedError();
  }
  
  @override
  Future<ChartData> getChartDataHalfYear(String categoryId) {
    // TODO: implement getChartDataHalfYear
    throw UnimplementedError();
  }
  
  @override
  Future<ChartData> getChartDataMonth(String categoryId) {
    // TODO: implement getChartDataMonth
    throw UnimplementedError();
  }
  
  @override
  Future<ChartData> getChartDataQuarter(String categoryId) {
    // TODO: implement getChartDataQuarter
    throw UnimplementedError();
  }
  
  @override
  Future<ChartData> getChartDataWeek(String categoryId) {
    // TODO: implement getChartDataWeek
    throw UnimplementedError();
  }
  
  @override
  Future<ChartData> getChartDataYear(String categoryId) {
    // TODO: implement getChartDataYear
    throw UnimplementedError();
  }

}
