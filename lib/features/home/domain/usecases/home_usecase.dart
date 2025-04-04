import '../entities/chart_data_e_h.dart';
import '../repositories/home_rpstr.dart';

class HomeUsecase {
  final HomeRpstr rpstr;

  HomeUsecase({required this.rpstr});

  Future<List<ChartDataEH>> executeChartDataDefoult() async {
    return await rpstr.getChartDataDefoult();
  }
}
