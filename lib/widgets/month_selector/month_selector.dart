import 'package:expenses_app/widgets/month_selector/month_selector_item.dart';
import 'package:flutter/material.dart';

class MonthSelector extends StatefulWidget {
  MonthSelector({super.key});

  final Map<String, int> months = {
    "January": 0,
    "February": 1,
    "March": 2,
    "April": 3,
    "May": 4,
    "June": 5,
    "July": 6,
    "August": 7,
    "September": 8,
    "October": 9,
    "November": 10,
    "December": 11,
  };

  @override
  State<MonthSelector> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  PageController _pageController = PageController();
  int currentPage = DateTime.now().month - 1;
  @override
  void initState() {
    _pageController = PageController(
      initialPage: currentPage,
      viewportFraction: 0.4,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(50.0),
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          return MonthItem(
            monthName: widget.months.keys.elementAt(index),
            monthPosition: widget.months.values.elementAt(index),
            isCurrent: currentPage == widget.months.values.elementAt(index),
          );
        },
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }
}
