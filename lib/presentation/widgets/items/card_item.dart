import 'package:flutter/material.dart';
import 'package:workout_logger/theme/dimensions.dart';

class CardItem extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const CardItem({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.s),
          child: child,
        ),
      ),
    );
  }
}
