import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({
    super.key,
    required this.name,
    required this.label,
    required this.icon,
    required this.value,
    required this.percentage,
  });
  final String name, label;
  final IconData icon;
  final double value, percentage;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return InkWell(
      child: ListTile(
        leading: Icon(widget.icon),
        title: Text(widget.label),
        iconColor: colors.primary,
        subtitle: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${widget.percentage}% ",
                style: TextStyle(
                  color: colors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "of expenses",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                ),
              )
            ],
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: colors.primary.withOpacity(0.2),
          ),
          child: Text(
            "\$${widget.value}",
            style: TextStyle(
              color: colors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
