import 'package:dartz/dartz.dart';
import 'package:workout_logger/db/db.dart';
import 'package:workout_logger/domain/entities/exercise.dart';

class RoutineItemWithExercise {
  final Either<RoutineItemModel, RoutineItemsModelCompanion> routineItem;
  final Exercise exercise;

  RoutineItemWithExercise({required this.routineItem, required this.exercise});
}
