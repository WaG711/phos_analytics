import 'package:dio/dio.dart';

import '../../../../core/models/chart_data_model.dart';

class DetailsApi {
  final Dio dio;

  DetailsApi(this.dio);

  Future<ChartDataModel> fetchChartDataWeek(String categoryId) async {
    return _fetchChartData("/chart-data/week", categoryId);
  }

  Future<ChartDataModel> fetchChartDataMonth(String categoryId) async {
    return _fetchChartData("/chart-data/month", categoryId);
  }

  Future<ChartDataModel> fetchChartDataQuarter(String categoryId) async {
    return _fetchChartData("/chart-data/quarter", categoryId);
  }

  Future<ChartDataModel> fetchChartDataHalfYear(String categoryId) async {
    return _fetchChartData("/chart-data/half-year", categoryId);
  }

  Future<ChartDataModel> fetchChartDataYear(String categoryId) async {
    return _fetchChartData("/chart-data/year", categoryId);
  }

  Future<ChartDataModel> _fetchChartData(
    String endpoint,
    String categoryId,
  ) async {
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: {"categoryId": categoryId},
        options: Options(responseType: ResponseType.json),
      );

      if (response.statusCode == 200) {
        return ChartDataModel.fromJson(response.data);
      } else {
        throw Exception("Ошибка запроса: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Ошибка при загрузке данных: $e");
    }
  }
}
