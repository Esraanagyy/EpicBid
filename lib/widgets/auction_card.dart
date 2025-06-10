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
    return Container(
      width: 194,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(62),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 27,
              left: 26,
            ),
            child: Image.asset(
              image,
              width: 143,
              height: 143,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 15,
            ),
            child: ImageIcon(
              AssetImage(
                "assets/icons/user.png",
              ),
              color: Colors.black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 27,
              left: 150,
            ),
            child: ImageIcon(
              AssetImage(
                "assets/icons/heart.png",
              ),
              color: Colors.white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 27,
              left: 40,
            ),
            child: Text(
              '(12 user)',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 169,
            ),
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                startTime,
                style: const TextStyle(
                  color: Color(0xff2D5356),
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 150,
              left: 169,
            ),
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                endTime,
                style: const TextStyle(
                  color: Color(0xff2D5356),
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 170,
              left: 20,
            ),
            child: Text(
              productName,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 220,
              left: 60,
            ),
            child: Text(
              price,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
