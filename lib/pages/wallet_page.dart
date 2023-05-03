import 'package:expenses_app/widgets/bottom_appbar/bottom_appbar.dart';
import 'package:expenses_app/widgets/credit_card_stack/credit_card_stack.dart';
import 'package:expenses_app/widgets/fab/fab.dart';
import 'package:expenses_app/widgets/transactions_list/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet"),
        backgroundColor: color.background,
        actions: [
          IconButton(
            onPressed: () => GoRouter.of(context).push("/add-extras"),
            icon: Icon(
              Icons.add,
              color: color.primary,
            ),
          )
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(context: context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppbar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CreditCardStack(),
            Transactions(),
          ],
        ),
      ),
    );
  }
}
