import 'package:workout_logger/db/db.dart';

class DayWithItems {
  final RoutineDayModel day;
  final List<RoutineItemModel> items;

  DayWithItems({required this.day, required this.items});

  @override
  int get hashCode => day.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is DayWithItems) {
      return day.id == other.day.id;
    }

    return false;
  }
}
