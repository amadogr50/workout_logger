import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:workout_logger/db/db.dart';

class RoutineWithDays {
  final Either<RoutineModel, RoutinesModelCompanion> routine;
  final BuiltList<Either<RoutineDayModel, RoutineDaysModelCompanion>> days;

  RoutineWithDays({required this.routine, required this.days});

  RoutineWithDays.fromModel({
    required RoutineModel routine,
    required List<RoutineDayModel> days,
  })   : routine = Left(routine),
        days = BuiltList(days);

  RoutineWithDays.empty()
      : routine = const Right(RoutinesModelCompanion()),
        days = BuiltList();

  RoutineWithDays copyWith({
    Either<RoutineModel, RoutinesModelCompanion>? routine,
    BuiltList<Either<RoutineDayModel, RoutineDaysModelCompanion>>? days,
  }) {
    return RoutineWithDays(
      routine: routine ?? this.routine,
      days: days ?? this.days,
    );
  }
}
