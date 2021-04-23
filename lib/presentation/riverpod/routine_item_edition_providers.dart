import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/entities/routine_item.dart';
import 'package:workout_logger/domain/entities/set.dart';

/*final noteController =
    StateNotifierProvider.autoDispose<NoteController, String?>(
        (ref) => NoteController());

class NoteController extends StateNotifier<String?> {
  NoteController() : super(null);

  // ignore: use_setters_to_change_properties
  void setNote(String note) {
    state = note;
  }
}*/

final routineItemControllerProvider = StateNotifierProvider.autoDispose
    .family<SetsController, RoutineItem, RoutineItem>(
        (ref, routineItem) => SetsController(routineItem: routineItem));

class SetsController extends StateNotifier<RoutineItem> {
  SetsController({required RoutineItem routineItem}) : super(routineItem);

  void setNote(String note) {
    state = state.copyWith(note: note);
  }

  void addSet() {
    state = state.copyWith(
      sets: state.sets.rebuild(
        (s) => s.add(RoutineSet.empty()),
      ),
    );
  }

  void removeSet(int setId) {
    state = state.copyWith(
      sets: state.sets.rebuild(
        (s) => s.removeAt(setId),
      ),
    );
  }

  void updateSet(int index, {int? minReps, int? maxReps}) {
    final set = state.sets[index];

    state = state.copyWith(
      sets: state.sets.rebuild(
        (s) => s[index] = set.copyWith(
          minReps: minReps,
          maxReps: maxReps,
        ),
      ),
    );
  }
}
