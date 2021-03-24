import 'package:workout_logger/core/db/db.dart';
import 'package:workout_logger/data/datasources/local_data_source.dart';
import 'package:workout_logger/domain/entities/exercise.dart';

class DatabaseDataSource implements LocalDataSource {
  final MyDatabase db;

  DatabaseDataSource(this.db);

  // @override
  // Future<Routine> getCurrentRoutine() async {}
  //
  // @override
  // Future<Routine> updateRoutine(Routine routine) async {}
  //
  // @override
  // Future<Function> deleteRoutine(int id) async {}
  //
  // @override
  // Future<Routine> addRoutine(Routine routine) async {
  //   return db.routinesDao.addOrUpdateRoutine(routine);
  // }
  //
  // @override
  // Future<Routine> getRoutine(int id) async {
  //   return db.routinesDao.getRoutine(id);
  // }
  //
  // @override
  // Future<List<Routine>> getRoutines() async {
  //   return db.routinesDao.getRoutines();
  // }
  //
  // @override
  // Future<RoutineItem> updateRoutineItem(RoutineItem routineItem) {}
  //
  // @override
  // Future<Function> deleteRoutineItem(int id) {}
  //
  // @override
  // Future<RoutineItem> addRoutineItem(
  //   RoutineItem routineItem,
  //   int routineDayId,
  // ) {
  //   return db.routinesDao.addOrUpdateRoutineItem(routineItem, routineDayId);
  // }
  //
  // @override
  // Future<List<RoutineItem>> getRoutineItemsOfRoutineDay(int routineDayId) {
  //   return db.routinesDao.getRoutineItemsOfRoutineDay(routineDayId);
  // }
  //
  // @override
  // Future<RoutineDay> updateRoutineDay(RoutineDay routineDay) {}
  //
  // @override
  // Future<Function> deleteRoutineDay(int id) {
  //
  // }
  //
  // @override
  // Future<RoutineDay> addRoutineDay(RoutineDay routineDay, int routineId) {}
  //
  // @override
  // Future<List<RoutineDay>> getRoutineDaysOfRoutine(int routineId) {}

  @override
  Future<Exercise> getExercise(int exerciseId) {
    return db.exercisesDao.getExercise(exerciseId);
  }

  @override
  Future<List<Exercise>> getExercises() {
    return db.exercisesDao.getExercises();
  }

  @override
  Future<Exercise> addExercise({
    required String name,
    required int exerciseTypeId,
    required int equipmentId,
    required String instructions,
    required List<int> musclesIds,
  }) {
    return db.exercisesDao.addExercise(
      name: name,
      exerciseTypeId: exerciseTypeId,
      equipmentId: equipmentId,
      instructions: instructions,
      musclesIds: musclesIds,
    );
  }
}
