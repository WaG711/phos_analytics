// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data_m_d.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartDataMD _$ChartDataMDFromJson(Map<String, dynamic> json) => ChartDataMD(
  categoryId: json['categoryId'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  points:
      (json['points'] as List<dynamic>)
          .map((e) => ChartPointMD.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ChartDataMDToJson(ChartDataMD instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'title': instance.title,
      'description': instance.description,
      'points': instance.points,
    };
