import 'package:flutter/material.dart';

class FlashOfferCard extends StatelessWidget {
  const FlashOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        bottom: 25,
        left: 40,
        right: 40,
      ),
      child: Container(
        width: 360,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xff468286),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -32,
              left: 301,
              child: CircleAvatar(
                radius: 51,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 152,
              left: 97,
              child: CircleAvatar(
                radius: 51,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: -52,
              left: -3,
              child: CircleAvatar(
                radius: 51,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 169),
              child: Image.asset(
                "assets/images/offer table.png",
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 55,
                left: 130,
              ),
              child: Image.asset(
                "assets/images/flash.png",
                width: 32,
                height: 32,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 35,
                left: 70,
              ),
              child: Text(
                "Flash",
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 65,
                left: 70,
              ),
              child: Text(
                "Offer",
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 105,
                left: 50,
              ),
              child: Image.asset(
                "assets/images/time.png",
                width: 24,
                height: 24,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 105,
                left: 80,
              ),
              child: Text(
                "End Time",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 145,
                left: 30,
              ),
              child: Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  '12 h',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 145,
                left: 90,
              ),
              child: Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  '36 M',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 145,
                left: 150,
              ),
              child: Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  '46 S',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
