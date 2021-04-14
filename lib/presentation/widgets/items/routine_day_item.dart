import 'package:flutter/material.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/theme/typography.dart';

class RoutineDayItem extends StatelessWidget {
  final RoutineDay routineDay;

  const RoutineDayItem({required this.routineDay});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            ParagraphXSmall.light("Day"),
            ParagraphXSmall.heavy(routineDay.order.toString()),
          ],
        ),
        Expanded(
          flex: 1,
          child: Card(
            child: Column(
              children: [F6.heavy(routineDay.name)],
            ),
          ),
        ),
      ],
    );
  }
}
