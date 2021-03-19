import 'package:workout_logger/domain/entities/routine.dart';

abstract class RoutinesRepository {
  Future<List<Routine>> getRoutines();
  Future<Routine> getRoutine(int id);
}