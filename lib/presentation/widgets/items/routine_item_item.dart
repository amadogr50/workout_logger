import 'package:flutter/material.dart';
import 'package:workout_logger/domain/entities/routine_item.dart';
import 'package:workout_logger/presentation/widgets/items/item.dart';
import 'package:workout_logger/theme/dimensions.dart';
import 'package:workout_logger/theme/typography.dart';

class RoutineItemItem extends StatelessWidget {
  final RoutineItem routineItem;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const RoutineItemItem({
    required this.routineItem,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Item(
      left: IconButton(
        icon: const Icon(Icons.remove_circle),
        onPressed: onRemove,
        color: Colors.red,
      ),
      main: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          F6.heavy(routineItem.exercise.name),
          const SizedBox(height: Dimensions.xs),
          if (routineItem.sets.isNotEmpty)
            ParagraphSmall.regular("${routineItem.sets.length} sets"),
          if (routineItem.note.isNotEmpty)
            ParagraphSmall.regular(routineItem.note),
        ],
      ),
      onTap: onTap,
    );
  }
}
