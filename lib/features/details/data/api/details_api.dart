import 'dart:math';

import 'package:dio/dio.dart';

import '../../../../core/models/chart_data_model.dart';
import '../../../../core/models/chart_point_model.dart';

class DetailsApi {
  final dio = Dio();
  ChartDataModel test = ChartDataModel(
    categoryId: "categoryId",
    title: "title",
    points: [
      ChartPointModel(date: "03/23", value: Random().nextDouble() * 10),
      ChartPointModel(date: "03/23", value: Random().nextDouble() * 10),
      ChartPointModel(date: "03/23", value: Random().nextDouble() * 10),
      ChartPointModel(date: "03/23", value: Random().nextDouble() * 10),
      ChartPointModel(date: "03/23", value: Random().nextDouble() * 10),
      ChartPointModel(date: "03/23", value: Random().nextDouble() * 10),
      ChartPointModel(date: "03/23", value: Random().nextDouble() * 10),
    ],
  );

  Future<ChartDataModel> fetchChartDataRange(
    String categoryId,
    String dateRange,
  ) async {
    // try {
    //   final response = await dio.get(
    //     "",
    //     options: Options(responseType: ResponseType.json),
    //   );

    //   if (response.statusCode == 200) {
    //     return ChartDataModel.fromJson(response.data);
    //   } else {
    //     throw Exception("Ошибка запроса: ${response.statusCode}");
    //   }
    // } catch (e) {
    //   throw Exception("Ошибка при загрузке данных: $e");
    // }
    return test;
  }
}
