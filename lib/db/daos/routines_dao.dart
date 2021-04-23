import 'package:built_collection/built_collection.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';
import 'package:workout_logger/db/tables/routines.dart';
import 'package:workout_logger/domain/entities/routine.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/domain/entities/routine_with_days.dart';

import '../db.dart';

part 'routines_dao.g.dart';

@UseDao(
  tables: [RoutinesModel, RoutineDaysModel, RoutineItemsModel],
)
class RoutinesDao extends DatabaseAccessor<MyDatabase> with _$RoutinesDaoMixin {
  RoutinesDao(MyDatabase db) : super(db);

  Future<RoutineModel> _getRoutine(int routineId) async {
    return (select(routinesModel)..where((t) => t.id.equals(routineId)))
        .getSingle();
  }

  Stream<Routine> watchRoutine(int routineId) {
    final routineStream = (select(routinesModel)
          ..where((t) => t.id.equals(routineId)))
        .watchSingle();

    final routineDaysStream =
        db.routineDaysDao.watchRoutineDaysOfRoutine(routineId);

    return Rx.combineLatest2(
      routineStream,
      routineDaysStream,
      (
        RoutineModel routineModel,
        List<RoutineDay> routineDays,
      ) =>
          Routine(
        id: routineModel.id,
        note: routineModel.note,
        name: routineModel.name,
        current: routineModel.current,
        days: BuiltList(routineDays),
      ),
    );
  }

  Stream<Routine> watchCurrentRoutine() {
    final currentRoutineModelStream = (select(routinesModel)
          ..where((t) => t.current.equals(true)))
        .watchSingle();

    return currentRoutineModelStream.switchMap(
        (currentRoutineModel) => watchRoutine(currentRoutineModel.id));
  }

  Stream<List<Routine>> watchRoutines() {
    final routinesModelsStream = select(routinesModel).watch();
    return routinesModelsStream.switchMap((routinesModels) {
      final Map<int, RoutineModel> routinesMap = {
        for (var routineModel in routinesModels) routineModel.id: routineModel
      };

      final ids = routinesMap.keys.toList();

      final Stream<Map<int, List<RoutineDay>>> routineDaysStream =
          db.routineDaysDao.watchRoutineDaysOfRoutines(ids);

      return routineDaysStream.map((routineDaysMap) {
        return [
          for (var id in ids)
            Routine(
              id: routinesMap[id]!.id,
              name: routinesMap[id]!.name,
              note: routinesMap[id]!.note,
              current: routinesMap[id]!.current,
              days: BuiltList(routineDaysMap[id]!),
            )
        ];
      });
    });
  }

  Stream<List<RoutineWithDays>> watchRoutinesWithDays() {
    final routinesStream = select(routinesModel).watch();

    return routinesStream.switchMap((routines) {
      final Map<int, RoutineModel> routinesMap = {
        for (var routineModel in routines) routineModel.id: routineModel
      };

      final ids = routinesMap.keys.toList();

      final daysStream = (select(routineDaysModel)
            ..where((t) => t.routineId.isIn(ids)))
          .watch();

      return daysStream.map((days) {
        final daysMap = <int, List<RoutineDayModel>>{};

        for (final day in days) {
          daysMap.putIfAbsent(day.routineId, () => []).add(day);
        }

        return [
          for (var id in ids)
            RoutineWithDays.fromModel(
              routine: routinesMap[id]!,
              days: daysMap[id] ?? [],
            )
        ];
      });
    });
  }

  Future<int> addRoutine(RoutinesModelCompanion routine) async {
    return into(routinesModel).insert(routine);
  }
}
