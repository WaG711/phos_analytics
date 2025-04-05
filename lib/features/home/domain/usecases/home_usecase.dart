import '../entities/chart_data_e_h.dart';
import '../entities/pie_chart_e_h.dart';
import '../repositories/home_rpstr.dart';

class HomeUsecase {
  final HomeRpstr rpstr;

  HomeUsecase({required this.rpstr});

  Future<List<ChartDataEH>> executeChartData() async {
    return await rpstr.getChartData();
  }

  Future<List<PieChartEH>> executePieChart() async {
    return await rpstr.getPieChart();
  }
}
