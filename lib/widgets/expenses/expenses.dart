import 'package:flutter/material.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Text(
            "\$2361.34",
            style: text.displayLarge,
          ),
          Text(
            "Total Expenses",
            style: text.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
