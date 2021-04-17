import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/entities/set.dart';

class RoutineItem {
  final int? id;
  final Exercise exercise;
  final String note;
  final int restDuration;
  final List<Set> sets;
  final int order;
  final int groupNumber;

  const RoutineItem({
    required this.id,
    required this.exercise,
    required this.note,
    required this.restDuration,
    required this.sets,
    required this.order,
    required this.groupNumber,
  });
}
