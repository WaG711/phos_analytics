import '../../../../core/entities/chart_data.dart';
import '../../../../core/entities/chart_point.dart';
import '../../domain/repositories/home_rpstr.dart';
import '../api/home_api.dart';

class HomeRpstrImpl implements HomeRpstr {
  final HomeApi api;

  HomeRpstrImpl({required this.api});

  @override
  Future<List<ChartData>> getChartDataDefoult() async {
    final listChartDataModel = await api.fetchChartDataDefoult();

    return listChartDataModel
        .map(
          (model) => ChartData(
            categoryId: model.categoryId,
            title: model.title,
            points:
                model.points
                    .map(
                      (point) =>
                          ChartPoint(date: point.date, value: point.value),
                    )
                    .toList(),
          ),
        )
        .toList();
  }
}
