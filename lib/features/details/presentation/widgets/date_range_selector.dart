import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangeSelector extends StatelessWidget {
  final DateTimeRange dateRange;
  final ValueChanged<DateTimeRange> onDateRangeSelected;

  const DateRangeSelector({
    super.key,
    required this.dateRange,
    required this.onDateRangeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FilledButton.tonal(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: () async {
        final picked = await showDateRangePicker(
          context: context,
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
          initialDateRange: dateRange,
          helpText: "Выберите период",
          cancelText: "Отмена",
          confirmText: "Выбрать",
          builder: (context, child) {
            return Theme(
              data: theme.copyWith(
                dialogTheme: DialogTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              child: child!,
            );
          },
        );

        if (picked != null) {
          onDateRangeSelected(picked);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.calendar_today, size: 18),
          const SizedBox(width: 8),
          Text(
            "${DateFormat('dd MMM yyyy').format(dateRange.start)} - "
            "${DateFormat('dd MMM yyyy').format(dateRange.end)}",
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
