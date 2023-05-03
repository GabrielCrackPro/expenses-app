// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'bottom_appbar_item.dart';

class CustomBottomAppbar extends StatelessWidget {
  void Function()? onPressedGraph;
  CustomBottomAppbar({super.key, this.onPressedGraph});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;

    List<Widget> items = [
      BottomItem(
        name: "/",
        onPressed: () => context.goNamed("home"),
        icon: FontAwesomeIcons.chartColumn,
      ),
      BottomItem(
        name: "pie_graph",
        onPressed: () => context.goNamed("pie_graph"),
        icon: FontAwesomeIcons.chartPie,
      ),
      const SizedBox(width: 20),
      BottomItem(
        name: "wallet",
        onPressed: () => context.goNamed("wallet"),
        icon: FontAwesomeIcons.wallet,
      ),
      BottomItem(
        name: "settings",
        onPressed: () => GoRouter.of(context).goNamed("settings"),
        icon: Icons.settings_outlined,
      ),
    ];
    return BottomAppBar(
      notchMargin: 8.0,
      shape: const CircularNotchedRectangle(),
      color: color.background,
      surfaceTintColor: color.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items,
      ),
    );
  }
}
