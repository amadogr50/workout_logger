import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:workout_logger/db/daos/routine_days_dao.dart';
import 'package:workout_logger/db/daos/routine_items_dao.dart';
import 'package:workout_logger/domain/entities/set.dart';

import 'daos/exercises_dao.dart';
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
    final file = File(p.join(dbFolder.path, 'dbxd.sqlite'));
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
    RoutineDaysDao,
    RoutineItemsDao,
  ],
)
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  MyDatabase.fromQueryExecutor(QueryExecutor queryExecutor)
      : super(queryExecutor);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          print("WasCreated: ${details.wasCreated}");

          if (details.wasCreated) {
            // Locales
            final String localesJson =
                await rootBundle.loadString('assets/data/locales.json');
            final localesArr = jsonDecode(localesJson) as List;
            for (final localeJson in localesArr) {
              final locale = (localeJson as Map)["locale"] as String;
              await into(locales)
                  .insert(LocalesCompanion(locale: Value(locale)));
            }

            print("Locales Created Successfully");

            // I18n
            final String languagesTranslationsJson =
                await rootBundle.loadString('assets/data/translations.json');
            final languagesTranslations =
                jsonDecode(languagesTranslationsJson) as Map<String, dynamic>;
            for (final language in languagesTranslations.entries) {
              for (final translation in language.value.entries) {
                await into(i18n).insert(I18nCompanion(
                  id: Value(translation.key as String),
                ));
                await into(translations).insert(TranslationsCompanion(
                  i18nId: Value(translation.key as String),
                  localeId: Value(language.key),
                  textTranslation: Value(translation.value as String),
                ));
              }
            }

            print("I18n Created Successfully");

            // Exercises Types
            final String exercisesTypesJson =
                await rootBundle.loadString('assets/data/exercises_types.json');
            final exercisesTypes = jsonDecode(exercisesTypesJson) as List;
            for (final exerciseTypeJson in exercisesTypes) {
              final exerciseTypeMap = exerciseTypeJson as Map;

              await into(exercisesTypesModel).insert(
                ExercisesTypesModelCompanion(
                  id: Value(exerciseTypeMap["id"] as int),
                  i18nName: Value(exerciseTypeMap["i18nName"] as String),
                ),
              );
            }

            print("Exercises Types Created Successfully");

            // Equipments
            final String equipmentsJson =
                await rootBundle.loadString('assets/data/equipments.json');
            final equipments = jsonDecode(equipmentsJson) as List;
            for (final equipmentJson in equipments) {
              final equipmentMap = equipmentJson as Map;

              await into(equipmentsModel).insert(
                EquipmentsModelCompanion(
                  id: Value(equipmentMap["id"] as int),
                  i18nName: Value(equipmentMap["i18nName"] as String),
                ),
              );
            }

            print("Equipments Created Successfully");

            // Muscles
            final String musclesJson =
                await rootBundle.loadString('assets/data/muscles.json');
            final muscles = jsonDecode(musclesJson) as List;
            for (final muscleJson in muscles) {
              final muscleMap = muscleJson as Map;
              await into(musclesModel).insert(
                MusclesModelCompanion(
                  id: Value(muscleMap["id"] as int),
                  i18nName: Value(muscleMap["i18nName"] as String),
                ),
              );
            }

            print("Muscles Created Successfully");

            // Exercises
            final String exercisesJson =
                await rootBundle.loadString('assets/data/exercises.json');
            final exercises = jsonDecode(exercisesJson) as List;
            for (final exerciseJson in exercises) {
              final exerciseMap = exerciseJson as Map;
              await into(exercisesModel).insert(
                ExercisesModelCompanion(
                  id: Value(exerciseMap["id"] as int),
                  exerciseTypeId: Value(exerciseMap["exerciseTypeId"] as int),
                  equipmentId: Value(exerciseMap["equipmentId"] as int),
                  i18nName: Value(exerciseMap["i18nName"] as String),
                  i18nInstructions:
                      Value(exerciseMap["i18nInstructions"] as String),
                ),
              );
            }

            print("Exercises Created Successfully");

            // Exercises-Muscles
            final String exercisesMusclesJson = await rootBundle
                .loadString('assets/data/exercises_muscles.json');
            final exercisesMuscles = jsonDecode(exercisesMusclesJson) as List;
            for (final exerciseMuscleJson in exercisesMuscles) {
              final exerciseMuscleMap = exerciseMuscleJson as Map;
              await into(exercisesMusclesModel).insert(
                ExercisesMusclesModelCompanion(
                  exerciseId: Value(exerciseMuscleMap["exerciseId"] as int),
                  muscleId: Value(exerciseMuscleMap["muscleId"] as int),
                ),
              );
            }

            print("Exercises-Muscles Created Successfully");
          }
        },
      );
}
