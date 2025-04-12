import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phos_analytics/features/home/presentation/bloc/home_event.dart';
import 'package:phos_analytics/features/home/presentation/widgets/home_cards.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.read<HomeBloc>().state is HomeInitial) {
      context.read<HomeBloc>().add(HomeLoad());
    }

    return Scaffold(
      appBar: AppBar(title: Text("Аналитика")),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            return HomeCards(
              chartDataList: state.chartDataList,
              pieChartSectionList: state.pieChartSectionList,
              total: state.total,
            );
          } else if (state is HomeError) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: Text(state.message)),
            );
          }
          return const Center(child: Text("ERROR: Widget Center Home"));
        },
      ),
    );
  }
}
