import 'package:epicBid/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../l10n/app_localizations.dart';

class PaymentDone extends StatelessWidget {
  const PaymentDone({super.key});
  static String id = 'pay';

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 190,
            ),
            Text(
              lang?.paymentDone ?? '',
              style: const TextStyle(
                color: Color(0xff2D5356),
                fontFamily: 'Inter',
                fontSize: 52,
                fontWeight: FontWeight.w400,
              ),
            ),
            Lottie.asset('assets/images/pay.json'),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, HomePage.id);
              },
              child: Container(
                width: 200,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xff2D5356),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/icons/left_double_arrow.png'),
                    Text(
                      lang?.backToHome ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
