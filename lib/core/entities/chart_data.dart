import 'chart_point.dart';

class ChartData {
  final String categoryId;
  final String title;
  final List<ChartPoint> points;

  const ChartData({
    required this.categoryId,
    required this.title,
    required this.points,
  });
}
