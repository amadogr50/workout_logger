import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_logger/core/router/router.gr.dart';
import 'package:workout_logger/presentation/view_models/routines_view_model.dart';
import 'package:workout_logger/theme/typography.dart';

class RoutinesPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final routines = useProvider(routinesProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(),
          const SliverToBoxAdapter(
            child: F2.heavy("My Routines"),
          ),
          routines.when(
            data: (data) {
              if (data.isNotEmpty) {
                return const SliverToBoxAdapter(
                  child: ParagraphBase.heavy("My Routines"),
                );
              }

              return const SliverToBoxAdapter(
                child: ParagraphBase.heavy("You dont have routines, add one."),
              );
            },
            loading: () => const SliverToBoxAdapter(
              child: F2.heavy("My Routines"),
            ),
            error: (e, s) => const SliverToBoxAdapter(
              child: F2.heavy("My Routines"),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(const RoutineEditionPageRoute());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
