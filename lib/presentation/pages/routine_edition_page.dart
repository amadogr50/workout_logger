import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/presentation/view_models/routine_edition_view_model.dart';
import 'package:workout_logger/presentation/widgets/edition_app_bar.dart';
import 'package:workout_logger/presentation/widgets/fields/form_text_field.dart';
import 'package:workout_logger/theme/dimensions.dart';
import 'package:workout_logger/theme/typography.dart';

class RoutineEditionPage extends HookWidget {
  final _form = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = useProvider(routineEditionViewModelProvider);

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
                    ...viewModel.days.map((day) => const Text("Hola")).toList(),
                    RaisedButton(onPressed: () {
                      viewModel.addDay();
                    }),
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
