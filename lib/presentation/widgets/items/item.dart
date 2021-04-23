import 'package:flutter/material.dart';
import 'package:workout_logger/presentation/widgets/items/card_item.dart';

class Item extends StatelessWidget {
  final Widget left;
  final Widget main;
  final VoidCallback onTap;

  const Item({
    required this.left,
    required this.main,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        left,
        Expanded(
          child: CardItem(
            onTap: onTap,
            child: main,
          ),
        )
      ],
    );
    ;
  }
}
