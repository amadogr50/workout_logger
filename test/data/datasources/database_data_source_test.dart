import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';
import 'package:workout_logger/core/db/db.dart';
import 'package:workout_logger/data/datasources/database_data_source.dart';
import 'package:workout_logger/domain/entities/routine.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/domain/entities/routine_item.dart';

void main() {
  DatabaseDataSource dataSource;
  MyDatabase database;

  setUp(() {
    database = MyDatabase.fromQueryExecutor(VmDatabase.memory());
    dataSource = DatabaseDataSource(database);
  });

  tearDown(() async {
    await database.close();
  });

  const RoutineItem tRoutineItem1 = RoutineItem(
    id: 1,
    exercise: null,
    note: 'Test Note',
    restDuration: 60,
    sets: null,
    order: 1,
    groupNumber: 0,
  );
  const RoutineItem tRoutineItem2 = RoutineItem(
    id: 2,
    exercise: null,
    note: 'Test Note',
    restDuration: 60,
    sets: null,
    order: 2,
    groupNumber: 0,
  );
  const RoutineItem tRoutineItem3 = RoutineItem(
    id: 3,
    exercise: null,
    note: 'Test Note',
    restDuration: 60,
    sets: null,
    order: 3,
    groupNumber: 0,
  );
  const RoutineItem tRoutineItem4 = RoutineItem(
    id: 4,
    exercise: null,
    note: 'Test Note',
    restDuration: 60,
    sets: null,
    order: 4,
    groupNumber: 0,
  );
  const RoutineDay tRoutineDay1 = RoutineDay(
    id: 1,
    name: 'Test Routine 1',
    items: [tRoutineItem1, tRoutineItem2],
    order: 1,
  );
  const RoutineDay tRoutineDay2 = RoutineDay(
    id: 2,
    name: 'Test Routine 2',
    items: [tRoutineItem3, tRoutineItem4],
    order: 2,
  );
  const tRoutine1Id = 1;
  const Routine tRoutine1 = Routine(
    id: tRoutine1Id,
    name: 'Test Routine',
    current: false,
    days: [tRoutineDay1, tRoutineDay2],
  );

  test('should be able to add a routine', () async {
    // arrange

    // act
    final routine = await dataSource.addRoutine(tRoutine1);
    // assert
    expect(routine, equals(tRoutine1));
  });

  test('should be able to get all routines', () async {
    // arrange

    // act
    final routines = await dataSource.getRoutines();
    // assert
    expect(routines[0], equals(tRoutine1));
  });

  test('should be able to get an specific routine with its id', () async {
    // arrange

    // act
    final routine = await dataSource.getRoutine(tRoutine1Id);
    // assert
    expect(routine, tRoutine1);
  });

  // group('addRoutine', () {
  //
  // });
  //
  // group('deleteRoutine', () {
  //
  // });
  //
  // group('updateRoutine', () {
  //
  // });
}
