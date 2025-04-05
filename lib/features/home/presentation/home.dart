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
    context.read<HomeBloc>().add(HomeLoad());
    return Scaffold(
      appBar: AppBar(title: Text("Аналитика")),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            return RefreshIndicator(
              backgroundColor: const Color.fromARGB(255, 35, 35, 35),
              onRefresh: () async {
                context.read<HomeBloc>().add(HomeRefresh());
              },
              color: Colors.green,
              child: HomeCards(
                chartDataList: state.chartDataList,
                pieChartSectionList: state.pieChartSectionList,
                total: state.total,
              ),
            );
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Нет доступных данных'));
        },
      ),
    );
  }
}
