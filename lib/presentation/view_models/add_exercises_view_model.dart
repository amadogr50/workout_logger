import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/providers/exercises_repository_provider.dart';
import 'package:workout_logger/domain/repositories/exercises_repository.dart';

final _searchText = StateProvider.autoDispose((ref) => "");
final _equipmentFilter = StateProvider.autoDispose((ref) => null);
final _musclesFilter = StateProvider.autoDispose((ref) => null);
final _exercises = StateProvider.autoDispose<List<Exercise>>((ref) => []);

final filteredExercises = StateProvider.autoDispose<List<Exercise>>((ref) {
  final exercises = ref.watch(_exercises).state;
  return exercises;
});

class AddExercisesViewModel extends ChangeNotifier {
  final Reader read;
  final ExercisesRepository _exercisesRepository;

  AddExercisesViewModel(this._exercisesRepository, this.read);

  Future<void> selectExercise({
    required int routineDayId,
    required int exerciseId,
  }) async {}

  Future<void> onSave() async {}

  Future<void> onCancel() async {}
}

final exercisesViewModelProvider = ChangeNotifierProvider((ref) =>
    AddExercisesViewModel(ref.read(exercisesRepositoryProvider), ref.read));
