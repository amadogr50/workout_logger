import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';
import 'package:workout_logger/db/tables/exercises.dart';
import 'package:workout_logger/domain/entities/equipment.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/entities/exercise_type.dart';
import 'package:workout_logger/domain/entities/muscles.dart';

import '../db.dart';

part 'exercises_dao.g.dart';

@UseDao(
  tables: [
    ExercisesModel,
    ExercisesTypesModel,
    EquipmentsModel,
    ExercisesMusclesModel,
    MusclesModel
  ],
)
class ExercisesDao extends DatabaseAccessor<MyDatabase>
    with _$ExercisesDaoMixin {
  ExercisesDao(MyDatabase db) : super(db);

  Future<ExerciseModel> _getExercise(int exerciseId) async {
    return (select(exercisesModel)..where((t) => t.id.equals(exerciseId)))
        .getSingle();
  }

  Future<Exercise> addExercise({
    required String name,
    required int exerciseTypeId,
    required int equipmentId,
    String? instructions,
    required List<int> musclesIds,
  }) async {
    final i18nName = await db.i18nDao.addTranslation(name);
    final i18nInstructions = instructions != null
        ? await db.i18nDao.addTranslation(instructions)
        : null;

    final exerciseId =
        await into(exercisesModel).insert(ExercisesModelCompanion(
      exerciseTypeId: Value(exerciseTypeId),
      equipmentId: Value(equipmentId),
      i18nName: Value(i18nName),
      i18nInstructions: Value(i18nInstructions),
    ));

    for (final muscleId in musclesIds) {
      await into(exercisesMusclesModel).insert(ExercisesMusclesModelCompanion(
        exerciseId: Value(exerciseId),
        muscleId: Value(muscleId),
      ));
    }

    return getExercise(exerciseId);
  }

  Future<List<Exercise>> getExercises() async {
    final List<ExerciseModel> exercisesModels =
        await select(exercisesModel).get();
    return Future.wait(exercisesModels.map((exerciseModel) async {
      final String name =
          await db.i18nDao.getTranslation(exerciseModel.i18nName);
      final String? instructions = exerciseModel.i18nInstructions != null
          ? await db.i18nDao.getTranslation(exerciseModel.i18nInstructions!)
          : null;
      final Equipment equipment = await getEquipment(exerciseModel.equipmentId);
      final List<Muscle> muscles = await getMusclesOfExercise(exerciseModel.id);
      final ExerciseType exerciseType =
          await getExerciseType(exerciseModel.exerciseTypeId);
      return ExercisesModel.createEntity(
        exerciseModel: exerciseModel,
        name: name,
        instructions: instructions,
        type: exerciseType,
        muscles: muscles,
        equipment: equipment,
      );
    }));
  }

  Future<Exercise> getExercise(int exerciseId) async {
    final ExerciseModel exerciseModel = await _getExercise(exerciseId);
    final String name = await db.i18nDao.getTranslation(exerciseModel.i18nName);
    final String? instructions = exerciseModel.i18nInstructions != null
        ? await db.i18nDao.getTranslation(exerciseModel.i18nInstructions!)
        : null;
    final Equipment equipment = await getEquipment(exerciseModel.equipmentId);
    final List<Muscle> muscles = await getMusclesOfExercise(exerciseId);
    final ExerciseType exerciseType =
        await getExerciseType(exerciseModel.exerciseTypeId);
    return ExercisesModel.createEntity(
      exerciseModel: exerciseModel,
      name: name,
      instructions: instructions,
      type: exerciseType,
      muscles: muscles,
      equipment: equipment,
    );
  }

  Stream<Exercise> watchExercise(int exerciseId) {
    final exerciseModelStream = (select(exercisesModel)
          ..where((t) => t.id.equals(exerciseId)))
        .watchSingle();

    return exerciseModelStream.switchMap((exerciseModel) {
      final Stream<String> nameStream =
          db.i18nDao.watchTranslation(exerciseModel.i18nName);
      final Stream<String>? instructionsStream =
          exerciseModel.i18nInstructions != null
              ? db.i18nDao.watchTranslation(exerciseModel.i18nName)
              : null;
      final Stream<Equipment> equipmentStream =
          watchEquipment(exerciseModel.equipmentId);
      final Stream<List<Muscle>> musclesStream =
          watchMusclesOfExercise(exerciseModel.id);
      final Stream<ExerciseType> exerciseType =
          watchExerciseType(exerciseModel.exerciseTypeId);

      if (instructionsStream == null) {
        return Rx.combineLatest4(
            nameStream,
            equipmentStream,
            musclesStream,
            exerciseType,
            (
              String name,
              Equipment equipment,
              List<Muscle> muscles,
              ExerciseType type,
            ) =>
                Exercise(
                  id: exerciseModel.id,
                  name: name,
                  type: type,
                  muscles: muscles,
                  equipment: equipment,
                ));
      }

      return Rx.combineLatest5(
          nameStream,
          instructionsStream,
          equipmentStream,
          musclesStream,
          exerciseType,
          (
            String name,
            String instructions,
            Equipment equipment,
            List<Muscle> muscles,
            ExerciseType type,
          ) =>
              Exercise(
                id: exerciseModel.id,
                name: name,
                instructions: instructions,
                type: type,
                muscles: muscles,
                equipment: equipment,
              ));
    });
  }

  Stream<List<Exercise>> watchExercises(List<int> exercisesIds) {
    final exercisesModelsStream =
        (select(exercisesModel)..where((t) => t.id.isIn(exercisesIds))).watch();

    return exercisesModelsStream.switchMap((exercisesModels) {
      final Map<int, ExerciseModel> exerciseIdToExerciseModel = {};
      final Set<int> exercisesIds = {};
      final Set<int> namesI18nIds = {};
      final Set<int> instructionsI18nIds = {};
      final Set<int> equipmentsIds = {};
      final Set<int> exercisesTypesIds = {};

      for (final exerciseModel in exercisesModels) {
        exerciseIdToExerciseModel[exerciseModel.id] = exerciseModel;
        exercisesIds.add(exerciseModel.id);
        namesI18nIds.add(exerciseModel.i18nName);
        if (exerciseModel.i18nInstructions != null) {
          instructionsI18nIds.add(exerciseModel.i18nInstructions!);
        }
        equipmentsIds.add(exerciseModel.equipmentId);
        exercisesTypesIds.add(exerciseModel.exerciseTypeId);
      }

      final Stream<Map<int, String>> nameIdToNameStream =
          db.i18nDao.watchTranslations(namesI18nIds.toList());
      final Stream<Map<int, String>> instructionIdToInstructionStream =
          db.i18nDao.watchTranslations(instructionsI18nIds.toList());
      final Stream<List<Equipment>> equipmentsStream =
          watchEquipments(equipmentsIds.toList());
      final Stream<List<ExerciseType>> exercisesTypesStream =
          watchExercisesTypes(exercisesTypesIds.toList());
      final Stream<Map<int, List<Muscle>>> exerciseIdToMusclesStream =
          watchMusclesOfExercises(exercisesIds.toList());

      return Rx.combineLatest5(
        nameIdToNameStream,
        instructionIdToInstructionStream,
        equipmentsStream,
        exerciseIdToMusclesStream,
        exercisesTypesStream,
        (
          Map<int, String> nameIdToNames,
          Map<int, String> instructionIdToInstructions,
          List<Equipment> equipments,
          Map<int, List<Muscle>> exerciseIdToMuscles,
          List<ExerciseType> types,
        ) {
          final equipmentIdToEquipments = {
            for (final equipment in equipments) equipment.id: equipment
          };
          final typeIdToTypes = {
            for (final type in types) type.id: type,
          };

          return [
            for (var exerciseModel in exercisesModels)
              Exercise(
                id: exerciseModel.id,
                name: nameIdToNames[exerciseModel.i18nName]!,
                instructions:
                    instructionIdToInstructions[exerciseModel.i18nInstructions],
                type: typeIdToTypes[exerciseModel.exerciseTypeId]!,
                muscles: exerciseIdToMuscles[exerciseModel.id]!,
                equipment: equipmentIdToEquipments[exerciseModel.equipmentId]!,
              )
          ];
        },
      );
    });
  }

  Stream<List<Exercise>> watchAllExercises() {
    final exercisesModelsStream = (select(exercisesModel)).watch();

    return exercisesModelsStream.switchMap((exercisesModels) {
      print("exercisesModelsStream");
      final Map<int, ExerciseModel> exerciseIdToExerciseModel = {};
      final Set<int> exercisesIds = {};
      final Set<int> namesI18nIds = {};
      final Set<int> instructionsI18nIds = {};
      final Set<int> equipmentsIds = {};
      final Set<int> exercisesTypesIds = {};

      for (final exerciseModel in exercisesModels) {
        exerciseIdToExerciseModel[exerciseModel.id] = exerciseModel;
        exercisesIds.add(exerciseModel.id);
        namesI18nIds.add(exerciseModel.i18nName);
        if (exerciseModel.i18nInstructions != null) {
          instructionsI18nIds.add(exerciseModel.i18nInstructions!);
        }
        equipmentsIds.add(exerciseModel.equipmentId);
        exercisesTypesIds.add(exerciseModel.exerciseTypeId);
      }

      final Stream<Map<int, String>> nameIdToNameStream =
          db.i18nDao.watchTranslations(namesI18nIds.toList());
      final Stream<Map<int, String>> instructionIdToInstructionStream =
          db.i18nDao.watchTranslations(instructionsI18nIds.toList());
      final Stream<List<Equipment>> equipmentsStream =
          watchEquipments(equipmentsIds.toList());
      final Stream<List<ExerciseType>> exercisesTypesStream =
          watchExercisesTypes(exercisesTypesIds.toList());
      final Stream<Map<int, List<Muscle>>> exerciseIdToMusclesStream =
          watchMusclesOfExercises(exercisesIds.toList());

      return Rx.combineLatest5(
        nameIdToNameStream,
        instructionIdToInstructionStream,
        equipmentsStream,
        exerciseIdToMusclesStream,
        exercisesTypesStream,
        (
          Map<int, String> nameIdToNames,
          Map<int, String> instructionIdToInstructions,
          List<Equipment> equipments,
          Map<int, List<Muscle>> exerciseIdToMuscles,
          List<ExerciseType> types,
        ) {
          final equipmentIdToEquipments = {
            for (final equipment in equipments) equipment.id: equipment
          };
          final typeIdToTypes = {
            for (final type in types) type.id: type,
          };

          return [
            for (var exerciseModel in exercisesModels)
              Exercise(
                id: exerciseModel.id,
                name: nameIdToNames[exerciseModel.i18nName]!,
                instructions:
                    instructionIdToInstructions[exerciseModel.i18nInstructions],
                type: typeIdToTypes[exerciseModel.exerciseTypeId]!,
                muscles: exerciseIdToMuscles[exerciseModel.id]!,
                equipment: equipmentIdToEquipments[exerciseModel.equipmentId]!,
              )
          ];
        },
      );
    });
  }

  Future<ExerciseType> getExerciseType(int exerciseTypeId) async {
    final ExerciseTypeModel exerciseTypeModel =
        await (select(exercisesTypesModel)
              ..where((t) => t.id.equals(exerciseTypeId)))
            .getSingle();
    final String exerciseTypeName =
        await db.i18nDao.getTranslation(exerciseTypeModel.i18nName);
    return ExercisesTypesModel.createEntity(
        exerciseTypeModel, exerciseTypeName);
  }

  Future<List<ExerciseType>> getExercisesTypes() async {
    final List<ExerciseTypeModel> exercisesTypesModels =
        await select(exercisesTypesModel).get();
    return Future.wait(exercisesTypesModels.map((exerciseTypeModel) async {
      final String exerciseTypeName =
          await db.i18nDao.getTranslation(exerciseTypeModel.i18nName);
      return ExercisesTypesModel.createEntity(
          exerciseTypeModel, exerciseTypeName);
    }));
  }

  Stream<ExerciseType> watchExerciseType(int exerciseTypeId) {
    final Stream<ExerciseTypeModel> exerciseTypeModelStream =
        (select(exercisesTypesModel)..where((t) => t.id.equals(exerciseTypeId)))
            .watchSingle();

    return exerciseTypeModelStream.switchMap((exerciseTypeModel) {
      final Stream<String> nameStream =
          db.i18nDao.watchTranslation(exerciseTypeModel.i18nName);

      return nameStream
          .map((name) => ExerciseType(id: exerciseTypeModel.id, name: name));
    });
  }

  Stream<List<ExerciseType>> watchExercisesTypes(List<int> exercisesTypesIds) {
    final exercisesTypesStream = (select(exercisesTypesModel)
          ..where((t) => t.id.isIn(exercisesTypesIds)))
        .watch();
    return exercisesTypesStream.switchMap((exercisesTypes) {
      final Set<int> namesI18nIds = {};

      for (final exerciseTypeModel in exercisesTypes) {
        namesI18nIds.add(exerciseTypeModel.i18nName);
      }

      final Stream<Map<int, String>> nameIdToNameStream =
          db.i18nDao.watchTranslations(namesI18nIds.toList());

      return nameIdToNameStream.map((nameIdToName) {
        return [
          for (final exerciseTypeModel in exercisesTypes)
            ExerciseType(
              id: exerciseTypeModel.id,
              name: nameIdToName[exerciseTypeModel.i18nName]!,
            )
        ];
      });
    });
  }

  Future<Equipment> getEquipment(int equipmentId) async {
    final EquipmentModel equipmentModel = await (select(equipmentsModel)
          ..where((t) => t.id.equals(equipmentId)))
        .getSingle();
    final String equipmentName =
        await db.i18nDao.getTranslation(equipmentModel.i18nName);
    return EquipmentsModel.createEntity(equipmentModel, equipmentName);
  }

  Future<List<Equipment>> getEquipments() async {
    final List<EquipmentModel> equipmentModels =
        await select(equipmentsModel).get();
    return Future.wait(equipmentModels.map((equipmentModel) async {
      return getEquipment(equipmentModel.id);
    }));
  }

  Stream<Equipment> watchEquipment(int equipmentId) {
    final Stream<EquipmentModel> equipmentModelStream = (select(equipmentsModel)
          ..where((t) => t.id.equals(equipmentId)))
        .watchSingle();

    return equipmentModelStream.switchMap((equipmentModel) {
      final Stream<String> nameStream =
          db.i18nDao.watchTranslation(equipmentModel.i18nName);

      return nameStream
          .map((name) => Equipment(id: equipmentModel.id, name: name));
    });
  }

  Stream<List<Equipment>> watchEquipments(List<int> equipmentsIds) {
    final equipmentsModelsStream = (select(equipmentsModel)
          ..where((t) => t.id.isIn(equipmentsIds)))
        .watch();
    return equipmentsModelsStream.switchMap((equipmentsModels) {
      final Set<int> namesI18nIds = {};

      for (final equipmentModel in equipmentsModels) {
        namesI18nIds.add(equipmentModel.i18nName);
      }

      final Stream<Map<int, String>> nameIdToNameStream =
          db.i18nDao.watchTranslations(namesI18nIds.toList());

      return nameIdToNameStream.map((nameIdToName) {
        return [
          for (final equipmentModel in equipmentsModels)
            Equipment(
              id: equipmentModel.id,
              name: nameIdToName[equipmentModel.i18nName]!,
            )
        ];
      });
    });
  }

  Future<Muscle> getMuscle(int muscleId) async {
    final MuscleModel muscleModel = await (select(musclesModel)
          ..where((t) => t.id.equals(muscleId)))
        .getSingle();
    final String muscleName =
        await db.i18nDao.getTranslation(muscleModel.i18nName);
    return MusclesModel.createEntity(muscleModel, muscleName);
  }

  Future<List<Muscle>> getMusclesOfExercise(int exerciseId) async {
    final List<ExercisesMuscleModel> exercisesMuscleModels =
        await (select(exercisesMusclesModel)
              ..where((t) => t.exerciseId.equals(exerciseId)))
            .get();

    return Future.wait(exercisesMuscleModels.map((exercisesMuscleModel) async {
      return getMuscle(exercisesMuscleModel.muscleId);
    }));
  }

  Future<List<Muscle>> getMuscles() async {
    final List<MuscleModel> muscleModels = await select(musclesModel).get();

    return Future.wait(muscleModels.map((muscleModel) async {
      return getMuscle(muscleModel.id);
    }));
  }

  Stream<List<Muscle>> watchMuscles(List<int> musclesIds) {
    final Stream<List<MuscleModel>> musclesModelsStream =
        (select(musclesModel)..where((t) => t.id.isIn(musclesIds))).watch();
    return musclesModelsStream.switchMap((musclesModels) {
      final Set<int> namesI18nIds = {};

      for (final muscleModel in musclesModels) {
        namesI18nIds.add(muscleModel.i18nName);
      }

      final Stream<Map<int, String>> nameIdToNameStream =
          db.i18nDao.watchTranslations(namesI18nIds.toList());

      return nameIdToNameStream.map((nameIdToName) {
        return [
          for (final muscleModel in musclesModels)
            Muscle(
              id: muscleModel.id,
              name: nameIdToName[muscleModel.i18nName]!,
            )
        ];
      });
    });
  }

  Stream<List<Muscle>> watchMusclesOfExercise(int exerciseId) {
    final Stream<List<ExercisesMuscleModel>> exercisesMusclesModelsStream =
        (select(exercisesMusclesModel)
              ..where((t) => t.exerciseId.equals(exerciseId)))
            .watch();

    return exercisesMusclesModelsStream.switchMap((exercisesMusclesModels) {
      return watchMuscles(exercisesMusclesModels
          .map((exercisesMuscles) => exercisesMuscles.muscleId)
          .toList());
    });
  }

  Stream<Map<int, List<Muscle>>> watchMusclesOfExercises(
    List<int> exerciseIds,
  ) {
    final Stream<List<ExercisesMuscleModel>> exercisesMusclesModelsStream =
        (select(exercisesMusclesModel)
              ..where((t) => t.exerciseId.isIn(exerciseIds)))
            .watch();

    return exercisesMusclesModelsStream.switchMap((exercisesMuscleModels) {
      final Set<int> musclesIds = {};

      for (final exerciseMuscleModel in exercisesMuscleModels) {
        musclesIds.add(exerciseMuscleModel.muscleId);
      }

      final musclesStream = watchMuscles(musclesIds.toList());

      return musclesStream.map((muscles) {
        final Map<int, List<Muscle>> exerciseIdToMuscles = {
          for (var exerciseId in exerciseIds) exerciseId: []
        };

        final muscleIdToMuscle = {
          for (var muscle in muscles) muscle.id: muscle
        };

        for (final exerciseMuscleModel in exercisesMuscleModels) {
          exerciseIdToMuscles[exerciseMuscleModel.exerciseId]!
              .add(muscleIdToMuscle[exerciseMuscleModel.muscleId]!);
        }

        return exerciseIdToMuscles;
      });
    });
  }
}
