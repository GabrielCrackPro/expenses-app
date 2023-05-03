import 'package:expenses_app/widgets/categories_list/categories_list.dart';
import 'package:expenses_app/widgets/expenses/expenses.dart';
import 'package:expenses_app/widgets/fab/fab.dart';
import 'package:expenses_app/widgets/graph/graph.dart';
import 'package:expenses_app/widgets/month_selector/month_selector.dart';
import 'package:flutter/material.dart';
import 'package:expenses_app/widgets/bottom_appbar/bottom_appbar.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  bool isCircularGraph;
  HomePage({super.key, required this.isCircularGraph});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool isCircularGraph;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomAppbar(),
      floatingActionButton: CustomFloatingActionButton(context: context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Column(
          children: [
            MonthSelector(),
            const Expenses(),
            Graph(isCircular: widget.isCircularGraph),
            const Expanded(
              child: Categories(),
            ),
          ],
        ),
      ),
    );
  }
}
