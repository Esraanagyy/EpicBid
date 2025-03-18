import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  OfferCard({
    super.key,
    required this.productName,
    required this.image,
    required this.price,
    required this.color,
  });
  String image;
  String productName;
  String price;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        left: 18,
        right: 18,
      ),
      child: Container(
        width: 404,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -50,
              child: Image.asset(
                image,
                width: 160,
                height: 160,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 18,
                left: 155,
              ),
              child: Text(
                productName,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 170,
              ),
              child: Text(
                price,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 341,
                top: 34,
              ),
              child: ImageIcon(
                AssetImage("assets/icons/heart.png"),
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
