import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  StoreCard({
    super.key,
    required this.color,
    required this.productName,
    required this.image,
    required this.price,
  });
  Color color;
  String image;
  String productName;
  String price;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final size = MediaQuery.of(context).size;
    final double cardWidth = size.width * 0.45; // 45% of screen width
    final double cardHeight = size.width * 0.6; // Proportional to width
    final double padding = size.width * 0.06; // 6% of screen width

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(62),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: padding,
              left: padding,
            ),
            child: Image.asset(
              image,
              width: size.width * 0.32, // Scaled image size
              height: size.width * 0.32,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: padding,
              left: cardWidth * 0.78, // Scaled icon position
            ),
            child: const ImageIcon(
              AssetImage("assets/icons/heart.png"),
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: cardHeight * 0.65, // Positioned within card
              left: padding,
            ),
            child: Text(
              productName,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.ellipsis, // Prevent text overflow
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: cardHeight * 0.80, // Below productName
              left: padding,
            ),
            child: Text(
              price,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis, // Prevent text overflow
            ),
          ),
        ],
      ),
    );
  }
}
