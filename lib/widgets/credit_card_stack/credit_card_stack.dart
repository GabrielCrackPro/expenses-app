import 'package:expenses_app/widgets/credit_card_stack/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CreditCardStack extends StatefulWidget {
  const CreditCardStack({super.key});

  @override
  State<CreditCardStack> createState() => _CreditCardStackState();
}

class _CreditCardStackState extends State<CreditCardStack> {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var text = Theme.of(context).textTheme;

    PageController controller = PageController();
    List<Map<String, dynamic>> cards = [
      {
        "cardNumber": "378282246310005",
        "expiryDate": "6/24",
        "cardHolderName": "Card holder",
        "cvvCode": "023",
        "cardType": CardType.visa
      },
      {
        "cardNumber": "378282246310005",
        "expiryDate": "6/24",
        "cardHolderName": "Card holder",
        "cvvCode": "023",
        "cardType": CardType.visa
      }
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 240,
          child: PageView.builder(
            itemBuilder: (context, index) {
              Map<String, dynamic> card = cards[index];
              return CreditCard(
                cardNumber: card["cardNumber"],
                expiryDate: card["expiryDate"],
                cardHolderName: card["cardHolderName"],
                cvvCode: card["cvvCode"],
                cardType: card["cardType"],
              );
            },
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
          ),
        ),
        Center(
          child: SmoothPageIndicator(
            controller: controller,
            count: cards.length,
            effect: JumpingDotEffect(
              dotHeight: 12,
              dotWidth: 12,
              jumpScale: 0.3,
              verticalOffset: 15,
              activeDotColor: color.primary,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, bottom: 5),
          child: const Text(
            "Total balance",
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            "\$32,429.23",
            style: text.displayLarge!.copyWith(fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
