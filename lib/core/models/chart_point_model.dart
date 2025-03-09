import 'package:json_annotation/json_annotation.dart';

part 'chart_point_model.g.dart';

@JsonSerializable()
class ChartPointModel {
  final DateTime date;
  final double value;

  ChartPointModel({required this.date, required this.value});

  factory ChartPointModel.fromJson(Map<String, dynamic> json) =>
      _$ChartPointModelFromJson(json);
}
