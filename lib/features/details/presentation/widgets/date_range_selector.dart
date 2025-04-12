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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      onPressed: () async {
        DateTime now = DateTime.now();
        DateTime startDate = dateRange.start;
        DateTime endDate = dateRange.end;

        if (startDate.isAfter(now)) {
          startDate = now;
          endDate = now;
        }

        final picked = await showDateRangePicker(
          context: context,
          firstDate: DateTime(2025),
          lastDate: now,
          initialDateRange: DateTimeRange(start: startDate, end: endDate),
          helpText: "Выберите период",
          cancelText: "Отмена",
          confirmText: "Выбрать",
          fieldStartHintText: "Выберите начало",
          fieldEndHintText: "Выберите конец",
          fieldStartLabelText: "Начало",
          fieldEndLabelText: "Конец",
          saveText: "Сохранить",
          builder: (context, child) {
            return Theme(
              data: theme.copyWith(
                dialogTheme: DialogTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
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
            "${DateFormat('dd.MM.yy').format(dateRange.start)} - "
            "${DateFormat('dd.MM.yy').format(dateRange.end)}",
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
