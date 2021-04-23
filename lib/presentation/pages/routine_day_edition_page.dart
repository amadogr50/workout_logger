import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/core/router/router.gr.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/presentation/riverpod/routine_day_edition_providers.dart';
import 'package:workout_logger/presentation/widgets/edition_app_bar.dart';
import 'package:workout_logger/presentation/widgets/fields/form_text_field.dart';
import 'package:workout_logger/presentation/widgets/items/routine_item_item.dart';
import 'package:workout_logger/theme/dimensions.dart';
import 'package:workout_logger/theme/typography.dart';

class RoutineDayEditionPage extends ConsumerWidget {
  final _form = GlobalKey<FormBuilderState>();

  final void Function(RoutineDay routineDay) onConfirm;
  final RoutineDay routineDay;

  RoutineDayEditionPage({required this.routineDay, required this.onConfirm});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EditionAppBar(
            onConfirm: () {
              final isValid = _form.currentState!.validate();
              if (isValid) {
                final controller = context
                    .read(routineDayControllerProvider(routineDay).notifier);

                controller.setNote(
                    _form.currentState!.fields['note']!.value as String);
                controller.setName(
                    _form.currentState!.fields['name']!.value as String);

                onConfirm(
                  context.read(routineDayControllerProvider(routineDay)),
                );

                AutoRouter.of(context).pop();
              }
            },
            onCancel: () {
              AutoRouter.of(context).pop();
            },
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.s),
            sliver: SliverToBoxAdapter(
              child: FormBuilder(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: Dimensions.s),
                    FormTextField(
                      name: 'name',
                      labelText: 'Name',
                      initialValue: routineDay.name,
                      validator: FormBuilderValidators.required(context),
                    ),
                    const SizedBox(height: Dimensions.s),
                    FormTextField(
                      name: 'note',
                      labelText: 'Note',
                      initialValue: routineDay.note,
                    ),
                    const SizedBox(height: Dimensions.s),
                    const F4.heavy("Exercises"),
                    const SizedBox(height: Dimensions.s),
                  ],
                ),
              ),
            ),
          ),
          Consumer(builder: (context, watch, child) {
            final items = watch(routineDayControllerProvider(routineDay)).items;

            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.s),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Column(
                    children: [
                      RoutineItemItem(
                        routineItem: items[index],
                        onTap: () {
                          AutoRouter.of(context).push(
                            RoutineItemEditionPageRoute(
                              routineItem: items[index],
                              onConfirm: (routineItem) {
                                context
                                    .read(
                                        routineDayControllerProvider(routineDay)
                                            .notifier)
                                    .updateItem(index, routineItem);
                              },
                            ),
                          );
                        },
                        onRemove: () {
                          context
                              .read(routineDayControllerProvider(routineDay)
                                  .notifier)
                              .removeItem(index);
                        },
                      ),
                      const SizedBox(height: Dimensions.s),
                    ],
                  ),
                  childCount: items.length,
                ),
              ),
            );
          }),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.s),
            sliver: SliverToBoxAdapter(
              child: ElevatedButton(
                  onPressed: () {
                    AutoRouter.of(context).push(AddExercisesPageRoute(
                      routineDay: routineDay,
                      onConfirm: (selectedExercises) {
                        context
                            .read(routineDayControllerProvider(routineDay)
                                .notifier)
                            .setItems(selectedExercises.toBuiltList());
                      },
                    ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(Dimensions.s),
                    child: F4.heavy('Add Exercises'),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
