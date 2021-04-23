import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/core/router/router.gr.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/presentation/riverpod/routine_edition_providers.dart';
import 'package:workout_logger/presentation/widgets/edition_app_bar.dart';
import 'package:workout_logger/presentation/widgets/fields/form_text_field.dart';
import 'package:workout_logger/presentation/widgets/items/routine_day_edition_item.dart';
import 'package:workout_logger/theme/dimensions.dart';
import 'package:workout_logger/theme/typography.dart';

class RoutineEditionPage extends StatelessWidget {
  final _form = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EditionAppBar(
            onConfirm: () {
              AutoRouter.of(context).pop();
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimensions.s),
                    FormTextField(name: 'name', labelText: 'Name'),
                    SizedBox(height: Dimensions.s),
                    FormTextField(name: 'note', labelText: 'Note'),
                    SizedBox(height: Dimensions.s),
                    F4.heavy("Days"),
                    SizedBox(height: Dimensions.s),
                  ],
                ),
              ),
            ),
          ),
          Consumer(builder: (context, watch, child) {
            final days = watch(routineControllerProvider(null)).days;

            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.s),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => Column(
                    children: [
                      RoutineDayEditionItem(
                        day: days[index],
                        onRemove: () {
                          context
                              .read(routineControllerProvider(null).notifier)
                              .removeDay(index);
                        },
                        onTap: () {
                          AutoRouter.of(context).push(
                            RoutineDayEditionPageRoute(
                              routineDay: days[index],
                              onConfirm: (RoutineDay routineDay) {
                                context
                                    .read(routineControllerProvider(null)
                                        .notifier)
                                    .updateDay(routineDay, index);
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: Dimensions.s),
                    ],
                  ),
                  childCount: days.length,
                ),
              ),
            );
          }),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.s),
            sliver: SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () {
                  final days =
                      context.read(routineControllerProvider(null)).days;
                  AutoRouter.of(context).push(
                    RoutineDayEditionPageRoute(
                      routineDay: RoutineDay.empty(order: days.length),
                      onConfirm: (routineDay) {
                        context
                            .read(routineControllerProvider(null).notifier)
                            .addDay(routineDay);
                      },
                    ),
                  );
                },
                child: const Text('Add Day'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
