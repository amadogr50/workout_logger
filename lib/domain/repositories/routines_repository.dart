import 'package:workout_logger/db/db.dart';
import 'package:workout_logger/domain/entities/day_with_items.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/entities/routine.dart';

abstract class RoutinesRepository {
  Stream<Routine> watchCurrentRoutine();
  Stream<List<Routine>> watchRoutines();
  Stream<Routine> watchRoutine(int id);
  Future<List<DayWithItems>> getDaysWithItemsOfRoutine(int routineId);
  Future<List<RoutineItemModel>> getItemsOfDay(int routineId);
  Future<Exercise> getExercise(int exerciseId);
}
