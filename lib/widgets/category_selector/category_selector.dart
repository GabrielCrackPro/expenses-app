import 'package:expenses_app/widgets/category_selector/category_selector_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class CategorySelector extends StatefulWidget {
  CategorySelector({super.key, this.selected});

  String? selected;

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  String? selectedCategory = "shopping";
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": FontAwesomeIcons.cartShopping,
        "name": "shopping",
        "label": "Shopping",
      },
      {
        "icon": FontAwesomeIcons.beerMugEmpty,
        "name": "alcohol",
        "label": "Alcohol",
      },
      {
        "icon": FontAwesomeIcons.burger,
        "name": "fast_food",
        "label": "Fast Food",
      },
      {
        "icon": FontAwesomeIcons.wallet,
        "name": "bills",
        "label": "Bills",
      },
      {
        "icon": FontAwesomeIcons.shirt,
        "name": "clothes",
        "label": "Clothes",
      },
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> category = categories[index];
        return CategorySeletorItem(
          name: category["label"],
          icon: category["icon"],
          selected: category["name"] == widget.selected,
          onPressed: () => setState(() {
            selectedCategory = category["name"];
            widget.selected = selectedCategory;
          }),
        );
      },
    );
  }
}
