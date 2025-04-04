// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_point_m_d.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartPointMD _$ChartPointMDFromJson(Map<String, dynamic> json) => ChartPointMD(
  date: json['date'] as String,
  value: (json['value'] as num).toDouble(),
);

Map<String, dynamic> _$ChartPointMDToJson(ChartPointMD instance) =>
    <String, dynamic>{'date': instance.date, 'value': instance.value};
