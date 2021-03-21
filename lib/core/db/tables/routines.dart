import 'package:moor/moor.dart';

class Routines extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get current => boolean().withDefault(const Constant(false))();
}

class RoutineDays extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get routineId => integer().customConstraint('NULL REFERENCES routines(id)')();
  TextColumn get name => text()();
  IntColumn get order => integer()();
}

class RoutineItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get routineDayId => integer().customConstraint('NULL REFERENCES routine_days(id)')();
  IntColumn get exerciseId => integer().customConstraint('NULL REFERENCES exercises(id)')();
  TextColumn get note => text()();
  IntColumn get restDuration => integer()();
  IntColumn get order => integer()();
  IntColumn get groupNumber => integer().nullable()();
}