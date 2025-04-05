import 'package:json_annotation/json_annotation.dart';

part 'pie_chart_m_h.g.dart';

@JsonSerializable()
class PieChartMH {
  final String title;
  final double value;

  PieChartMH({required this.title, required this.value});

  factory PieChartMH.fromJson(Map<String, dynamic> json) =>
      _$PieChartMHFromJson(json);

  Map<String, dynamic> toJson() => _$PieChartMHToJson(this);
}
