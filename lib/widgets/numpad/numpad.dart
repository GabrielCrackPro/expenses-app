import 'package:expenses_app/widgets/numpad/num.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Numpad extends StatefulWidget {
  const Numpad({super.key});

  @override
  State<Numpad> createState() => _NumpadState();
}

class _NumpadState extends State<Numpad> {
  void onPressed(String value) {
    if (text == "00.00") {
      setState(() {
        text = value;
      });
    } else {
      setState(() {
        text += value;
      });
    }
  }

  void onPressedComma(String value) {
    if (text == "00.00") {
      setState(() {
        text = "0$value";
      });
    } else if (!text.contains(value)) {
      setState(() {
        text += value;
      });
    }
  }

  void onBackspace(String value) {
    if (text.length > 1) {
      setState(() {
        text = text.substring(0, text.length - 1);
      });
    } else {
      setState(() {
        text = "00.00";
      });
    }
  }

  String text = "00.00";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: FittedBox(
            child: Text(
              "\$$text",
              style: const TextStyle(fontSize: 70, color: Colors.blue),
            ),
          ),
        ),
        Row(
          children: [
            Num(number: const Text("1").data!, onPressed: onPressed),
            Num(number: const Text("2").data!, onPressed: onPressed),
            Num(number: const Text("3").data!, onPressed: onPressed),
          ],
        ),
        Row(
          children: [
            Num(number: const Text("4").data!, onPressed: onPressed),
            Num(number: const Text("5").data!, onPressed: onPressed),
            Num(number: const Text("6").data!, onPressed: onPressed),
          ],
        ),
        Row(
          children: [
            Num(number: const Text("7").data!, onPressed: onPressed),
            Num(number: const Text("8").data!, onPressed: onPressed),
            Num(number: const Text("9").data!, onPressed: onPressed),
          ],
        ),
        Row(
          children: [
            Num(number: const Text(".").data!, onPressed: onPressedComma),
            Num(number: const Text("0").data!, onPressed: onPressed),
            Num(number: const Text("AC").data!, onPressed: onBackspace),
          ],
        )
      ],
    );
  }
}
