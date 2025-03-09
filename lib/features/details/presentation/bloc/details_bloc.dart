import 'package:flutter_bloc/flutter_bloc.dart';

import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsLoad>((event, emit) async {
      emit(DetailsLoading());
      try {
        emit(DetailsLoaded());
      } catch (e) {
        emit(DetailsError("A"));
      }
    });

    on<DetailsRefresh>((event, emit) async {});
  }
}
