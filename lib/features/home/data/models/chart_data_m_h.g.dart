// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data_m_h.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartDataMH _$ChartDataMHFromJson(Map<String, dynamic> json) => ChartDataMH(
  categoryId: json['categoryId'] as String,
  title: json['title'] as String,
  points:
      (json['points'] as List<dynamic>)
          .map((e) => ChartPointMH.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ChartDataMHToJson(ChartDataMH instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'title': instance.title,
      'points': instance.points,
    };
