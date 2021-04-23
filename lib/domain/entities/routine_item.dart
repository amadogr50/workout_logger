import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/entities/set.dart';

class RoutineItem extends Equatable {
  final int id;
  final Exercise exercise;
  final String note;
  final BuiltList<RoutineSet> sets;
  final int order;
  final int groupNumber;

  RoutineItem({
    int? id,
    required this.exercise,
    required this.note,
    required this.sets,
    required this.order,
    required this.groupNumber,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch;

  RoutineItem.empty({
    required this.exercise,
    required this.order,
    int? groupNumber,
  })  : id = DateTime.now().millisecondsSinceEpoch,
        note = "",
        groupNumber = groupNumber ?? 0,
        sets = BuiltList();

  RoutineItem copyWith({
    int? id,
    Exercise? exercise,
    String? note,
    BuiltList<RoutineSet>? sets,
    int? order,
    int? groupNumber,
  }) {
    return RoutineItem(
      exercise: exercise ?? this.exercise,
      note: note ?? this.note,
      sets: sets ?? this.sets,
      order: order ?? this.order,
      groupNumber: groupNumber ?? this.groupNumber,
    );
  }

  @override
  List<Object> get props => [id];
}
