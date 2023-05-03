import 'package:expenses_app/widgets/transactions_list/transaction.dart';
import 'package:expenses_app/widgets/transactions_list/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    PageController transactionsPageController = PageController();

    List<Map<String, dynamic>> oneTimePayments = [
      {
        "name": "Meal",
        "icon": FontAwesomeIcons.spoon,
        "amount": 23.50,
        "type": TransactionType.oneTimePayement,
      }
    ];
    List<Map<String, dynamic>> subscriptions = [
      {
        "name": "Spotify",
        "icon": FontAwesomeIcons.spotify,
        "amount": 5.99,
        "type": TransactionType.subscriptionFee,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 260,
          width: MediaQuery.of(context).size.width,
          child: PageView(
            controller: transactionsPageController,
            children: [
              TransactionsList(
                data: subscriptions,
                type: ListType.subscriptions,
              ),
              TransactionsList(
                data: oneTimePayments,
                type: ListType.oneTimePayment,
              ),
            ],
          ),
        ),
        Center(
          child: SmoothPageIndicator(
            controller: transactionsPageController,
            effect: WormEffect(activeDotColor: color.primary),
            count: 2,
          ),
        )
      ],
    );
  }
}
