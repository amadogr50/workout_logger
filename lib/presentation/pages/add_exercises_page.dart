import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/presentation/riverpod/add_exercises_providers.dart';
import 'package:workout_logger/presentation/widgets/edition_app_bar.dart';
import 'package:workout_logger/presentation/widgets/items/add_exercise_item.dart';
import 'package:workout_logger/theme/dimensions.dart';
import 'package:workout_logger/theme/typography.dart';

class AddExercisesPage extends StatelessWidget {
  final RoutineDay day;

  const AddExercisesPage({required this.day});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EditionAppBar(
            onConfirm: () {},
            onCancel: () {},
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
                  watch(selectedExercisesController(null));

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
                          isSelected:
                              selectedExercises.contains(data[index].id),
                          onTap: () {
                            context
                                .read(
                                    selectedExercisesController(null).notifier)
                                .toggleExercise(data[index].id!);
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
