import 'package:epicBid/pages/payment_done.dart';
import 'package:epicBid/widgets/check_widget.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../widgets/credit_card_widget.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});
  static String id = 'check out';

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  bool visaCheck = false;
  bool payCheck = false;
  bool cashCheck = false;
  bool termCheck = false;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);

    // Retrieve totalPrice from navigation arguments
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final double totalPrice = args?['totalPrice'] ?? 0.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            lang?.checkOut ?? '',
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckWidget(totalPrice: totalPrice),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 25),
            child: Text(
              lang?.howYouLikeToPay ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Intel',
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 18, bottom: 5),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      visaCheck = !visaCheck;
                    });
                  },
                  child: visaCheck
                      ? Image.asset('assets/icons/check.png')
                      : Image.asset('assets/icons/not check.png'),
                ),
                const SizedBox(width: 8),
                Text(
                  lang?.creditCard ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Intel',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                              top: 20,
                              left: 16,
                              right: 16,
                            ),
                            child:
                                const CreditCardWidget(), // Replace with your actual container
                          );
                        });
                  },
                  child: Image.asset('assets/icons/visa.png'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, bottom: 5),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      payCheck = !payCheck;
                    });
                  },
                  child: payCheck
                      ? Image.asset('assets/icons/check.png')
                      : Image.asset('assets/icons/not check.png'),
                ),
                const SizedBox(width: 8),
                Text(
                  lang?.payPal ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Intel',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset('assets/icons/paypal.png'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, bottom: 5),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      cashCheck = !cashCheck;
                    });
                  },
                  child: cashCheck
                      ? Image.asset('assets/icons/check.png')
                      : Image.asset('assets/icons/not check.png'),
                ),
                const SizedBox(width: 8),
                Text(
                  lang?.cashService ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Intel',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset('assets/icons/cash.png'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      termCheck = !termCheck;
                    });
                  },
                  child: termCheck
                      ? Image.asset('assets/icons/green_check.png')
                      : Image.asset('assets/icons/not check.png'),
                ),
                const SizedBox(width: 8),
                Text(
                  lang?.youAcceptTerms ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Intel',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
        child: InkWell(
          onTap: () {
            if (termCheck && (visaCheck || payCheck || cashCheck)) {
              Navigator.pushNamed(
                context,
                PaymentDone.id,
                arguments: {'totalPrice': totalPrice},
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text(
                        'Please select a payment method and accept terms')),
              );
            }
          },
          child: Container(
            width: 404,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/icons/circular_cart.png'),
                Text(
                  lang?.pay ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset('assets/icons/right_arrow.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
