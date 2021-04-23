import 'package:workout_logger/db/db.dart';
import 'package:workout_logger/domain/datasources/local_data_source.dart';
import 'package:workout_logger/domain/entities/day_with_items.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/entities/routine.dart';
import 'package:workout_logger/domain/repositories/routines_repository.dart';

class RoutinesRepositoryImpl implements RoutinesRepository {
  final LocalDataSource localDataSource;

  RoutinesRepositoryImpl(this.localDataSource);

  @override
  Stream<Routine> watchRoutine(int id) {
    return localDataSource.watchRoutine(id);
  }

  @override
  Stream<List<Routine>> watchRoutines() {
    return localDataSource.watchRoutines();
  }

  @override
  Stream<Routine> watchCurrentRoutine() {
    return localDataSource.watchCurrentRoutine();
  }

  @override
  Future<List<DayWithItems>> getDaysWithItemsOfRoutine(int routineId) {
    return localDataSource.getDaysWithItemsOfRoutine(routineId);
  }

  @override
  Future<List<RoutineItemModel>> getItemsOfDay(int routineId) {
    return localDataSource.getItemsOfDay(routineId);
  }

  @override
  Future<Exercise> getExercise(int exerciseId) {
    return localDataSource.getExercise(exerciseId);
  }
}
