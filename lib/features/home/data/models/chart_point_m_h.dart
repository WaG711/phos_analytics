import 'package:json_annotation/json_annotation.dart';

part 'chart_point_m_h.g.dart';

@JsonSerializable()
class ChartPointMH {
  final String date;
  final double value;

  ChartPointMH({required this.date, required this.value});

  factory ChartPointMH.fromJson(Map<String, dynamic> json) =>
      _$ChartPointMHFromJson(json);

  Map<String, dynamic> toJson() => _$ChartPointMHToJson(this);
}
