// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MonthItem extends StatefulWidget {
  final String monthName;
  final int monthPosition;
  bool isCurrent = false;

  MonthItem({
    super.key,
    required this.monthName,
    required this.monthPosition,
    required this.isCurrent,
  });

  @override
  State<MonthItem> createState() => _MonthItemState();
}

class _MonthItemState extends State<MonthItem> {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var text = Theme.of(context).textTheme;

    TextStyle selectedStyle = text.headlineLarge!.copyWith(
      fontWeight: FontWeight.bold,
    );

    TextStyle unselectedStyle = text.headlineSmall!.copyWith(
      color: color.onBackground.withOpacity(0.3),
    );
    return Align(
      alignment: Alignment.center,
      child: Text(
        widget.monthName,
        style: widget.isCurrent ? selectedStyle : unselectedStyle,
      ),
    );
  }
}
