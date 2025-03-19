import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/entities/chart_period.dart';
import 'bloc/details_bloc.dart';
import 'bloc/details_event.dart';
import 'bloc/details_state.dart';
import 'widgets/details_info.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DetailsBloc>().add(
      DetailsLoad(categoryId: "categoryId", period: ChartPeriod.week),
    );
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueAccent, title: Text("Card 1")),
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DetailsLoaded) {
            final chartData = state.chartData;
            return RefreshIndicator(
              backgroundColor: const Color.fromARGB(255, 35, 35, 35),
              onRefresh: () async {
                context.read<DetailsBloc>().add(DetailsRefresh());
              },
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DetailsInfo(chartData: chartData),
              ),
            );
          } else if (state is DetailsError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Нет доступных данных'));
        },
      ),
    );
  }
}
