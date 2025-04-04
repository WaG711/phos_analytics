import 'chart_point_e_d.dart';

class ChartDataED {
  final String categoryId;
  final String title;
  final String description;
  final List<ChartPointED> points;

  ChartDataED({
    required this.categoryId,
    required this.title,
    required this.description,
    required this.points,
  });
}
