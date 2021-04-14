import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';
import 'package:workout_logger/db/db.dart';
import 'package:workout_logger/db/tables/routines.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/entities/routine_item.dart';

part 'routine_items_dao.g.dart';

@UseDao(
  tables: [RoutineItemsModel],
)
class RoutineItemsDao extends DatabaseAccessor<MyDatabase>
    with _$RoutineItemsDaoMixin {
  RoutineItemsDao(MyDatabase db) : super(db);

  Future<RoutineItemModel> _getRoutineItem(int routineItemId) async {
    return (select(routineItemsModel)..where((t) => t.id.equals(routineItemId)))
        .getSingle();
  }

  Stream<Map<int, List<RoutineItem>>> watchRoutineDayItemsInRoutineDay(
    List<int> routineDayIds,
  ) {
    final routineItemsModelsStream = (select(routineItemsModel)
          ..where((t) => t.id.isIn(routineDayIds)))
        .watch();

    return routineItemsModelsStream.switchMap((routineItemsModels) {
      final Map<int, RoutineItemModel> itemIdToRoutineItemsModels = {};
      final itemsIds = [];
      final Set<int> exercisesIds = {};

      for (final routineItemModel in routineItemsModels) {
        itemIdToRoutineItemsModels[routineItemModel.id] = routineItemModel;
        itemsIds.add(routineItemModel.id);
        exercisesIds.add(routineItemModel.exerciseId);
      }

      final Stream<List<Exercise>> exercisesStream =
          db.exercisesDao.watchExercises(exercisesIds.toList());

      return exercisesStream.map((exercises) {
        final exerciseIdToExercise = {
          for (var exercise in exercises) exercise.id: exercise
        };

        final Map<int, List<RoutineItem>> dayIdToItems = {
          for (var dayId in routineDayIds) dayId: []
        };

        for (final itemId in itemsIds) {
          final itemModel = itemIdToRoutineItemsModels[itemId]!;
          final routineItem = RoutineItem(
            id: itemModel.id,
            exercise: exerciseIdToExercise[itemModel.exerciseId]!,
            note: itemModel.note,
            restDuration: itemModel.restDuration,
            sets: [], // TODO: Implement sets
            order: itemModel.order,
            groupNumber: itemModel.groupNumber,
          );
          dayIdToItems[itemModel.routineDayId]!.add(routineItem);
        }

        return dayIdToItems;
      });
    });
  }

  Future<int> addRoutineItem(RoutineItemsModelCompanion routineItem) async {
    return into(routineItemsModel).insert(routineItem);
  }

  Future<void> addRoutineDayToRoutineItem({
    required int routineDayId,
    required int routineItemId,
  }) async {
    final RoutineItemModel routineItemModel =
        await _getRoutineItem(routineItemId);
    final RoutineItemsModelCompanion routineItem = RoutineItemsModelCompanion(
      id: Value(routineItemModel.id),
      routineDayId: Value(routineDayId),
      exerciseId: Value(routineItemModel.exerciseId),
      note: Value(routineItemModel.note),
      restDuration: Value(routineItemModel.restDuration),
      order: Value(routineItemModel.order),
      groupNumber: Value(routineItemModel.groupNumber),
    );
    await addRoutineItem(routineItem);
  }
}
