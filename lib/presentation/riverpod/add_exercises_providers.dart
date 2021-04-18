import 'package:built_collection/built_collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/entities/day_with_items.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/providers/exercises_repository_provider.dart';

final searchTextController =
    StateNotifierProvider.autoDispose<SearchTextController, String?>(
        (ref) => SearchTextController());

class SearchTextController extends StateNotifier<String?> {
  SearchTextController() : super(null);

  // ignore: use_setters_to_change_properties
  void setSearchText(String searchText) {
    state = searchText;
  }

  void clearSearchText() {
    state = null;
  }
}

final equipmentFilterController =
    StateNotifierProvider.autoDispose<EquipmentFilterController, int?>(
        (ref) => EquipmentFilterController());

class EquipmentFilterController extends StateNotifier<int?> {
  EquipmentFilterController() : super(null);

  // ignore: use_setters_to_change_properties
  void setEquipmentFilter(int equipmentId) {
    state = equipmentId;
  }

  void clearEquipmentFilter() {
    state = null;
  }
}

final muscleFilterController =
    StateNotifierProvider.autoDispose<MuscleFilterController, int?>(
        (ref) => MuscleFilterController());

class MuscleFilterController extends StateNotifier<int?> {
  MuscleFilterController() : super(null);

  // ignore: use_setters_to_change_properties
  void setMuscleFilter(int muscleId) {
    state = muscleId;
  }

  void clearMuscleFilter() {
    state = null;
  }
}

final filteredExercisesProvider =
    StreamProvider.autoDispose<List<Exercise>>((ref) {
  final searchText = ref.watch(searchTextController);
  final equipmentFilter = ref.watch(equipmentFilterController);
  final musclesFilter = ref.watch(muscleFilterController);

  return ref.read(exercisesRepositoryProvider).watchExercises(
        searchText: searchText,
        equipmentId: equipmentFilter,
        muscleId: musclesFilter,
      );
});

class SelectedExercisesController extends StateNotifier<BuiltSet<int>> {
  SelectedExercisesController({DayWithItems? day})
      : super(BuiltSet(day?.items ?? []));

  void toggleExercise(int exerciseId) {
    if (state.contains(exerciseId)) {
      state = state.rebuild((s) => s.remove(exerciseId));
    } else {
      state = state.rebuild((s) => s.add(exerciseId));
    }
  }
}

final selectedExercisesController = StateNotifierProvider.autoDispose
    .family<SelectedExercisesController, BuiltSet<int>, DayWithItems?>(
        (ref, day) => SelectedExercisesController(day: day));
