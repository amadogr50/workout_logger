import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/providers/exercises_repository_provider.dart';
import 'package:workout_logger/domain/repositories/exercises_repository.dart';

class ExercisesViewModel extends ChangeNotifier {
  final ExercisesRepository _exercisesRepository;

  ExercisesViewModel(this._exercisesRepository);

  Future<Exercise> addExercise({
    required String name,
    required int exerciseTypeId,
    required int equipmentId,
    required String instructions,
    required List<int> musclesIds,
  }) async {
    return _exercisesRepository.addExercise(
      name: name,
      exerciseTypeId: exerciseTypeId,
      equipmentId: equipmentId,
      instructions: instructions,
      musclesIds: musclesIds,
    );
  }
}

final exercisesViewModelProvider = ChangeNotifierProvider(
    (ref) => ExercisesViewModel(ref.read(exercisesRepositoryProvider)));
