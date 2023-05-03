import 'package:expenses_app/widgets/list_separator/list_separator.dart';
import 'package:expenses_app/widgets/transactions_list/transaction.dart';
import 'package:flutter/material.dart';

enum ListType { subscriptions, oneTimePayment }

// ignore: must_be_immutable
class TransactionsList extends StatelessWidget {
  TransactionsList({
    super.key,
    required this.data,
    required this.type,
  });

  List<Map<String, dynamic>> data;
  ListType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(type.name),
        ListView.separated(
          separatorBuilder: (context, index) {
            return const ListSeparator();
          },
          itemBuilder: (context, index) {
            Map<String, dynamic> transaction = data[index];
            return Transaction(
              name: transaction["name"],
              amount: transaction["amount"].toString(),
              type: transaction["type"],
              icon: transaction["icon"],
            );
          },
          itemCount: data.length,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
