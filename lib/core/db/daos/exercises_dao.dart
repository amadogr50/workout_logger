import 'package:moor/moor.dart';
import 'package:workout_logger/core/db/db.dart';
import 'package:workout_logger/core/db/tables/exercises.dart';
import 'package:workout_logger/domain/entities/equipment.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/entities/exercise_type.dart';
import 'package:workout_logger/domain/entities/muscles.dart';

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

  Future<Equipment> getEquipment(int equipmentId) async {
    final EquipmentModel equipmentModel = await (select(equipmentsModel)
          ..where((t) => t.id.equals(equipmentId)))
        .getSingle();
    final String equipmentName =
        await db.i18nDao.getTranslation(equipmentModel.i18nName);
    return EquipmentsModel.createEntity(equipmentModel, equipmentName);
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
}
