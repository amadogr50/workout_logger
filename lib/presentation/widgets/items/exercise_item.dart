import 'package:flutter/material.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/theme/typography.dart';

class ExerciseItem extends StatelessWidget {
  final Exercise exercise;

  const ExerciseItem(this.exercise);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [F6.heavy(exercise.name)],
          )
        ],
      ),
    );
  }
}
