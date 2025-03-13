import 'package:flutter/material.dart';
import 'package:phos_analytics/features/home/presentation/widgets/last_card.dart';

import 'widgets/metric_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FFFFFFFF")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              color: Colors.amber,
              height: 65,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: LastCard(title: "Карточка $index"),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 0.75,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return MetricCard(title: "Карточка $index");
              },
            ),
          ),
        ],
      ),
    );
  }
}
