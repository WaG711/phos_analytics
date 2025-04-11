import 'package:dio/dio.dart';

import '../models/chart_data_m_d.dart';

class DetailsApi {
  final dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 15),
    ),
  );

  Future<ChartDataMD> fetchChartDataRange(
    String categoryId,
    String dateRange,
  ) async {
    try {
      final response = await dio.get(
        "http://192.168.1.68:8080/api/chartdatas/$categoryId&$dateRange",
        options: Options(responseType: ResponseType.json),
      );

      if (response.statusCode == 200) {
        return ChartDataMD.fromJson(response.data);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ChartDataMD> fetchChartDataForecast(String categoryId) async {
    try {
      final response = await dio.get(
        "http://192.168.1.68:8080/api/chartdatas/forecast/$categoryId",
        options: Options(responseType: ResponseType.json),
      );

      if (response.statusCode == 200) {
        return ChartDataMD.fromJson(response.data);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
