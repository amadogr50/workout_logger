import 'package:workout_logger/domain/entities/routine.dart';

abstract class RoutinesRepository {
  Stream<Routine> watchCurrentRoutine();
  Stream<List<Routine>> watchRoutines();
  Stream<Routine> watchRoutine(int id);
}
