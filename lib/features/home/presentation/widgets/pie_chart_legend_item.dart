import 'package:flutter/material.dart';

class PieChartLegendItem extends StatelessWidget {
  final Color color;
  final String title;
  final double percentage;
  final bool isTouched;
  final VoidCallback onTap;
  const PieChartLegendItem({
    super.key,
    required this.color,
    required this.title,
    required this.percentage,
    required this.isTouched,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color:
              isTouched
                  ? color.withValues(alpha: 0.2 * 255)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isTouched ? color : const Color.fromRGBO(140, 140, 140, 0.5),
          ),
          boxShadow:
              isTouched
                  ? [
                    BoxShadow(
                      color: color.withValues(alpha: 0.1 * 255),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ]
                  : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow:
                    isTouched
                        ? [
                          BoxShadow(
                            color: color.withValues(alpha: 0.8 * 255),
                            blurRadius: 2,
                            spreadRadius: 1,
                          ),
                        ]
                        : null,
              ),
            ),
            const SizedBox(width: 8),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontWeight: isTouched ? FontWeight.bold : FontWeight.normal,
                color: isTouched ? color : Colors.black,
              ),
              child: Text(title),
            ),
            const SizedBox(width: 8),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: isTouched ? color : Colors.grey.shade600,
                fontWeight: isTouched ? FontWeight.bold : FontWeight.normal,
              ),
              child: Text('${percentage.toStringAsFixed(1)}%'),
            ),
          ],
        ),
      ),
    );
  }
}
