import '../entities/chart_data_e_h.dart';

abstract class HomeRpstr {
  Future<List<ChartDataEH>> getChartDataDefoult();
}
