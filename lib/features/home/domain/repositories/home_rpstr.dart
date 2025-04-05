import '../entities/chart_data_e_h.dart';
import '../entities/pie_chart_e_h.dart';

abstract class HomeRpstr {
  Future<List<ChartDataEH>> getChartData();
  Future<List<PieChartEH>> getPieChart();
}
