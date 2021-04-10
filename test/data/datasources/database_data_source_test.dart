import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';
import 'package:workout_logger/db/db.dart';
import 'package:workout_logger/domain/datasources/database_data_source.dart';

void main() {
  late DatabaseDataSource dataSource;
  late MyDatabase database;

  setUp(() {
    database = MyDatabase.fromQueryExecutor(VmDatabase.memory());
    dataSource = DatabaseDataSource(database);
  });

  tearDown(() async {
    await database.close();
  });

  // const RoutineItem tRoutineItem1 = RoutineItem(
  //   id: 1,
  //   exercise: Exercise(id: 1),
  //   note: 'Test Note',
  //   restDuration: 60,
  //   sets: null,
  //   order: 1,
  //   groupNumber: 0,
  // );
  // const RoutineItem tRoutineItem2 = RoutineItem(
  //   id: 2,
  //   exercise: 1,
  //   note: 'Test Note',
  //   restDuration: 60,
  //   sets: null,
  //   order: 2,
  //   groupNumber: 0,
  // );
  // const RoutineItem tRoutineItem3 = RoutineItem(
  //   id: 3,
  //   exercise: 1,
  //   note: 'Test Note',
  //   restDuration: 60,
  //   sets: null,
  //   order: 3,
  //   groupNumber: 0,
  // );
  // const RoutineItem tRoutineItem4 = RoutineItem(
  //   id: 4,
  //   exercise: 1,
  //   note: 'Test Note',
  //   restDuration: 60,
  //   sets: null,
  //   order: 4,
  //   groupNumber: 0,
  // );
  // const RoutineDay tRoutineDay1 = RoutineDay(
  //   id: 1,
  //   name: 'Test Routine 1',
  //   items: [tRoutineItem1, tRoutineItem2],
  //   order: 1,
  // );
  // const RoutineDay tRoutineDay2 = RoutineDay(
  //   id: 2,
  //   name: 'Test Routine 2',
  //   items: [tRoutineItem3, tRoutineItem4],
  //   order: 2,
  // );
  // const tRoutine1Id = 1;
  // const Routine tRoutine1 = Routine(
  //   id: tRoutine1Id,
  //   name: 'Test Routine',
  //   current: false,
  //   days: [tRoutineDay1, tRoutineDay2],
  // );

  test('should be able to get an specific exercise with its id', () async {
    // arrange
    const tExerciseId = 1;

    // act
    final exercise = await dataSource.getExercise(tExerciseId);
    // assert
    expect(exercise.id, tExerciseId);
  });

  test('should be able to get all exercises', () async {
    // arrange

    // act
    final exercises = await dataSource.getExercises();
    // assert
    expect(exercises[0].id, 1);
  });

  test('should be able to create a new exercise', () async {
    // arrange
    const tExerciseName = 'New Test';
    const tInstructions = 'New Instructions';
    const tExerciseTypeId = 1;
    const tEquipmentId = 1;
    const tMusclesIds = [1];

    // act
    final exercise = await dataSource.addExercise(
      name: tExerciseName,
      exerciseTypeId: tExerciseTypeId,
      equipmentId: tEquipmentId,
      instructions: tInstructions,
      musclesIds: tMusclesIds,
    );
    // assert
    expect(exercise.name, tExerciseName);
    expect(exercise.instructions, tInstructions);
    expect(exercise.type.id, tExerciseTypeId);
    expect(exercise.equipment.id, tEquipmentId);
    expect(exercise.muscles.map((e) => e.id).toList(), tMusclesIds);
  });
}
