import 'package:built_collection/built_collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/domain/entities/routine_item.dart';
import 'package:workout_logger/domain/providers/routines_repository_provider.dart';
import 'package:workout_logger/domain/repositories/routines_repository.dart';

/*final nameController =
    StateNotifierProvider.autoDispose<NameController, String?>(
        (ref) => NameController());

class NameController extends StateNotifier<String?> {
  NameController() : super(null);

  // ignore: use_setters_to_change_properties
  void setName(String name) {
    state = name;
  }
}

final noteController =
    StateNotifierProvider.autoDispose<NoteController, String?>(
        (ref) => NoteController());

class NoteController extends StateNotifier<String?> {
  NoteController() : super(null);

  // ignore: use_setters_to_change_properties
  void setNote(String note) {
    state = note;
  }
}*/

/*final dayItemsControllerProvider = StateNotifierProvider.autoDispose
    .family<DayItemsController, BuiltList<RoutineItemWithExercise>, int?>(
  (ref, dayId) => DayItemsController(
    routinesRepository: ref.read(routinesRepositoryProvider),
    dayId: dayId,
  ),
);

class DayItemsController
    extends StateNotifier<BuiltList<RoutineItemWithExercise>> {
  final RoutinesRepository routinesRepository;

  DayItemsController({
    required this.routinesRepository,
    int? dayId,
  }) : super(BuiltList()) {
    _init(dayId);
  }

  Future<void> _init(int? dayId) async {
    if (dayId != null) {}
  }

  Future<void> setExercises(BuiltList<Exercise> exercisesIds) async {
    state = BuiltList(await Future.wait(exercisesIds.map((id) async {
      final exercise = await routinesRepository.getExercise(id);

      return RoutineItemWithExercise(
        routineItem: const Right(RoutineItemsModelCompanion()),
        exercise: exercise,
      );
    }).toList()));
  }
}*/

final routineDayControllerProvider = StateNotifierProvider.autoDispose
    .family<RoutineDayController, RoutineDay, RoutineDay>(
  (ref, routineDay) => RoutineDayController(
    routinesRepository: ref.read(
      routinesRepositoryProvider,
    ),
    routineDay: routineDay,
  ),
);

class RoutineDayController extends StateNotifier<RoutineDay> {
  final RoutinesRepository routinesRepository;

  RoutineDayController({
    required this.routinesRepository,
    required RoutineDay routineDay,
  }) : super(routineDay);

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setNote(String note) {
    state = state.copyWith(note: note);
  }

  void setItems(BuiltList<Exercise> exercises) {
    final currentItems = {for (var item in state.items) item.exercise: item};

    final items = exercises.asMap().entries.map<RoutineItem>((e) {
      if (currentItems.containsKey(e.value)) {
        return currentItems[e.value]!;
      }

      return RoutineItem.empty(exercise: e.value, order: e.key);
    }).toBuiltList();

    state = state.copyWith(items: items);
  }

  void updateItem(int index, RoutineItem routineItem) {
    state = state.copyWith(
      items: state.items.rebuild(
        (s) => s[index] = routineItem,
      ),
    );
  }

  void removeItem(int index) {
    state = state.copyWith(
      items: state.items.rebuild(
        (s) => s.removeAt(index),
      ),
    );
  }
}
