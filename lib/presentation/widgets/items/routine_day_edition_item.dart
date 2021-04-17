import 'package:flutter/material.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/theme/dimensions.dart';
import 'package:workout_logger/theme/typography.dart';

class RoutineDayEditionItem extends StatelessWidget {
  final VoidCallback onRemove;
  final VoidCallback onTap;
  final RoutineDay day;

  const RoutineDayEditionItem(this.day, this.onRemove, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            ParagraphXSmall.light("Day"),
            ParagraphXSmall.heavy("1"),
            IconButton(
              icon: const Icon(Icons.remove_circle_rounded),
              onPressed: onRemove,
            ),
          ],
        ),
        Expanded(
            flex: 1,
            child: Card(
              child: InkWell(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.s),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          F6.heavy("Exdi"),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
