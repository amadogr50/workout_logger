import 'package:workout_logger/domain/datasources/local_data_source.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/repositories/exercises_repository.dart';

class ExercisesRepositoryImpl implements ExercisesRepository {
  final LocalDataSource localDataSource;

  ExercisesRepositoryImpl(this.localDataSource);

  @override
  Future<Exercise> addExercise({
    required String name,
    required int exerciseTypeId,
    required int equipmentId,
    required String instructions,
    required List<int> musclesIds,
  }) {
    return localDataSource.addExercise(
      name: name,
      exerciseTypeId: exerciseTypeId,
      equipmentId: equipmentId,
      instructions: instructions,
      musclesIds: musclesIds,
    );
  }
}
