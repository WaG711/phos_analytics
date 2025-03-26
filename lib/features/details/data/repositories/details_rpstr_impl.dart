import '../../../../core/entities/chart_data.dart';
import '../../../../core/entities/chart_point.dart';
import '../../domain/repositories/details_rpstr.dart';
import '../api/details_api.dart';

class DetailsRpstrImpl implements DetailsRpstr {
  final DetailsApi api;

  DetailsRpstrImpl({required this.api});

  @override
  Future<ChartData> getChartDataRange(
    String categoryId,
    String dateRange,
  ) async {
    final chartDataModel = await api.fetchChartDataRange(categoryId, dateRange);
    return ChartData(
      categoryId: chartDataModel.categoryId,
      title: chartDataModel.title,
      points:
          chartDataModel.points
              .map((point) => ChartPoint(date: point.date, value: point.value))
              .toList(),
    );
  }
}
