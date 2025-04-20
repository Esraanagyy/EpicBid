import 'package:epicBid/widgets/text_form_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 440,
      height: 418,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      child: Column(
        children: [
          Image.asset('assets/images/credit.png'),
          const SizedBox(height: 20,),
          TextFormFieldWidget(text: 'Name on Card'),
          TextFormFieldWidget(text: 'Card Number'),
          TextFormFieldWidget(text: 'CCv'),
          TextFormFieldWidget(text: 'Exception'),
        ],
      ),
    );
  }
}
