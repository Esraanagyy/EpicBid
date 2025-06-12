import 'package:flutter/material.dart';

class AuctionCard extends StatelessWidget {
  AuctionCard({
    super.key,
    required this.productName,
    required this.image,
    required this.price,
    required this.startTime,
    required this.endTime,
  });

  String image;
  String productName;
  String price;
  String startTime;
  String endTime;

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
        color: Colors.grey.shade200,
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
              top: padding * 0.8, // Slightly higher than image
              left: padding * 0.5, // Closer to left edge
            ),
            child: const ImageIcon(
              AssetImage("assets/icons/user.png"),
              color: Colors.black,
              size: 16, // Smaller for responsiveness
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
              size: 16, // Smaller for responsiveness
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: padding * 1.2,
              left: padding * 1.5, // Aligned with user icon
            ),
            child: const Text(
              '(12 user)',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 10, // Reduced for smaller screens
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: cardHeight * 0.15, // Scaled position
              left: cardWidth * 0.82, // Near right edge
            ),
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                startTime,
                style: const TextStyle(
                  color: Color(0xff2D5356),
                  fontFamily: 'Inter',
                  fontSize: 10, // Reduced for smaller screens
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: cardHeight * 0.55, // Scaled position
              left: cardWidth * 0.82, // Near right edge
            ),
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                endTime,
                style: const TextStyle(
                  color: Color(0xff2D5356),
                  fontFamily: 'Inter',
                  fontSize: 10, // Reduced for smaller screens
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: cardHeight * 0.65, // Within card
              left: padding,
            ),
            child: Text(
              productName,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.ellipsis,
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
                fontSize: 16, // Reduced slightly for fit
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
