import 'package:built_collection/built_collection.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';
import 'package:workout_logger/db/db.dart';
import 'package:workout_logger/db/tables/routines.dart';
import 'package:workout_logger/domain/entities/day_with_items.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/domain/entities/routine_item.dart';

part 'routine_days_dao.g.dart';

@UseDao(
  tables: [RoutineDaysModel, RoutineItemsModel],
)
class RoutineDaysDao extends DatabaseAccessor<MyDatabase>
    with _$RoutineDaysDaoMixin {
  RoutineDaysDao(MyDatabase db) : super(db);

  Future<RoutineDayModel> _getRoutineDay(int routineDayId) async {
    return (select(routineDaysModel)..where((t) => t.id.equals(routineDayId)))
        .getSingle();
  }

  Stream<List<RoutineDay>> watchRoutineDaysOfRoutine(int routineId) {
    final routineDaysModelsStream = (select(routineDaysModel)
          ..where((t) => t.id.equals(routineId)))
        .watch();
    return routineDaysModelsStream.switchMap((routineDaysModels) {
      final Map<int, RoutineDayModel> routineDaysMap = {
        for (var routineDayModel in routineDaysModels)
          routineDayModel.id: routineDayModel
      };

      final ids = routineDaysMap.keys.toList();

      final Stream<Map<int, List<RoutineItem>>> routineItemsMapStream =
          db.routineItemsDao.watchRoutineDayItemsInRoutineDay(ids);

      return routineItemsMapStream.map((routineItemsMap) {
        return [
          for (var id in ids)
            RoutineDay(
              id: routineDaysMap[id]!.id,
              name: routineDaysMap[id]!.name,
              note: routineDaysMap[id]!.note,
              items: BuiltList(routineItemsMap[id]!),
              order: routineDaysMap[id]!.order,
            )
        ];
      });
    });
  }

  Stream<Map<int, List<RoutineDay>>> watchRoutineDaysOfRoutines(
    List<int> routineIds,
  ) {
    final routineDaysModelsStream =
        (select(routineDaysModel)..where((t) => t.id.isIn(routineIds))).watch();

    return routineDaysModelsStream.switchMap((routineDaysModels) {
      final Map<int, RoutineDayModel> dayIdToRoutineDaysModels = {
        for (var routineDayModel in routineDaysModels)
          routineDayModel.id: routineDayModel
      };

      final routineDayIds = dayIdToRoutineDaysModels.keys.toList();

      final Stream<Map<int, List<RoutineItem>>>
          routineDayIdToRoutineItemsStream =
          db.routineItemsDao.watchRoutineDayItemsInRoutineDay(routineDayIds);

      return routineDayIdToRoutineItemsStream.map((routineDayIdToRoutineItems) {
        final Map<int, List<RoutineDay>> routineIdToRoutineDays = {
          for (var routineId in routineIds) routineId: []
        };

        for (final routineDayId in routineDayIds) {
          final routineDayModel = dayIdToRoutineDaysModels[routineDayId]!;

          final routineDay = RoutineDay(
            id: routineDayModel.id,
            name: routineDayModel.name,
            note: routineDayModel.note,
            items: BuiltList(routineDayIdToRoutineItems[routineDayId]!),
            order: routineDayModel.order,
          );

          routineIdToRoutineDays[routineDayModel.routineId]!.add(routineDay);
        }

        return routineIdToRoutineDays;
      });
    });
  }

  Future<int> addRoutineDay(RoutineDaysModelCompanion routineDay) async {
    return into(routineDaysModel).insert(routineDay);
  }

  Future<void> addRoutineDayToRoutine({
    required int routineId,
    required int routineDayId,
  }) async {
    final RoutineDayModel routineDayModel = await _getRoutineDay(routineDayId);
    final RoutineDaysModelCompanion routineDay = RoutineDaysModelCompanion(
      id: Value(routineDayModel.id),
      routineId: Value(routineId),
      name: Value(routineDayModel.name),
      order: Value(routineDayModel.order),
    );
    await into(routineDaysModel).insert(routineDay);
  }

  Future<List<DayWithItems>> getDaysWithItemsOfRoutine(int routineId) async {
    final days = await (select(routineDaysModel)
          ..where((t) => t.routineId.equals(routineId)))
        .get();

    return Future.wait(days.map((day) async {
      final items = await (select(routineItemsModel)
            ..where((t) => t.routineDayId.equals(day.id)))
          .get();

      return DayWithItems.fromModel(day: day, items: items);
    }).toList());
  }
}
