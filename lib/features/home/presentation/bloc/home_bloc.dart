import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/pie_chart_section.dart';
import '../../domain/usecases/home_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUsecase usecase;
  HomeBloc({required this.usecase}) : super(HomeInitial()) {
    on<HomeLoad>((event, emit) async {
      emit(HomeLoading());
      try {
        final chartDataList = await usecase.executeChartData();
        final pieChartList = await usecase.executePieChart();

        final List<Color> colors = [];
        final random = Random();
        final hueStep = 360.0 / pieChartList.length;

        for (int i = 0; i < pieChartList.length; i++) {
          final hue = (i * hueStep) % 360;
          final saturation = 0.7 + random.nextDouble() * 0.3;
          final value = 0.6 + random.nextDouble() * 0.4;

          colors.add(HSVColor.fromAHSV(1.0, hue, saturation, value).toColor());
        }

        colors.shuffle(random);

        final pieChartSectionList =
            pieChartList.asMap().entries.map((entry) {
              return PieChartSection(
                value: entry.value.value,
                color: colors[entry.key],
                title: entry.value.title,
              );
            }).toList();

        final total = pieChartSectionList.fold(
          0.0,
          (sum, item) => sum + item.value,
        );

        emit(
          HomeLoaded(
            chartDataList: chartDataList,
            pieChartSectionList: pieChartSectionList,
            total: total,
          ),
        );
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
