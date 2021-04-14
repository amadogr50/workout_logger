import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget {
  final Widget leading;
  final List<Widget> actions;

  const BaseAppBar({required this.leading, required this.actions});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      leading: leading,
      actions: actions,
    );
  }
}
