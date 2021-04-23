import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_logger/domain/entities/routine_item.dart';

class RoutineDay extends Equatable {
  final int id;
  final String name;
  final String note;
  final int order;
  final BuiltList<RoutineItem> items;

  RoutineDay({
    int? id,
    required this.name,
    required this.note,
    required this.items,
    required this.order,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch;

  RoutineDay.empty({required this.order})
      : id = DateTime.now().millisecondsSinceEpoch,
        name = '',
        note = '',
        items = BuiltList();

  RoutineDay copyWith({
    int? id,
    String? name,
    String? note,
    int? order,
    BuiltList<RoutineItem>? items,
  }) {
    return RoutineDay(
      id: id ?? this.id,
      name: name ?? this.name,
      note: note ?? this.note,
      order: order ?? this.order,
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [id];
}
