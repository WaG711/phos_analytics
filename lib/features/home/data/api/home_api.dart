import 'package:dio/dio.dart';

import '../../../../core/models/chart_data_model.dart';

class HomeApi {
  final dio = Dio();
  List<ChartDataModel> test = [
    ChartDataModel(categoryId: "categoryId", title: "title", points: []),
  ];

  Future<List<ChartDataModel>> fetchChartDataDefoult() async {
    // try {
    //   final response = await dio.get(
    //     "",
    //     options: Options(responseType: ResponseType.json),
    //   );

    //   if (response.statusCode == 200) {
    //     return (response.data as List)
    //         .map((json) => ChartDataModel.fromJson(json))
    //         .toList();
    //   } else {
    //     throw Exception("Ошибка запроса: ${response.statusCode}");
    //   }
    // } catch (e) {
    //   throw Exception("Ошибка при загрузке данных: $e");
    // }
    return test;
  }
}
