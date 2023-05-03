import 'package:expenses_app/widgets/bottom_appbar/bottom_appbar.dart';
import 'package:expenses_app/widgets/fab/fab.dart';
import 'package:expenses_app/widgets/forms/add_card.dart';
import 'package:expenses_app/widgets/forms/add_transaction.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddExtrasPage extends StatefulWidget {
  const AddExtrasPage({super.key});

  @override
  State<AddExtrasPage> createState() => _AddExtrasPageState();
}

class _AddExtrasPageState extends State<AddExtrasPage> {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    PageController actualFormController = PageController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
        backgroundColor: color.background,
        foregroundColor: color.primary,
      ),
      floatingActionButton: CustomFloatingActionButton(context: context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppbar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 220,
              child: PageView(
                controller: actualFormController,
                children: const [
                  AddCard(),
                  AddTransaction(),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: actualFormController,
              count: 2,
              effect: WormEffect(
                activeDotColor: color.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
