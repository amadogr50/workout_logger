import 'package:moor/moor.dart';

@DataClassName('SessionModel')
class SessionsModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get startedAt => dateTime()();

  DateTimeColumn get finishedAt => dateTime()();

  @override
  String get tableName => 'sessions';
}

@DataClassName('SessionItemModel')
class SessionItemsModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get sessionId =>
      integer().customConstraint('NULL REFERENCES sessions(id)')();

  IntColumn get exerciseId =>
      integer().customConstraint('NULL REFERENCES exercises(id)')();

  IntColumn get unitSystemId =>
      integer().customConstraint('NULL REFERENCES unit_systems(id)')();

  IntColumn get order => integer()();

  IntColumn get repetitions => integer()();

  IntColumn get groupNumber => integer().nullable()();

  RealColumn get weight => real()();

  RealColumn get duration => real().nullable()();

  @override
  String get tableName => 'session_items';
}

@DataClassName('UnitSystemModel')
class UnitSystemsModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get i18nName =>
      integer().customConstraint('NULL REFERENCES i18n(id)')();

  @override
  String get tableName => 'unit_systems';
}
