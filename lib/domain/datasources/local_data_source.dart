import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/entities/routine.dart';

abstract class LocalDataSource {
  /// Gets the current Routine.
  ///
  /// Throws [DoesNotExistException] if there's not a current [Routine].
  Stream<Routine> watchCurrentRoutine();

  /// Gets all saved Routines.
  ///
  /// Throws [DoesNotExistException] if there aren't any items.
  Stream<List<Routine>> watchRoutines();

  /// Gets the Routine with the given [id].
  ///
  /// Throws [DoesNotExistException] if there is not any Routine with the given [id].
  Stream<Routine> watchRoutine(int id);
  //
  // /// Adds the given [routine] to local source.
  // Future<Routine> addRoutine(Routine routine);
  //
  // /// Deletes the Routine with the given [id].
  // Future<void> deleteRoutine(int id);
  //
  // /// Updates saved instance of Routine with the given [routine].
  // ///
  // /// Throws [DoesNotExistException] if there's not a current [Routine].
  // Future<Routine> updateRoutine(Routine routine);
  //
  // /// Gets all saved RoutineDays of the Routine with the given [routineId].
  // ///
  // /// Throws [DoesNotExistException] if there aren't any items.
  // Future<List<RoutineDay>> getRoutineDaysOfRoutine(int routineId);
  //
  // /// Gets the RoutineDay with the given [id].
  // ///
  // /// Throws [DoesNotExistException] if there is not any RoutineDay with the given [id].
  // Future<RoutineDay> getRoutineDay(int id);
  //
  // /// Adds the given [routineDay] to local source and
  // /// adds the relationship with the Routine with the given [routineId].
  // Future<RoutineDay> addRoutineDay(RoutineDay routineDay, int routineId);
  //
  // /// Deletes the RoutineDay with the given [id].
  // Future<void> deleteRoutineDay(int id);
  //
  // /// Updates saved instance of RoutineDay with the given [routineDay].
  // ///
  // /// Throws [DoesNotExistException] if there's not a current [RoutineDay].
  // Future<RoutineDay> updateRoutineDay(RoutineDay routineDay);
  //
  // /// Gets all saved RoutineItems of the RoutineDay with the given [routineItemId].
  // ///
  // /// Throws [DoesNotExistException] if there aren't any items.
  // Future<List<RoutineItem>> getRoutineItemsOfRoutineDay(int routineItemId);
  //
  // /// Gets the RoutineItem with the given [id].
  // ///
  // /// Throws [DoesNotExistException] if there is not any RoutineItem with the given [id].
  // Future<RoutineItem> getRoutineItem(int id);
  //
  // /// Adds the given [routineItem] to local source and
  // /// adds the relationship with the RoutineDay with the given [routineDayId].
  // Future<RoutineItem> addRoutineItem(RoutineItem routineItem, int routineDayId);
  //
  // /// Deletes the RoutineItem with the given [id].
  // Future<void> deleteRoutineItem(int id);
  //
  // /// Updates saved instance of RoutineItem with the given [routineItem].
  // ///
  // /// Throws [DoesNotExistException] if there's not a current [RoutineItem].
  // Future<RoutineItem> updateRoutineItem(RoutineItem routineItem);

  Future<Exercise> getExercise(int exerciseId);

  Future<List<Exercise>> getExercises();

  Future<Exercise> addExercise({
    required String name,
    required int exerciseTypeId,
    required int equipmentId,
    required String instructions,
    required List<int> musclesIds,
  });
}
