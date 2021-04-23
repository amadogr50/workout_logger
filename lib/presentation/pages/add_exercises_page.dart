import 'package:auto_route/auto_route.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/entities/exercise.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/presentation/riverpod/add_exercises_providers.dart';
import 'package:workout_logger/presentation/widgets/edition_app_bar.dart';
import 'package:workout_logger/presentation/widgets/items/add_exercise_item.dart';
import 'package:workout_logger/theme/dimensions.dart';
import 'package:workout_logger/theme/typography.dart';

class AddExercisesPage extends StatelessWidget {
  final void Function(BuiltSet<Exercise> selectedExercises) onConfirm;
  final RoutineDay routineDay;

  const AddExercisesPage({required this.routineDay, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EditionAppBar(
            onConfirm: () {
              onConfirm(context.read(selectedExercisesController(routineDay)));
              AutoRouter.of(context).pop();
            },
            onCancel: () {
              AutoRouter.of(context).pop();
            },
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.s),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  F2.heavy("Add Exercises"),
                  ParagraphSmall.regular(
                      "Select exercises you want in your routine")
                ],
              ),
            ),
          ),
          Consumer(
            builder: (context, watch, child) {
              final exercises = watch(filteredExercisesProvider);
              final selectedExercises =
                  watch(selectedExercisesController(routineDay));

              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.s),
                sliver: exercises.when(
                  data: (data) => SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                    return Column(
                      children: [
                        AddExerciseItem(
                          exercise: data[index],
                          isSelected: selectedExercises.contains(data[index]),
                          onTap: () {
                            context
                                .read(selectedExercisesController(routineDay)
                                    .notifier)
                                .toggleExercise(data[index]);
                          },
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                      ],
                    );
                  }, childCount: data.length)),
                  loading: () => const SliverToBoxAdapter(
                    child: F2.heavy("Loading"),
                  ),
                  error: (err, stack) {
                    return const SliverToBoxAdapter(
                      child: F2.heavy("Error"),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
