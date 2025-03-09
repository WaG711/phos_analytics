import '../../../../core/entities/chart_data.dart';

abstract class HomeRpstr {
  Future<List<ChartData>> getChartDataDefoult();
}
