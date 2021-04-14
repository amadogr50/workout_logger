import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:workout_logger/theme/dimensions.dart';

class FormTextField extends StatelessWidget {
  final String name;
  final String labelText;

  const FormTextField({required this.name, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.xs),
        )),
      ),
    );
  }
}
