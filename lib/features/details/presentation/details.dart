import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/domain/entities/chart_data_e_h.dart';
import 'bloc/details_bloc.dart';
import 'bloc/details_event.dart';
import 'bloc/details_state.dart';
import 'widgets/date_range_selector.dart';
import 'widgets/details_info.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final chartData = ModalRoute.of(context)?.settings.arguments as ChartDataEH;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    context.read<DetailsBloc>().add(
      DetailsLoad(categoryId: chartData.categoryId),
    );

    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar:
              state is DetailsLoaded
                  ? AppBar(
                    backgroundColor: colors.primary,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DateRangeSelector(
                          dateRange: state.dateRange,
                          onDateRangeSelected: (newRange) {
                            context.read<DetailsBloc>().add(
                              DetailsLoad(
                                categoryId: chartData.categoryId,
                                dateRange: newRange,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                  : null,
          body: Builder(
            builder: (context) {
              if (state is DetailsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DetailsLoaded) {
                return RefreshIndicator(
                  backgroundColor: const Color.fromARGB(255, 35, 35, 35),
                  onRefresh: () async {
                    context.read<DetailsBloc>().add(DetailsRefresh());
                  },
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DetailsInfo(
                      chartData: state.chartData,
                      dateRange: state.dateRange,
                    ),
                  ),
                );
              } else if (state is DetailsError) {
                return Center(child: Text(state.message));
              }
              return const Center(child: Text('Нет доступных данных'));
            },
          ),
        );
      },
    );
  }
}
