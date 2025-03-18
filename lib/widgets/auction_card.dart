import 'package:epicBid/pages/auction_details_page.dart';
import 'package:flutter/material.dart';

class AuctionCard extends StatelessWidget {
  AuctionCard({
    super.key,
    required this.color,
    required this.productName,
    required this.image,
    required this.price,
    required this.height,
  });

  Color color;
  String image;
  String productName;
  String price;
  double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AuctionDetailsPage.id);
      },
      child: Container(
        width: 194,
        height: height,
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
            const Padding(
              padding: EdgeInsets.only(
                top: 95,
                left: 169,
              ),
              child: RotatedBox(
                quarterTurns: 1,
                child: Text(
                  '3 Days 22 Hours',
                  style: TextStyle(
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
                left: 40,
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
                top: 193,
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
      ),
    );
  }
}
