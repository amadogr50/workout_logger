import 'package:flutter/material.dart';
import 'package:workout_logger/domain/entities/routine.dart';
import 'package:workout_logger/theme/typography.dart';

class RoutineItem extends StatelessWidget {
  final Routine routine;

  const RoutineItem({required this.routine});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          F6.heavy(routine.name),
        ],
      ),
    );
  }
}
