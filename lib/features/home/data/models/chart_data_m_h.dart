import 'package:json_annotation/json_annotation.dart';

import 'chart_point_m_h.dart';

part 'chart_data_m_h.g.dart';

// dart run build_runner build

@JsonSerializable()
class ChartDataMH {
  final String categoryId;
  final String title;
  final List<ChartPointMH> points;

  ChartDataMH({
    required this.categoryId,
    required this.title,
    required this.points,
  });

  factory ChartDataMH.fromJson(Map<String, dynamic> json) =>
      _$ChartDataMHFromJson(json);

  Map<String, dynamic> toJson() => _$ChartDataMHToJson(this);
}
