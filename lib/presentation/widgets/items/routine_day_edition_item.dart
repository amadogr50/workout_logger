import 'package:flutter/material.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/presentation/widgets/items/item.dart';
import 'package:workout_logger/theme/dimensions.dart';
import 'package:workout_logger/theme/typography.dart';

class RoutineDayEditionItem extends StatelessWidget {
  final VoidCallback onRemove;
  final VoidCallback onTap;
  final RoutineDay day;

  const RoutineDayEditionItem({
    required this.day,
    required this.onRemove,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Item(
      left: Column(
        children: [
          const ParagraphXSmall.light("Day"),
          ParagraphXSmall.heavy((day.order + 1).toString()),
          IconButton(
            icon: const Icon(Icons.remove_circle_rounded),
            onPressed: onRemove,
            color: Colors.red,
          ),
        ],
      ),
      main: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              F6.heavy(day.name),
              IconButton(
                icon: const Icon(Icons.drag_handle),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: Dimensions.s),
          if (day.note.isNotEmpty) ParagraphBase.regular(day.note),
        ],
      ),
      onTap: onTap,
    );
  }
}
