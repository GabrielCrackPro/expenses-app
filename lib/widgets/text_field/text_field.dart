import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String hint;
  TextInputType inputType;
  TextEditingController? controller;

  CustomTextField(
      {super.key,
      required this.hint,
      this.inputType = TextInputType.text,
      this.controller});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var text = Theme.of(context).textTheme;

    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color.primary),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color.error),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color.error),
        ),
        label: Text(hint),
        labelStyle: text.bodyLarge!.copyWith(color: color.primary),
      ),
    );
  }
}
