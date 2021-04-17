import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/core/router/router.gr.dart';
import 'package:workout_logger/presentation/view_models/routine_edition_view_model.dart';
import 'package:workout_logger/presentation/widgets/edition_app_bar.dart';
import 'package:workout_logger/presentation/widgets/fields/form_text_field.dart';
import 'package:workout_logger/presentation/widgets/items/routine_day_edition_item.dart';
import 'package:workout_logger/theme/dimensions.dart';
import 'package:workout_logger/theme/typography.dart';

class RoutineEditionPage extends ConsumerWidget {
  final _form = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(routineEditionViewModelProvider(null));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EditionAppBar(
            onConfirm: () {},
            onCancel: () {},
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.s),
            sliver: SliverFillRemaining(
              child: FormBuilder(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Dimensions.s),
                    const FormTextField(name: 'name', labelText: 'Name'),
                    const SizedBox(height: Dimensions.s),
                    const FormTextField(name: 'note', labelText: 'Note'),
                    const SizedBox(height: Dimensions.s),
                    const F4.heavy("Days"),
                    const SizedBox(height: Dimensions.s),
                    ...viewModel.routine.days
                        .asMap()
                        .entries
                        .map(
                          (entry) => RoutineDayEditionItem(entry.value, () {
                            viewModel.removeDay(entry.key);
                          }, () {
                            AutoRouter.of(context).push(
                                RoutineDayEditionPageRoute(day: entry.value));
                          }),
                        )
                        .toList(),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.addDay();
                      },
                      child: Text('Hola'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
