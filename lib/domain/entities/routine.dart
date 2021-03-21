import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';

class Routine extends Equatable {
  final int id;
  final String name;
  final bool current;
  final List<RoutineDay> days;

  const Routine({@required this.id, @required this.name, @required this.current, @required this.days});

  @override
  List<Object> get props => [name, days];
}
