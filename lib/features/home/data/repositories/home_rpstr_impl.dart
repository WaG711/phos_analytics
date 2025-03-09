import '../../../../core/entities/chart_data.dart';
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
}
