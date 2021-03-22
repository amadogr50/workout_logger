import 'package:moor/moor.dart';
import 'package:workout_logger/core/db/db.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/entities/routine.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/domain/entities/routine_item.dart';

@DataClassName('RoutineModel')
class RoutinesModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  BoolColumn get current => boolean().withDefault(const Constant(false))();

  @override
  String get tableName => 'routines';

  static RoutinesModelCompanion createCompanion(Routine routine) {
    return RoutinesModelCompanion(
      id: Value(routine.id),
      name: Value(routine.name),
      current: Value(routine.current),
    );
  }

  static Routine createEntity(
    RoutineModel routineModel,
    List<RoutineDay> routineDays,
  ) {
    return Routine(
      id: routineModel.id,
      name: routineModel.name,
      current: routineModel.current,
      days: routineDays,
    );
  }
}

@DataClassName('RoutineDayModel')
class RoutineDaysModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get routineId =>
      integer().customConstraint('NULL REFERENCES routines(id)')();

  TextColumn get name => text()();

  IntColumn get order => integer()();

  @override
  String get tableName => 'routine_days';

  static RoutineDaysModelCompanion createCompanion(
      RoutineDay routineDay, int routineId) {
    return RoutineDaysModelCompanion(
      id: Value(routineDay.id),
      routineId: Value(routineId),
      name: Value(routineDay.name),
      order: Value(routineDay.order),
    );
  }

  static RoutineDay createEntity(
    RoutineDayModel routineDaysModel,
    List<RoutineItem> routineItems,
  ) {
    return RoutineDay(
      id: routineDaysModel.id,
      name: routineDaysModel.name,
      items: routineItems,
      order: routineDaysModel.order,
    );
  }
}

@DataClassName('RoutineItemModel')
class RoutineItemsModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get routineDayId =>
      integer().customConstraint('NULL REFERENCES routine_days(id)')();

  IntColumn get exerciseId =>
      integer().customConstraint('NULL REFERENCES exercises(id)')();

  TextColumn get note => text()();

  IntColumn get restDuration => integer()();

  IntColumn get order => integer()();

  IntColumn get groupNumber => integer().nullable()();

  @override
  String get tableName => 'routine_items';

  static RoutineItemsModelCompanion createCompanion(
    RoutineItem routineItem,
    int routineDayId,
  ) {
    return RoutineItemsModelCompanion(
      id: Value(routineItem.id),
      routineDayId: Value(routineDayId),
      exerciseId: routineItem.exercise != null ? Value(routineItem.exercise.id) : null,
      note: Value(routineItem.note),
      restDuration: Value(routineItem.restDuration),
      order: Value(routineItem.order),
      groupNumber: Value(routineItem.groupNumber),
    );
  }

  static RoutineItem createEntity(
      RoutineItemModel routineItemModel, Exercise exercise) {
    return RoutineItem(
      id: routineItemModel.id,
      exercise: exercise,
      note: routineItemModel.note,
      restDuration: routineItemModel.restDuration,
      sets: null,
      // TODO: Implement sets
      order: routineItemModel.order,
      groupNumber: routineItemModel.groupNumber,
    );
  }
}
