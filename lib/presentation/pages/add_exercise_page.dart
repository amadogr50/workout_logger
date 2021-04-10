import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/presentation/riverpod/exercises_providers.dart';
import 'package:workout_logger/presentation/view_models/exercises_view_model.dart';

class AddExercisePage extends ConsumerWidget {
  static const name = 'name';
  static const instructions = 'instructions';
  static const musclesIds = 'musclesIds';
  static const equipmentId = 'equipmentId';
  static const exerciseTypeId = 'exerciseTypeId';

  final _form = GlobalKey<FormBuilderState>();

  Future<void> onClose(ExercisesViewModel exercisesViewModel) async {
    final isValid = _form.currentState!.validate();
    if (isValid) {
      final fields = _form.currentState!.fields;
      final exercise = await exercisesViewModel.addExercise(
        name: fields[name]!.value as String,
        exerciseTypeId: fields[exerciseTypeId]!.value as int,
        equipmentId: fields[equipmentId]!.value as int,
        instructions: fields[instructions]!.value as String,
        musclesIds: fields[musclesIds]!.value as List<int>,
      );
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final exercisesViewModel = watch(exercisesViewModelProvider);
    final muscles = watch(musclesProvider);
    final equipments = watch(equipmentsProvider);
    final types = watch(exercisesTypesProvider);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              leading: IconButton(
                color: Colors.black,
                icon: const Icon(Icons.close),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.done),
                  onPressed: () => {onClose(exercisesViewModel)},
                ),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverFillRemaining(
                child: FormBuilder(
                  key: _form,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: name,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                        validator: FormBuilderValidators.required(context),
                      ),
                      FormBuilderTextField(
                        name: instructions,
                        decoration: const InputDecoration(
                          labelText: 'Instructions',
                        ),
                      ),
                      FormBuilderFilterChip<int>(
                        name: musclesIds,
                        decoration: const InputDecoration(
                          labelText: 'Muscles',
                        ),
                        validator: FormBuilderValidators.required(context),
                        options: muscles.when(
                          data: (data) => data
                              .map((muscle) => FormBuilderFieldOption(
                                    value: muscle.id,
                                    child: Text(muscle.name),
                                  ))
                              .toList(),
                          loading: () => [],
                          error: (e, s) => [],
                        ),
                      ),
                      equipments.when(
                        data: (data) => FormBuilderDropdown(
                            decoration: const InputDecoration(
                              labelText: 'Equipment',
                            ),
                            name: equipmentId,
                            validator: FormBuilderValidators.required(context),
                            items: data
                                .map((equipment) => DropdownMenuItem(
                                    value: equipment.id,
                                    child: Text(equipment.name)))
                                .toList()),
                        loading: () => Text("Loading..."),
                        error: (e, s) => Text("Error"),
                      ),
                      types.when(
                        data: (data) => FormBuilderDropdown(
                            decoration: const InputDecoration(
                              labelText: 'Type of Exercise',
                            ),
                            name: exerciseTypeId,
                            validator: FormBuilderValidators.required(context),
                            items: data
                                .map((exerciseType) => DropdownMenuItem(
                                    value: exerciseType.id,
                                    child: Text(exerciseType.name)))
                                .toList()),
                        loading: () => Text("Loading..."),
                        error: (e, s) => Text("Error"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
