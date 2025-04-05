import 'package:dio/dio.dart';

import '../models/chart_data_m_h.dart';
import '../models/pie_chart_m_h.dart';

class HomeApi {
  final dio = Dio();

  Future<List<ChartDataMH>> fetchChartData() async {
    try {
      final response = await dio.get(
        "http://192.168.1.68:8080/api/chartdatas/bars",
        options: Options(responseType: ResponseType.json),
      );

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => ChartDataMH.fromJson(json))
            .toList();
      } else {
        throw Exception("Ошибка запроса: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Ошибка при загрузке данных: $e");
    }
  }

  Future<List<PieChartMH>> fetchPieChart() async {
    try {
      final response = await dio.get(
        "http://192.168.1.68:8080/api/chartdatas/pies",
        options: Options(responseType: ResponseType.json),
      );

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => PieChartMH.fromJson(json))
            .toList();
      } else {
        throw Exception("Ошибка запроса: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Ошибка при загрузке данных: $e");
    }
  }
}
