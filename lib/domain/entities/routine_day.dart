import 'package:workout_logger/domain/entities/routine_item.dart';

class RoutineDay {
  final int? id;
  final String name;
  final List<RoutineItem> items;
  final int order;

  const RoutineDay({
    required this.id,
    required this.name,
    required this.items,
    required this.order,
  });

  RoutineDay.empty({required this.order})
      : id = null,
        name = '',
        items = [];
}
