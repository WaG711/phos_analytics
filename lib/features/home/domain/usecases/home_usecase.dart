import '../entities/chart_data.dart';
import '../repositories/home_rpstr.dart';

class HomeUsecase {
  final HomeRpstr rpstr;

  HomeUsecase(this.rpstr);

  Future<ChartData> executeChartData() async {
    return await rpstr.getChartData();
  }
}
