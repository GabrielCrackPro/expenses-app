import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Num extends StatefulWidget {
  var number;
  void Function(String value) onPressed;

  Num({super.key, required this.number, required this.onPressed});

  @override
  State<Num> createState() => _NumState();
}

class _NumState extends State<Num> {
  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;

    void Function(String value) onPressed = widget.onPressed;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(width: 0.1),
          ),
        ),
        child: GestureDetector(
          onTap: () => onPressed(widget.number),
          child: Text(
            widget.number,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              color: colors.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
