import 'package:workout_logger/db/db.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/entities/routine.dart';

import 'local_data_source.dart';

class DatabaseDataSource implements LocalDataSource {
  final MyDatabase db;

  DatabaseDataSource(this.db);

  // Future<Routine> watchCurrentRoutine() async {}
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
  // Future<Routine> watchRoutine(int id) async {
  //   return db.routinesDao.watchRoutine(id);
  // }
  //
  // @override
  // Future<List<Routine>> watchRoutines() async {
  //   return db.routinesDao.watchRoutines();
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
  // Future<List<RoutineItem>> watchRoutineItemsOfRoutineDay(int routineDayId) {
  //   return db.routinesDao.watchRoutineItemsOfRoutineDay(routineDayId);
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
  // Future<List<RoutineDay>> watchRoutineDaysOfRoutine(int routineId) {}

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

  @override
  Stream<Routine> watchCurrentRoutine() {
    return db.routinesDao.watchCurrentRoutine();
  }

  @override
  Stream<Routine> watchRoutine(int id) {
    return db.routinesDao.watchRoutine(id);
  }

  @override
  Stream<List<Routine>> watchRoutines() {
    return db.routinesDao.watchRoutines();
  }

  @override
  Future<List<Exercise>> getExercises() {
    return db.exercisesDao.getExercises();
  }

  @override
  Future<Exercise> getExercise(int exerciseId) {
    return db.exercisesDao.getExercise(exerciseId);
  }
}
