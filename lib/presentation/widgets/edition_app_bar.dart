import 'package:flutter/material.dart';
import 'package:workout_logger/presentation/widgets/app_bar.dart';

class EditionAppBar extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const EditionAppBar({required this.onConfirm, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return BaseAppBar(
      leading: IconButton(
        color: Colors.black,
        icon: const Icon(Icons.close),
        onPressed: onCancel,
      ),
      actions: [
        IconButton(
          color: Colors.black,
          icon: const Icon(Icons.done),
          onPressed: onConfirm,
        ),
      ],
    );
  }
}
