import 'package:equatable/equatable.dart';
import 'package:workout_logger/domain/entities/routine_item.dart';

class RoutineDay extends Equatable {
  final int id;
  final String name;
  final List<RoutineItem> items;
  final int order;

  const RoutineDay({
    required this.id,
    required this.name,
    required this.items,
    required this.order,
  });

  @override
  List<Object> get props => [name, items, order];
}
