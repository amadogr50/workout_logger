import 'package:moor/moor.dart';
import 'package:workout_logger/domain/entities/set.dart';

@DataClassName('RoutineModel')
class RoutinesModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get note => text().nullable()();

  BoolColumn get current => boolean().withDefault(const Constant(false))();

  @override
  String get tableName => 'routines';
}

@DataClassName('RoutineDayModel')
class RoutineDaysModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get routineId =>
      integer().customConstraint('NULL REFERENCES routines(id)')();

  TextColumn get name => text()();

  TextColumn get note => text()();

  IntColumn get order => integer()();

  @override
  String get tableName => 'routine_days';
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

  IntColumn get groupNumber => integer().withDefault(const Constant(0))();

  TextColumn get sets => text().map(const SetConverter())();

  @override
  String get tableName => 'routine_items';
}
