import 'package:moor/moor.dart';

class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get exerciseTypeId => integer().customConstraint('NULL REFERENCES exercises_types(id)')();
  IntColumn get equipmentId => integer().customConstraint('NULL REFERENCES equipments(id)')();
  IntColumn get i18nName => integer().customConstraint('NULL REFERENCES i18n(id)')();
  TextColumn get instructions => text().nullable()();
}

@DataClassName("ExerciseType")
class ExercisesTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get i18nName => integer().customConstraint('NULL REFERENCES i18n(id)')();
}

class Equipments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get i18nName => integer().customConstraint('NULL REFERENCES i18n(id)')();
}

class ExercisesMuscles extends Table {
  IntColumn get exerciseId => integer().customConstraint('NULL REFERENCES exercises(id)')();
  IntColumn get muscleId => integer().customConstraint('NULL REFERENCES muscles(id)')();
}

class Muscles extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get i18nName => integer().customConstraint('NULL REFERENCES i18n(id)')();
}