import 'package:json_annotation/json_annotation.dart';

import 'chart_point_model.dart';

part 'chart_data_model.g.dart';

@JsonSerializable()
class ChartDataModel {
  final String categoryId;
  final String title;
  final List<ChartPointModel> points;

  ChartDataModel({
    required this.categoryId,
    required this.title,
    required this.points,
  });

  factory ChartDataModel.fromJson(Map<String, dynamic> json) =>
      _$ChartDataModelFromJson(json);
}
