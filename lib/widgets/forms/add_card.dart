import 'package:expenses_app/widgets/credit_card_stack/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:go_router/go_router.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Card added"),
          backgroundColor: Colors.green,
          dismissDirection: DismissDirection.up,
          duration: Duration(seconds: 1),
          elevation: 2,
        ),
      );
      GoRouter.of(context).pop();
    } else {
      setState(() {
        cardNumber = "";
        expiryDate = "";
        cardHolderName = "";
        cvvCode = "";
        isCvvFocused = false;
      });
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;

    InputBorder enabledBorder = OutlineInputBorder(
      borderSide: BorderSide(color: color.primary),
    );
    InputBorder errorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: color.error),
    );

    return Scaffold(
      body: Column(
        children: [
          CreditCard(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CreditCardForm(
                    formKey: formKey,
                    obscureCvv: true,
                    obscureNumber: true,
                    cardNumber: cardNumber,
                    cvvCode: cvvCode,
                    isHolderNameVisible: true,
                    isCardNumberVisible: true,
                    isExpiryDateVisible: true,
                    cardHolderName: cardHolderName,
                    expiryDate: expiryDate,
                    themeColor: color.primary,
                    textColor: color.onBackground,
                    cardNumberDecoration: InputDecoration(
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                      hintStyle: TextStyle(color: color.primary),
                      labelStyle: TextStyle(color: color.primary),
                      focusedBorder: enabledBorder,
                      focusedErrorBorder: errorBorder,
                      enabledBorder: enabledBorder,
                      errorBorder: errorBorder,
                    ),
                    expiryDateDecoration: InputDecoration(
                      labelText: 'Expired Date',
                      hintText: 'XX/XX',
                      hintStyle: TextStyle(color: color.primary),
                      labelStyle: TextStyle(color: color.primary),
                      focusedBorder: enabledBorder,
                      enabledBorder: enabledBorder,
                      errorBorder: errorBorder,
                      focusedErrorBorder: errorBorder,
                    ),
                    cvvCodeDecoration: InputDecoration(
                      labelText: 'CVV',
                      hintText: 'XXX',
                      hintStyle: TextStyle(color: color.primary),
                      labelStyle: TextStyle(color: color.primary),
                      focusedBorder: enabledBorder,
                      enabledBorder: enabledBorder,
                      errorBorder: errorBorder,
                      focusedErrorBorder: errorBorder,
                    ),
                    cardHolderDecoration: InputDecoration(
                      labelText: 'Card Holder',
                      labelStyle: TextStyle(color: color.primary),
                      focusedBorder: enabledBorder,
                      enabledBorder: enabledBorder,
                      errorBorder: errorBorder,
                      focusedErrorBorder: errorBorder,
                    ),
                    onCreditCardModelChange: onCreditCardModelChange,
                    autovalidateMode: AutovalidateMode.always,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: _onValidate,
                    child: Container(
                      color: color.primary,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Add Card',
                        style: TextStyle(
                          color: color.onPrimary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
