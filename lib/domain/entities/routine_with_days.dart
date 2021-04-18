import 'package:workout_logger/db/db.dart';

class RoutineWithDays {
  final RoutineModel routine;
  final List<RoutineDayModel> days;

  RoutineWithDays({required this.routine, required this.days});
}
