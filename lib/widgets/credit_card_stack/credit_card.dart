import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

// ignore: must_be_immutable
class CreditCard extends StatefulWidget {
  String cardNumber, expiryDate, cardHolderName, cvvCode;
  CardType cardType;
  Color? cardBgColor;
  CreditCard({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    this.cardType = CardType.americanExpress,
    this.cardBgColor,
  });

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;

    void onChange(CreditCardBrand brand) {
      print(brand.brandName);
    }

    return CreditCardWidget(
      cardNumber: widget.cardNumber,
      expiryDate: widget.expiryDate,
      cardHolderName: widget.cardHolderName,
      cvvCode: widget.cvvCode,
      onCreditCardWidgetChange: onChange,
      showBackView: false,
      obscureCardCvv: false,
      cardBgColor: widget.cardBgColor ?? color.primary,
      cardType: widget.cardType,
      isChipVisible: false,
      isHolderNameVisible: true,
      isSwipeGestureEnabled: false,
    );
  }
}
