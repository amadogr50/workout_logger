import 'package:workout_logger/core/db/db.dart' hide Routine;
import 'package:workout_logger/data/datasources/local_data_source.dart';
import 'package:workout_logger/domain/entities/routine.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/domain/entities/routine_item.dart';

class DatabaseDataSource implements LocalDataSource {
  final MyDatabase db;

  DatabaseDataSource(this.db);

  @override
  Future<Routine> getCurrentRoutine() async {}

  @override
  Future<Routine> updateRoutine(Routine routine) async {}

  @override
  Future<Function> deleteRoutine(int id) async {}

  @override
  Future<Routine> addRoutine(Routine routine) async {
    return db.routinesDao.addOrUpdateRoutine(routine);
  }

  @override
  Future<Routine> getRoutine(int id) async {
  }

  @override
  Future<List<Routine>> getRoutines() async {}

  @override
  Future<RoutineItem> updateRoutineItem(RoutineItem routineItem) {}

  @override
  Future<Function> deleteRoutineItem(int id) {}

  @override
  Future<RoutineItem> addRoutineItem(
    RoutineItem routineItem,
    int routineDayId,
  ) {
    return db.routinesDao.addOrUpdateRoutineItem(routineItem, routineDayId);
  }

  @override
  Future<RoutineItem> getRoutineItem(int id) {}

  @override
  Future<List<RoutineItem>> getRoutineItemsOfRoutineDay(int routineItemId) {}

  @override
  Future<RoutineDay> updateRoutineDay(RoutineDay routineDay) {}

  @override
  Future<Function> deleteRoutineDay(int id) {}

  @override
  Future<RoutineDay> addRoutineDay(RoutineDay routineDay, int routineId) {}

  @override
  Future<RoutineDay> getRoutineDay(int id) {}

  @override
  Future<List<RoutineDay>> getRoutineDaysOfRoutine(int routineId) {}
}
