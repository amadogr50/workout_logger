import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/domain/entities/routine_item.dart';
import 'package:workout_logger/presentation/riverpod/routine_item_edition_providers.dart';
import 'package:workout_logger/presentation/widgets/edition_app_bar.dart';
import 'package:workout_logger/presentation/widgets/items/set_edition_item.dart';
import 'package:workout_logger/presentation/widgets/page.dart';
import 'package:workout_logger/theme/dimensions.dart';
import 'package:workout_logger/theme/typography.dart';

class RoutineItemEditionPage extends StatelessWidget {
  final noteTextController = TextEditingController();

  final void Function(RoutineItem routineItem) onConfirm;
  final RoutineItem routineItem;

  RoutineItemEditionPage({
    required this.routineItem,
    required this.onConfirm,
  }) {
    noteTextController.text = routineItem.note;
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      slivers: [
        EditionAppBar(
          onConfirm: () {
            onConfirm(context.read(routineItemControllerProvider(routineItem)));
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: Dimensions.s),
                F2.heavy(routineItem.exercise.name),
                const SizedBox(height: Dimensions.s),
                TextField(
                  controller: noteTextController,
                  // onTap: () {
                  //   onTap(widget.minRepsTextController);
                  // },
                  // onSubmitted: (_) {
                  //   onSubmitted(widget.minRepsTextController);
                  // },
                  onChanged: (text) {
                    context
                        .read(
                            routineItemControllerProvider(routineItem).notifier)
                        .setNote(noteTextController.text);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Note",
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                const SizedBox(height: Dimensions.s),
                const F4.heavy("Working Sets"),
                const SizedBox(height: Dimensions.s),
              ],
            ),
          ),
        ),
        Consumer(builder: (context, watch, child) {
          final sets = watch(routineItemControllerProvider(routineItem)).sets;

          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.s),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Dismissible(
                  key: Key(sets[index].id.toString()),
                  onDismissed: (direction) {
                    context
                        .read(
                            routineItemControllerProvider(routineItem).notifier)
                        .removeSet(index);
                  },
                  background: Container(
                    color: Colors.red,
                  ),
                  child: Column(
                    children: [
                      SetEditionItem(
                        routineSet: sets[index],
                        index: index,
                      ),
                      const SizedBox(height: Dimensions.s),
                    ],
                  ),
                ),
                childCount: sets.length,
              ),
            ),
          );
        }),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.s),
          sliver: SliverToBoxAdapter(
            child: ElevatedButton(
                onPressed: () {
                  context
                      .read(routineItemControllerProvider(routineItem).notifier)
                      .addSet();
                },
                child: const Padding(
                  padding: EdgeInsets.all(Dimensions.s),
                  child: F4.heavy('Add Set'),
                )),
          ),
        )
      ],
    );
  }
}
