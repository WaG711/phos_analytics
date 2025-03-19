import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/home_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUsecase usecase;
  HomeBloc({required this.usecase}) : super(HomeInitial()) {
    on<HomeLoad>((event, emit) async {
      emit(HomeLoading());
      try {
        final chartDataList = await usecase.executeChartDataDefoult();
        emit(HomeLoaded(chartDataList));
      } catch (e) {
        emit(HomeError("Произошла ошибка при загрузке данных"));
      }
    });

    on<HomeRefresh>((event, emit) async {});
  }
}
