import 'package:workout_logger/domain/entities/routine_day.dart';

class Routine {
  final int? id;
  final String name;
  final bool current;
  final List<RoutineDay> days;

  const Routine({
    required this.id,
    required this.name,
    required this.current,
    required this.days,
  });

  Routine.empty()
      : id = null,
        name = '',
        current = false,
        days = [];
}
