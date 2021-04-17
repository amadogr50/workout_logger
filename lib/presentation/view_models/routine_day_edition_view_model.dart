import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';

class RoutineDayEditionViewModel extends ChangeNotifier {
  final RoutineDay routineDay;

  RoutineDayEditionViewModel(this.routineDay);
}

final routineDayEditionViewModelProvider =
    ChangeNotifierProvider.family<RoutineDayEditionViewModel, RoutineDay>(
  (ref, routineDay) {
    return RoutineDayEditionViewModel(routineDay);
  },
);
