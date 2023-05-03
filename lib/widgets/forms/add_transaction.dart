import 'package:expenses_app/widgets/text_field/text_field.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTextField(hint: "Transaction name"),
          CustomTextField(
            hint: "Transaction value (\$)",
            inputType: const TextInputType.numberWithOptions(decimal: true),
          ),
        ],
      ),
    );
  }
}
