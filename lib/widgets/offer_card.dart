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
    // Get screen dimensions
    final size = MediaQuery.of(context).size;
    final double horizontalPadding = size.width * 0.05; // 5% of screen width
    final double verticalPadding = size.height * 0.03; // 3% of screen height

    return Padding(
      padding: EdgeInsets.only(
        top: verticalPadding,
        left: horizontalPadding,
        right: horizontalPadding,
      ),
      child: Container(
        width: size.width * 0.9, // 90% of screen width
        height: size.height * 0.12, // 12% of screen height
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: size.height * -0.06, // Scaled offset
              child: Image.asset(
                image,
                width: size.width * 0.35, // Scaled image size
                height: size.width * 0.35,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.02,
                left: size.width * 0.38, // Scaled text position
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
              padding: EdgeInsets.only(
                top: size.height * 0.06,
                left: size.width * 0.38,
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
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.82, // Scaled icon position
                top: size.height * 0.04,
              ),
              child: const ImageIcon(
                AssetImage("assets/icons/heart.png"),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
