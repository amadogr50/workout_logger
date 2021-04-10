import 'package:moor/moor.dart';
import 'package:workout_logger/db/tables/routines.dart';
import 'package:workout_logger/domain/entities/routine.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/domain/entities/routine_item.dart';

import '../db.dart';

part 'routines_dao.g.dart';

@UseDao(
  tables: [RoutinesModel, RoutineDaysModel, RoutineItemsModel],
)
class RoutinesDao extends DatabaseAccessor<MyDatabase> with _$RoutinesDaoMixin {
  RoutinesDao(MyDatabase db) : super(db);

  // void getCurrentRoutine() {
  //   final currentRoutineQuery = select(routines)
  //     ..where((t) => t.current.equals(true));
  //
  //   final daysQuery = select(routineDays).join([
  //     innerJoin(routineDays, routineDays.routineId.equalsExp())
  //   ])
  // }

// Future<List<Routine>> getRoutines() async {
//
// }
//
// Future<Routine> getRoutine(int id) async {
//
// }
//
  Future<Routine> addOrUpdateRoutine(Routine routine) async {
    final routineCompanion = RoutinesModel.createCompanion(routine);
    final routineId =
        await into(routinesModel).insertOnConflictUpdate(routineCompanion);

    if (routine.days.isNotEmpty) {
      for (final routineDay in routine.days) {
        await _addOrUpdateRoutineDay(routineDay, routineId);
      }
    }

    return getRoutine(routineId);
  }

  Future<Routine> addEmptyRoutine() async {
    final routineId = await _addRoutine(const RoutinesModelCompanion());
    return getRoutine(routineId);
  }

  Future<int> _addRoutine(RoutinesModelCompanion routinesModelCompanion) async {
    return into(routinesModel).insertOnConflictUpdate(routinesModelCompanion);
  }

  Future<Routine> getRoutine(int routineId) async {
    final routineModel = await (select(routinesModel)
          ..where((table) => table.id.equals(routineId)))
        .getSingle();
    final routineDays = await getRoutineDaysOfRoutine(routineModel.id);
    return RoutinesModel.createEntity(routineModel, routineDays);
  }

  Future<List<RoutineDay>> getRoutineDaysOfRoutine(
    int routineId,
  ) async {
    final List<RoutineDayModel> _routineDayModels =
        await (select(routineDaysModel)
              ..where((t) => t.routineId.equals(routineId))
              ..orderBy([(t) => OrderingTerm(expression: t.order)]))
            .get();

    return Future.wait(_routineDayModels.map((routineDayModel) async {
      final routineItems =
          await getRoutineItemsOfRoutineDay(routineDayModel.id);
      return RoutineDaysModel.createEntity(routineDayModel, routineItems);
    }));
  }

  Future<int> _addOrUpdateRoutineDay(
    RoutineDay routineDay,
    int routineId,
  ) async {
    final routineDayCompanion =
        RoutineDaysModel.createCompanion(routineDay, routineId);
    final routineDayId = await into(routineDaysModel)
        .insertOnConflictUpdate(routineDayCompanion);

    if (routineDay.items.isNotEmpty) {
      for (final routineItem in routineDay.items) {
        await _addOrUpdateRoutineItem(routineItem, routineDayId);
      }
    }

    return routineDayId;
  }

  Future<RoutineDay> addOrUpdateRoutineDay(
    RoutineDay routineDay,
    int routineId,
  ) async {
    final routineDayId = await _addOrUpdateRoutineDay(routineDay, routineId);
    final routineDayModel = await (select(routineDaysModel)
          ..where((t) => t.id.equals(routineDayId)))
        .getSingle();
    final routineItems = await getRoutineItemsOfRoutineDay(routineDayId);
    return RoutineDaysModel.createEntity(routineDayModel, routineItems);
  }

  Future<List<RoutineItem>> getRoutineItemsOfRoutineDay(
    int routineDayId,
  ) async {
    final routineItemsModels = await (select(routineItemsModel)
          ..where((table1) => table1.id.equals(routineDayId))
          ..orderBy([(table) => OrderingTerm(expression: table.order)]))
        .get();
    return Future.wait(routineItemsModels.map((routineItemModel) async {
      final exercise =
          await db.exercisesDao.getExercise(routineItemModel.exerciseId);
      return RoutineItemsModel.createEntity(routineItemModel, exercise);
    }));
  }

  Future<int> _addOrUpdateRoutineItem(
    RoutineItem routineItem,
    int routineDayId,
  ) async {
    final routineItemCompanion =
        RoutineItemsModel.createCompanion(routineItem, routineDayId);
    return into(routineItemsModel).insertOnConflictUpdate(routineItemCompanion);
  }

  Future<RoutineItem> addOrUpdateRoutineItem(
    RoutineItem routineItem,
    int routineDayId,
  ) async {
    final routineItemId =
        await _addOrUpdateRoutineItem(routineItem, routineDayId);
    final routineItemModel = await (select(routineItemsModel)
          ..where((table1) => table1.id.equals(routineItemId)))
        .getSingle();
    final exercise =
        await db.exercisesDao.getExercise(routineItemModel.exerciseId);
    return RoutineItemsModel.createEntity(routineItemModel, exercise);
  }

  Future<Routine> addBaseRoutine(
      RoutinesModelCompanion routineCompanion) async {
    final id = await into(routinesModel).insert(routineCompanion);
    final routineModel = await (select(routinesModel)
          ..where((table) => table.id.equals(id)))
        .getSingle();
    final routine = Routine(
        id: routineModel.id,
        name: routineModel.name,
        current: routineModel.current,
        days: const []);

    return routine;
  }

//
// Future<void> deleteRoutine(int id) async {
//
// }
//
// Future<Routine> updateRoutine(Routine routine) async {
//
// }

}
