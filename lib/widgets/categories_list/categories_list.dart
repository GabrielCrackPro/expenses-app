import 'package:expenses_app/widgets/categories_list/categories_list_item.dart';
import 'package:expenses_app/widgets/list_separator/list_separator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": FontAwesomeIcons.cartShopping,
        "name": "shopping",
        "label": "Shopping",
        "value": 100.0,
        "percentage": 16.6,
      },
      {
        "icon": FontAwesomeIcons.beerMugEmpty,
        "name": "alcohol",
        "label": "Alcohol",
        "value": 100.0,
        "percentage": 16.6,
      },
      {
        "icon": FontAwesomeIcons.burger,
        "name": "fast_food",
        "label": "Fast Food",
        "value": 100.0,
        "percentage": 16.6,
      },
      {
        "icon": FontAwesomeIcons.wallet,
        "name": "bills",
        "label": "Bills",
        "value": 100.0,
        "percentage": 16.6,
      },
      {
        "icon": FontAwesomeIcons.shirt,
        "name": "clothes",
        "label": "Clothes",
        "value": 100.0,
        "percentage": 16.6,
      },
    ];
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const ListSeparator();
        },
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Category(
            icon: categories[index]["icon"],
            name: categories[index]["name"],
            label: categories[index]["label"],
            value: categories[index]["value"],
            percentage: categories[index]["percentage"],
          );
        });
  }
}
