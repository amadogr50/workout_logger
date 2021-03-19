import 'package:workout_logger/domain/entities/routine.dart';
import 'package:workout_logger/domain/repositories/routines_repository.dart';

class GetRoutines {
  final RoutinesRepository repository;

  GetRoutines(this.repository);

  Future<List<Routine>> execute() async {
    return repository.getRoutines();
  }
}