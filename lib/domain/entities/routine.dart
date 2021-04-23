import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';

class Routine extends Equatable {
  final int id;
  final String name;
  final String note;
  final bool current;
  final BuiltList<RoutineDay> days;

  Routine({
    int? id,
    String? note,
    required this.name,
    required this.current,
    required this.days,
  })   : id = id ?? DateTime.now().millisecondsSinceEpoch,
        note = note ?? '';

  Routine.empty()
      : id = DateTime.now().millisecondsSinceEpoch,
        name = '',
        note = '',
        current = false,
        days = BuiltList();

  Routine copyWith({
    int? id,
    String? name,
    String? note,
    bool? current,
    BuiltList<RoutineDay>? days,
  }) {
    return Routine(
      id: id ?? this.id,
      name: name ?? this.name,
      note: note ?? this.note,
      current: current ?? this.current,
      days: days ?? this.days,
    );
  }

  @override
  List<Object> get props => [id];
}
