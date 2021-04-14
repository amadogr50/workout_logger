import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:workout_logger/presentation/widgets/edition_app_bar.dart';

class AddExercisesPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EditionAppBar(
            onConfirm: () {},
            onCancel: () {},
          ),
        ],
      ),
    );
  }
}
