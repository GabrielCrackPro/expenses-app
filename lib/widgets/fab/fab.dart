import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final BuildContext context;
  const CustomFloatingActionButton({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: "Add expense",
      onPressed: () => context.push("/add"),
      child: const Icon(Icons.add),
    );
  }
}
