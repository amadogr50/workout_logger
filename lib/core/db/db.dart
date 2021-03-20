import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:workout_logger/core/db/daos/exercises_dao.dart';

import 'tables/exercises.dart';
import 'tables/i18n.dart';
import 'tables/routines.dart';
import 'tables/sessions.dart';

part 'db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [
  I18n,
  Translations,
  Locales,
  Exercises,
  ExercisesTypes,
  Equipments,
  ExercisesMuscles,
  Muscles,
  Sessions,
  SessionItems,
  UnitSystems,
  Routines,
  RoutineDays,
  RoutineItems,
], daos: [
  ExercisesDao
])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
