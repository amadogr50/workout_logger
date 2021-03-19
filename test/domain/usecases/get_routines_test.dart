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

  final routines = [const Routine('1234'), const Routine('2345')];

  test('should get routines from the repository', () async {
    // arrange
    when(mockRoutinesRepository.getRoutines()).thenAnswer((_) async {
      return routines;
    });
    // act
    final result = await usecase.execute();
    // assert
    expect(result, routines);
    verify(mockRoutinesRepository.getRoutines());
  });
}
