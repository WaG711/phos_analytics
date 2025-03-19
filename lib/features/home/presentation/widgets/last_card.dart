import 'package:flutter/material.dart';

import '../../../../core/entities/chart_data.dart';

class LastCard extends StatelessWidget {
  final ChartData chartData;

  const LastCard({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details");
      },
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(chartData.title)],
          ),
        ),
      ),
    );
  }
}
