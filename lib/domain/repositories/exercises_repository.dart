import 'package:workout_logger/domain/entities/exercise.dart';

abstract class ExercisesRepository {

  Future<Exercise> addExercise({
    required String name,
    required int exerciseTypeId,
    required int equipmentId,
    required String instructions,
    required List<int> musclesIds,
  });

  Stream<List<Exercise>> watchExercises();
}
