import 'package:moor/moor.dart';
import 'package:workout_logger/core/db/db.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/entities/routine.dart';

@DataClassName('ExerciseModel')
class ExercisesModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get exerciseTypeId =>
      integer().customConstraint('NULL REFERENCES exercises_types(id)')();

  IntColumn get equipmentId =>
      integer().customConstraint('NULL REFERENCES equipments(id)')();

  IntColumn get i18nName =>
      integer().customConstraint('NULL REFERENCES i18n(id)')();

  TextColumn get instructions => text().nullable()();

  @override
  String get tableName => 'exercises';

  @override
  ExercisesModelCompanion createCompanion(Exercise entity) {

  }
}

@DataClassName('ExercisesTypeModel')
class ExercisesTypesModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get i18nName =>
      integer().customConstraint('NULL REFERENCES i18n(id)')();

  @override
  String get tableName => 'exercises_types';
}

@DataClassName('EquipmentModel')
class EquipmentsModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get i18nName =>
      integer().customConstraint('NULL REFERENCES i18n(id)')();

  @override
  String get tableName => 'equipments';
}

@DataClassName('ExercisesMuscleModel')
class ExercisesMusclesModel extends Table {
  IntColumn get exerciseId =>
      integer().customConstraint('NULL REFERENCES exercises(id)')();

  IntColumn get muscleId =>
      integer().customConstraint('NULL REFERENCES muscles(id)')();

  @override
  String get tableName => 'exercises_muscles';
}

@DataClassName('MuscleModel')
class MusclesModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get i18nName =>
      integer().customConstraint('NULL REFERENCES i18n(id)')();

  @override
  String get tableName => 'muscles';
}
