import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/core/router/router.gr.dart';
import 'package:workout_logger/domain/entities/routine_day.dart';
import 'package:workout_logger/presentation/view_models/routine_day_edition_view_model.dart';
import 'package:workout_logger/presentation/widgets/edition_app_bar.dart';
import 'package:workout_logger/presentation/widgets/fields/form_text_field.dart';
import 'package:workout_logger/theme/dimensions.dart';
import 'package:workout_logger/theme/typography.dart';

class RoutineDayEditionPage extends ConsumerWidget {
  final _form = GlobalKey<FormBuilderState>();

  final RoutineDay day;

  RoutineDayEditionPage({required this.day});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(routineDayEditionViewModelProvider(day));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EditionAppBar(onConfirm: () {}, onCancel: () {}),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.s),
            sliver: SliverFillRemaining(
              child: FormBuilder(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: Dimensions.s),
                    const FormTextField(name: 'name', labelText: 'Name'),
                    const SizedBox(height: Dimensions.s),
                    const FormTextField(name: 'note', labelText: 'Note'),
                    const SizedBox(height: Dimensions.s),
                    const F4.heavy("Exercises"),
                    const SizedBox(height: Dimensions.s),
                    ElevatedButton(
                        onPressed: () {
                          AutoRouter.of(context)
                              .push(AddExercisesPageRoute(day: day));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(Dimensions.s),
                          child: F4.heavy('Add Exercises'),
                        ))
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
