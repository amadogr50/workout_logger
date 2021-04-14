import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_logger/core/router/router.gr.dart';
import 'package:workout_logger/theme/typography.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallCaps.heavy("My Routine"),
                TextButton(
                    onPressed: () {
                      AutoRouter.of(context).push(RoutinesPageRoute());
                    },
                    child: SmallCaps.heavy("See All")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
