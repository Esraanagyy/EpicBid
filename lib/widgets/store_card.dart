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
    return Container(
      width: 194,
      height: 200,
      decoration: BoxDecoration(
        color: color,
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
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 230,
              left: 70,
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
