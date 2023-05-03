import 'package:flutter/material.dart';

class ListSeparator extends StatelessWidget {
  const ListSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return SizedBox(
      height: 8,
      child: Container(color: color.background.withAlpha(100)),
    );
  }
}
