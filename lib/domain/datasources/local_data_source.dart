import 'package:workout_logger/db/db.dart';
import 'package:workout_logger/domain/entities/day_with_items.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/entities/routine.dart';

abstract class LocalDataSource {
  Stream<Routine> watchCurrentRoutine();

  Stream<List<Routine>> watchRoutines();

  Stream<Routine> watchRoutine(int id);

  Future<Exercise> getExercise(int exerciseId);

  Future<List<Exercise>> getExercises();

  Stream<List<Exercise>> watchExercises();

  Future<Exercise> addExercise({
    required String name,
    required int exerciseTypeId,
    required int equipmentId,
    required String instructions,
    required List<int> musclesIds,
  });

  Future<List<DayWithItems>> getDaysWithItemsOfRoutine(int routineId);

  Future<List<RoutineItemModel>> getItemsOfDay(int routineId);
}
