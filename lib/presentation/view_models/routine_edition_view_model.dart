import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moor/moor.dart';
import 'package:workout_logger/db/db.dart';

class RoutineEditionViewModel extends ChangeNotifier {
  final List<RoutineDaysModelCompanion> _days = [];

  UnmodifiableListView<RoutineDaysModelCompanion> get days =>
      UnmodifiableListView(_days);

  void addDay() {
    _days.add(RoutineDaysModelCompanion(order: Value(_days.length++)));
    notifyListeners();
  }
}

final routineEditionViewModelProvider =
    ChangeNotifierProvider<RoutineEditionViewModel>(
        (ref) => RoutineEditionViewModel());
