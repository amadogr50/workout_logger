import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:workout_logger/core/db/daos/exercises_dao.dart';

import 'daos/i18n_dao.dart';
import 'daos/routines_dao.dart';
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

@UseMoor(
  tables: [
    I18n,
    Translations,
    Locales,
    ExercisesModel,
    ExercisesTypesModel,
    EquipmentsModel,
    ExercisesMusclesModel,
    MusclesModel,
    SessionsModel,
    SessionItemsModel,
    UnitSystemsModel,
    RoutinesModel,
    RoutineDaysModel,
    RoutineItemsModel,
  ],
  daos: [
    I18nDao,
    ExercisesDao,
    RoutinesDao,
  ],
)
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  MyDatabase.fromQueryExecutor(QueryExecutor queryExecutor)
      : super(queryExecutor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          if (details.wasCreated) {
            // Locales
            final enId = await into(locales)
                .insert(const LocalesCompanion(locale: Value("en")));

            // I18n
            final exerciseType1I18nId =
                await into(i18n).insert(const I18nCompanion());
            await into(translations).insert(TranslationsCompanion(
                i18nId: Value(exerciseType1I18nId),
                localeId: Value(enId),
                textTranslation: const Value("Weight-Based")));

            final equipment1I18nId =
                await into(i18n).insert(const I18nCompanion());
            await into(translations).insert(TranslationsCompanion(
                i18nId: Value(equipment1I18nId),
                localeId: Value(enId),
                textTranslation: const Value("Barbell")));

            final muscle1I18nId =
                await into(i18n).insert(const I18nCompanion());
            await into(translations).insert(TranslationsCompanion(
                i18nId: Value(muscle1I18nId),
                localeId: Value(enId),
                textTranslation: const Value("Chest")));

            final exercise1I18nId =
                await into(i18n).insert(const I18nCompanion());
            await into(translations).insert(TranslationsCompanion(
                i18nId: Value(exercise1I18nId),
                localeId: Value(enId),
                textTranslation: const Value("Bench Press")));

            // Exercises Types
            final exerciseType1Id = await into(exercisesTypesModel).insert(
                ExercisesTypesModelCompanion(
                    i18nName: Value(exerciseType1I18nId)));

            // Equipments
            final equipment1Id = await into(equipmentsModel).insert(
                EquipmentsModelCompanion(i18nName: Value(equipment1I18nId)));

            // Muscles
            final muscle1Id = await into(musclesModel)
                .insert(MusclesModelCompanion(i18nName: Value(muscle1I18nId)));

            // Exercises
            final exercise1Id = await into(exercisesModel).insert(
                ExercisesModelCompanion(
                    exerciseTypeId: Value(exerciseType1Id),
                    equipmentId: Value(equipment1Id),
                    i18nName: Value(exercise1I18nId)));
            await into(exercisesMusclesModel).insert(
                ExercisesMusclesModelCompanion(
                    exerciseId: Value(exercise1Id),
                    muscleId: Value(muscle1Id)));
          }
        },
      );
}
