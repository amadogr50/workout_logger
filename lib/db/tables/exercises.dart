import 'package:moor/moor.dart';
import 'package:workout_logger/domain/entities/equipment.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/entities/exercise_type.dart';
import 'package:workout_logger/domain/entities/muscles.dart';

import '../db.dart';

@DataClassName('ExerciseModel')
class ExercisesModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get exerciseTypeId =>
      integer().customConstraint('NULL REFERENCES exercises_types(id)')();

  IntColumn get equipmentId =>
      integer().customConstraint('NULL REFERENCES equipments(id)')();

  TextColumn get i18nName =>
      text().customConstraint('NULL REFERENCES i18n(id)')();

  TextColumn? get i18nInstructions =>
      text().nullable().customConstraint('NULL REFERENCES i18n(id)')();

  @override
  String get tableName => 'exercises';

  static Exercise createEntity({
    required ExerciseModel exerciseModel,
    required String name,
    String? instructions,
    required ExerciseType type,
    required List<Muscle> muscles,
    required Equipment equipment,
  }) {
    return Exercise(
      id: exerciseModel.id,
      name: name,
      type: type,
      instructions: instructions,
      muscles: muscles,
      equipment: equipment,
    );
  }
}

@DataClassName('ExerciseTypeModel')
class ExercisesTypesModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get i18nName =>
      text().customConstraint('NULL REFERENCES i18n(id)')();

  @override
  String get tableName => 'exercises_types';

  static ExerciseType createEntity(
    ExerciseTypeModel exerciseTypeModel,
    String name,
  ) {
    return ExerciseType(id: exerciseTypeModel.id, name: name);
  }
}

@DataClassName('EquipmentModel')
class EquipmentsModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get i18nName =>
      text().customConstraint('NULL REFERENCES i18n(id)')();

  @override
  String get tableName => 'equipments';

  static Equipment createEntity(EquipmentModel equipmentModel, String name) {
    return Equipment(
      id: equipmentModel.id,
      name: name,
    );
  }
}

@DataClassName('ExercisesMuscleModel')
class ExercisesMusclesModel extends Table {
  IntColumn get exerciseId =>
      integer().customConstraint('NULL REFERENCES exercises(id)')();

  IntColumn get muscleId =>
      integer().customConstraint('NULL REFERENCES muscles(id)')();

  @override
  String get tableName => 'exercises_muscles';

  static ExerciseType createEntity(
    ExerciseTypeModel exerciseTypeModel,
    String name,
  ) {
    return ExerciseType(id: exerciseTypeModel.id, name: name);
  }
}

@DataClassName('MuscleModel')
class MusclesModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get i18nName =>
      text().customConstraint('NULL REFERENCES i18n(id)')();

  @override
  String get tableName => 'muscles';

  static Muscle createEntity(MuscleModel muscleModel, String name) {
    return Muscle(id: muscleModel.id, name: name);
  }
}
