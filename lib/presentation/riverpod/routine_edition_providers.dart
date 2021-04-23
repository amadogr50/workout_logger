import 'package:built_collection/built_collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/entities/routine.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/domain/providers/routines_repository_provider.dart';
import 'package:workout_logger/domain/repositories/routines_repository.dart';

final routineControllerProvider = StateNotifierProvider.autoDispose
    .family<RoutineController, Routine, int?>((ref, routineId) {
  return RoutineController(
    routinesRepository: ref.read(routinesRepositoryProvider),
  );
});

class RoutineController extends StateNotifier<Routine> {
  final RoutinesRepository routinesRepository;

  RoutineController({
    required this.routinesRepository,
  }) : super(Routine.empty());

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setNote(String note) {
    state = state.copyWith(note: note);
  }

  void addEmptyDay() {
    final currentDays = state.days;
    final days = currentDays.rebuild(
      (s) => s.add(
        RoutineDay.empty(
          order: currentDays.length,
        ),
      ),
    );

    state = state.copyWith(
      days: days,
    );
  }

  void addDay(RoutineDay day) {
    final currentDays = state.days;
    final days = currentDays.rebuild(
      (s) => s.add(
        day.copyWith(order: currentDays.length),
      ),
    );

    state = state.copyWith(
      days: days,
    );
  }

  void removeDay(int index) {
    final currentDays = state.days;
    final days = currentDays
        .rebuild((s) {
          s.removeAt(index);
        })
        .asMap()
        .entries
        .map<RoutineDay>(
          (e) => e.value.copyWith(order: e.key),
        )
        .toBuiltList();

    state = state.copyWith(
      days: days,
    );
  }

  void updateDay(RoutineDay day, int index) {
    final currentDays = state.days;
    final days = currentDays.rebuild((s) => s[index] = day);

    state = state.copyWith(
      days: days,
    );
  }
}
