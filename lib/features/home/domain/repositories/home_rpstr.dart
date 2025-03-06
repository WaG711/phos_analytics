import '../entities/chart_data.dart';

abstract class HomeRpstr {
  Future<ChartData> getChartData();
}