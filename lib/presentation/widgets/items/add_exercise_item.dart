import 'package:flutter/material.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/theme/dimensions.dart';
import 'package:workout_logger/theme/typography.dart';

class AddExerciseItem extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final Exercise exercise;

  const AddExerciseItem({
    Key? key,
    required this.exercise,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimensions.s),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  F6.heavy(exercise.name),
                  Wrap(
                    children: exercise.muscles
                        .map((muscle) => Container(
                              margin:
                                  const EdgeInsets.only(right: Dimensions.s),
                              child: Chip(
                                label: Text(muscle.name),
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
            Checkbox(value: isSelected, onChanged: (value) {})
          ],
        ),
      ),
    );
  }
}
