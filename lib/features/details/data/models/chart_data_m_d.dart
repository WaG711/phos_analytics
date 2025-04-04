import 'package:json_annotation/json_annotation.dart';

import 'chart_point_m_d.dart';

part 'chart_data_m_d.g.dart';

@JsonSerializable()
class ChartDataMD {
  final String categoryId;
  final String title;
  final String description;
  final List<ChartPointMD> points;

  ChartDataMD({
    required this.categoryId,
    required this.title,
    required this.description,
    required this.points,
  });

  factory ChartDataMD.fromJson(Map<String, dynamic> json) =>
      _$ChartDataMDFromJson(json);

  Map<String, dynamic> toJson() => _$ChartDataMDToJson(this);
}
