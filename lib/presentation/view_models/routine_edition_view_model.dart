import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/entities/routine.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';

class RoutineEditionViewModel extends ChangeNotifier {
  final Routine routine;

  RoutineEditionViewModel(this.routine);

  void addDay() {
    routine.days.add(RoutineDay.empty(order: routine.days.length - 1));
    notifyListeners();
  }

  void removeDay(int dayIndex) {
    routine.days.removeAt(dayIndex);
    notifyListeners();
  }
}

final routineEditionViewModelProvider =
    ChangeNotifierProvider.family<RoutineEditionViewModel, Routine?>(
  (ref, routine) {
    if (routine == null) {
      return RoutineEditionViewModel(Routine.empty());
    }

    return RoutineEditionViewModel(routine);
  },
);
