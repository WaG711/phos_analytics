import '../../domain/entities/chart_data_e_h.dart';
import '../../domain/entities/chart_point_e_h.dart';
import '../../domain/repositories/home_rpstr.dart';
import '../api/home_api.dart';

class HomeRpstrImpl implements HomeRpstr {
  final HomeApi api;

  HomeRpstrImpl({required this.api});

  @override
  Future<List<ChartDataEH>> getChartDataDefoult() async {
    final listChartDataModel = await api.fetchChartDataDefoult();

    return listChartDataModel
        .map(
          (model) => ChartDataEH(
            categoryId: model.categoryId,
            title: model.title,
            points:
                model.points
                    .map(
                      (point) =>
                          ChartPointEH(date: point.date, value: point.value),
                    )
                    .toList(),
          ),
        )
        .toList();
  }
}
