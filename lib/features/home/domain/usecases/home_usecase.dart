import '../../../../core/entities/chart_data.dart';
import '../repositories/home_rpstr.dart';

class HomeUsecase {
  final HomeRpstr rpstr;

  HomeUsecase({required this.rpstr});

  Future<List<ChartData>> executeChartDataDefoult() async {
    return await rpstr.getChartDataDefoult();
  }
}
