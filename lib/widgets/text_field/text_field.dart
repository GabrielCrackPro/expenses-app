import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String hint;
  TextInputType inputType;
  TextEditingController? controller;
  bool isPasswordField;

  CustomTextField({
    super.key,
    required this.hint,
    this.inputType = TextInputType.text,
    this.isPasswordField = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var text = Theme.of(context).textTheme;

    InputBorder enabledBorder = OutlineInputBorder(
      borderSide: BorderSide(color: color.primary),
    );
    InputBorder errorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: color.error),
    );

    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      obscureText: isPasswordField,
      decoration: InputDecoration(
        enabledBorder: enabledBorder,
        focusedBorder: enabledBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        label: Text(hint),
        labelStyle: text.bodyLarge!.copyWith(color: color.primary),
      ),
    );
  }
}
