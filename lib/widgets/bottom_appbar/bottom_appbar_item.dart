import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomItem extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final String name;

  const BottomItem({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    String location = GoRouter.of(context).location.split("/")[1];
    if (location == "") location = "/";
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color:
            location == name ? colors.primary : colors.primary.withOpacity(0.3),
      ),
    );
  }
}
