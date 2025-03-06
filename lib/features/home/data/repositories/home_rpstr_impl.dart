import '../../domain/entities/chart_data.dart';
import '../../domain/repositories/home_rpstr.dart';
import '../api/home_api.dart';

class HomeRpstrImpl implements HomeRpstr {
  final HomeApi homeApi;

  HomeRpstrImpl(this.homeApi);

  @override
  Future<ChartData> getChartData() {
    // TODO: implement getFinancialMetric
    throw UnimplementedError();
  }
}
