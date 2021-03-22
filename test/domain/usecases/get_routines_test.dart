import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:workout_logger/domain/entities/routine.dart';
import 'package:workout_logger/domain/repositories/routines_repository.dart';
import 'package:workout_logger/domain/usecases/get_routines.dart';

class MockRoutinesRepository extends Mock implements RoutinesRepository {}

void main() {
  GetRoutines usecase;
  MockRoutinesRepository mockRoutinesRepository;

  setUp(() {
    mockRoutinesRepository = MockRoutinesRepository();
    usecase = GetRoutines(mockRoutinesRepository);
  });
}
