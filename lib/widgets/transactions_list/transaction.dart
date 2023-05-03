import 'package:flutter/material.dart';

enum TransactionType {
  mounthlyBill,
  subscriptionFee,
  oneTimePayement,
}

Map<TransactionType, String> transactionTypes = {
  TransactionType.mounthlyBill: "Mounthly Bill",
  TransactionType.subscriptionFee: "Subscription Fee",
  TransactionType.oneTimePayement: "One Time Payement"
};

// ignore: must_be_immutable
class Transaction extends StatelessWidget {
  String name;
  IconData icon;
  String amount;
  TransactionType type;

  Transaction({
    super.key,
    required this.name,
    required this.icon,
    required this.amount,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var text = Theme.of(context).textTheme;

    return ListTile(
      leading: Icon(icon),
      iconColor: color.primary,
      title: Text(name),
      trailing: Text(
        "\$$amount",
        style: text.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(transactionTypes[type]!),
    );
  }
}
