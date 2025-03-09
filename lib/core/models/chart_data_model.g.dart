// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartDataModel _$ChartDataModelFromJson(Map<String, dynamic> json) =>
    ChartDataModel(
      categoryId: json['categoryId'] as String,
      title: json['title'] as String,
      points:
          (json['points'] as List<dynamic>)
              .map((e) => ChartPointModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
