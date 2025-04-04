import 'package:json_annotation/json_annotation.dart';

part 'chart_point_m_d.g.dart';

@JsonSerializable()
class ChartPointMD {
  final String date;
  final double value;

  ChartPointMD({required this.date, required this.value});

  factory ChartPointMD.fromJson(Map<String, dynamic> json) =>
      _$ChartPointMDFromJson(json);

  Map<String, dynamic> toJson() => _$ChartPointMDToJson(this);
}
