import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_logger/domain/entities/set.dart';
import 'package:workout_logger/theme/dimensions.dart';
import 'package:workout_logger/theme/typography.dart';

class SetEditionItem extends StatefulWidget {
  final minRepsTextController = TextEditingController();
  final maxRepsTextController = TextEditingController();
  final int index;
  final RoutineSet routineSet;

  SetEditionItem({required this.routineSet, required this.index}) {
    minRepsTextController.text = routineSet.minReps.toString();
    maxRepsTextController.text = routineSet.maxReps.toString();
  }

  @override
  _SetEditionItemState createState() => _SetEditionItemState();
}

class _SetEditionItemState extends State<SetEditionItem> {
  Timer? _debounce;

  void onTap(TextEditingController controller) {
    if (controller.text == "0") {
      controller.text = "";
    }
  }

  void onSubmitted(TextEditingController controller) {
    if (controller.text.isEmpty) {
      controller.text = "0";
    }
  }

  void onChanged(TextEditingController controller) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      print("Hola ${controller.text}");
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Row(
      children: [
        ParagraphBase.heavy("Set ${widget.index + 1}"),
        const SizedBox(
          width: Dimensions.s,
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: widget.minRepsTextController,
                  onTap: () {
                    onTap(widget.minRepsTextController);
                  },
                  onSubmitted: (_) {
                    onSubmitted(widget.minRepsTextController);
                  },
                  onChanged: (_) {
                    onChanged(widget.minRepsTextController);
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(0|[1-9][0-9]*)$')),
                  ],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Min Sets",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              const SizedBox(
                width: Dimensions.s,
              ),
              Expanded(
                child: TextField(
                  controller: widget.maxRepsTextController,
                  onTap: () {
                    onTap(widget.maxRepsTextController);
                  },
                  onSubmitted: (_) {
                    onSubmitted(widget.maxRepsTextController);
                  },
                  onChanged: (_) {
                    onChanged(widget.maxRepsTextController);
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(0|[1-9][0-9]*)$')),
                  ],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Max Sets",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
