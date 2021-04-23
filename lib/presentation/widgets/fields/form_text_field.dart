import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:workout_logger/theme/dimensions.dart';

class FormTextField extends StatelessWidget {
  final String name;
  final String labelText;
  final String? initialValue;
  final FormFieldValidator<String>? validator;

  const FormTextField({
    required this.name,
    required this.labelText,
    this.validator,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      validator: validator,
      initialValue: initialValue,
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
