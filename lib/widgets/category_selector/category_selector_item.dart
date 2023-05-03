import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategorySeletorItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final bool selected;
  void Function()? onPressed;

  CategorySeletorItem({
    super.key,
    required this.name,
    required this.icon,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: onPressed,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                  color: selected ? colors.primary : colors.secondary,
                  width: selected ? 3.0 : 1.0,
                ),
              ),
              child: IconButton(
                onPressed: null,
                icon: Icon(icon, color: colors.primary),
              ),
            ),
          ),
          Text(name),
        ],
      ),
    );
  }
}
